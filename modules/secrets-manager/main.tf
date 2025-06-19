# Generate a random password for the database
resource "random_password" "db_password" {
  length  = var.password_length
  special = true
  upper   = true
  lower   = true
  numeric = true
}

# Create the secret in AWS Secrets Manager with a unique name
resource "aws_secretsmanager_secret" "db_credentials" {
  name                    = "${var.secret_name}-${random_id.suffix.hex}"
  description             = var.secret_description
  recovery_window_in_days = var.recovery_window_in_days

  tags = var.tags
}

# Generate a random suffix to avoid name collisions
resource "random_id" "suffix" {
  byte_length = 4
}

# Store the credentials in the secret
resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = var.username
    password = random_password.db_password.result
  })
}

# Create IAM policy for accessing the secret
resource "aws_iam_policy" "secrets_access" {
  count = var.create_access_policy ? 1 : 0

  name        = "${var.secret_name}-access-policy"
  description = "Policy to access database credentials secret"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = aws_secretsmanager_secret.db_credentials.arn
      }
    ]
  })

  tags = var.tags
}
