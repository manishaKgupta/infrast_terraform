
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-manisha-mongo-${each.key}"

  ami                    = "ami-0ada6d94f396377f2"
  instance_type          = "t3a.micro"
  key_name               = "manisha_mern_key"
  monitoring             = true
  vpc_security_group_ids = [resource.aws_security_group.Security-mongo-manisha.id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    owner = "manisha"
  }
}