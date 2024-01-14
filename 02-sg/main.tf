#mongodb
module "mongodb" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for mongodb"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mongodb"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

#cart
module "cart" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for cart"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "cart"
    
}

#redis
module "redis" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for redis"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "redis"
    
}

#catalogue
module "catalogue" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for catalogue"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "catalogue"
    
}

#user
module "user" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for user"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "user"
    
}

#mysql
module "mysql" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for mysql"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "mysql"
    
}

#shipping
module "shipping" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for shipping"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "shipping"
    #sg_ingress_rules = var.mongodb_sg_ingress_rules
}

#payment
module "payment" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for payment"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "payment"
    
}

#rabbitmq
module "rabbitmq" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for rabbitmq"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "rabbitmq"
    
}

#web
module "web" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for web"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "web"
    
}

#dispatch
module "dispatch" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_description = "sg for dispatch"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = "dispatch"
    
}


#mongodb accepting connection  from catalogue instances
resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}

#mongodb accepting connection  from user instances
resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}

#redis accepting connection  from user instances
resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}

#redis accepting connection  from cart instances
resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}