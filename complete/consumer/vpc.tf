module "vpc" {
  source = "../../modules/base/vpc"

  vpc_name = format("%s-%s", var.vpc_name, var.env)
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
}
