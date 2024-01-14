
locals {
  ec2_name           = "${var.project_name}-${var.environment}"
  database_subnets_id = element(split(",", data.aws_ssm_parameter.database_subnets_ids.value), 0)
}