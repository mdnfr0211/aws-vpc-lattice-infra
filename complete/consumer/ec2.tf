module "ec2" {
  source = "../../modules/app/ec2"

  instance_name     = format("%s-%s", var.instance_name, var.env)
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = module.vpc.private_subnet_ids[0]
  sg_ids = [
    module.sg.security_group_id
  ]
  iam_instance_profile = module.iam.iam_profile_arn
  ebs_volumes          = {}
  kms_key_arn          = data.aws_kms_key.ebs.arn
}
