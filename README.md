## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora"></a> [aurora](#module\_aurora) | ./modules/aurora | n/a |
| <a name="module_secrets_manager"></a> [secrets\_manager](#module\_secrets\_manager) | ./modules/secrets-manager | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/security | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks allowed to access the database | `list(string)` | `[]` | no |
| <a name="input_allowed_security_groups"></a> [allowed\_security\_groups](#input\_allowed\_security\_groups) | List of security group IDs allowed to access the database | `list(string)` | `[]` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones to use for the subnets | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The backup retention period | `number` | `7` | no |
| <a name="input_cluster_parameters"></a> [cluster\_parameters](#input\_cluster\_parameters) | A list of cluster parameters to apply | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy all Cluster tags to snapshots | `bool` | `true` | no |
| <a name="input_create_cluster_parameter_group"></a> [create\_cluster\_parameter\_group](#input\_create\_cluster\_parameter\_group) | Whether to create a cluster parameter group | `bool` | `false` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | Whether to create a DB parameter group | `bool` | `false` | no |
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Whether to create KMS key for encryption | `bool` | `true` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the database to create when the DB instance is created | `string` | `null` | no |
| <a name="input_database_port"></a> [database\_port](#input\_database\_port) | The port on which the DB accepts connections | `number` | `3306` | no |
| <a name="input_database_username"></a> [database\_username](#input\_database\_username) | Database master username | `string` | `"admin"` | no |
| <a name="input_db_parameters"></a> [db\_parameters](#input\_db\_parameters) | A list of DB parameters to apply | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If the DB instance should have deletion protection enabled | `bool` | `true` | no |
| <a name="input_enable_enhanced_monitoring"></a> [enable\_enhanced\_monitoring](#input\_enable\_enhanced\_monitoring) | Whether to enable enhanced monitoring | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to cloudwatch | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine | `string` | `"aurora-mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | `"dev"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class to use | `string` | `"db.r6g.large"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances in the cluster | `number` | `2` | no |
| <a name="input_kms_key_deletion_window"></a> [kms\_key\_deletion\_window](#input\_kms\_key\_deletion\_window) | The waiting period, specified in number of days | `number` | `7` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key (if not creating new one) | `string` | `null` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval for collecting enhanced monitoring metrics | `number` | `60` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The DB parameter group family | `string` | `"aurora-mysql8.0"` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | Length of the generated password | `number` | `18` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | `true` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data | `string` | `null` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | The preferred backup window | `string` | `"03:00-04:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The preferred maintenance window | `string` | `"sun:04:00-sun:05:00"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | CIDR blocks for the private subnets | `list(string)` | <pre>[<br>  "10.0.11.0/24",<br>  "10.0.12.0/24"<br>]</pre> | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"demo-aurora"` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | CIDR blocks for the public subnets | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_secret_recovery_window"></a> [secret\_recovery\_window](#input\_secret\_recovery\_window) | Number of days that AWS Secrets Manager waits before it can delete the secret | `number` | `7` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted | `bool` | `false` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | Amazon Resource Name (ARN) of cluster |
| <a name="output_cluster_database_name"></a> [cluster\_database\_name](#output\_cluster\_database\_name) | Name for an automatically created database on cluster creation |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Writer endpoint for the cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The RDS Cluster Identifier |
| <a name="output_cluster_master_username"></a> [cluster\_master\_username](#output\_cluster\_master\_username) | The database master username |
| <a name="output_cluster_port"></a> [cluster\_port](#output\_cluster\_port) | The database port |
| <a name="output_cluster_reader_endpoint"></a> [cluster\_reader\_endpoint](#output\_cluster\_reader\_endpoint) | Reader endpoint for the cluster |
| <a name="output_connection_info"></a> [connection\_info](#output\_connection\_info) | Database connection information |
| <a name="output_instance_endpoints"></a> [instance\_endpoints](#output\_instance\_endpoints) | List of RDS instance endpoints |
| <a name="output_instance_identifiers"></a> [instance\_identifiers](#output\_instance\_identifiers) | List of RDS instance identifiers |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | The globally unique identifier for the key |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | IDs of the private subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | IDs of the public subnets |
| <a name="output_secret_arn"></a> [secret\_arn](#output\_secret\_arn) | ARN of the secret containing database credentials |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | Name of the secret containing database credentials |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the security group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |
