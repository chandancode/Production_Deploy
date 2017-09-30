provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
#  region     = "ap-south-1"
}


module "vpc" {
  source = "github.com/chandancode/terramodules/base"
#  source = "../modules/base"

}


module "ec2_pro" {
  source = "github.com/chandancode/terramodules/server"
#  source = "../modules/server"
  modname = "t2.micro"
  awssecgp = "${module.vpc.security_group_id}"
  awssub = "${module.vpc.public_subnet_id}"

}

module "ec2_pro_new" {
  source = "github.com/chandancode/terramodules/server"
#  source = "../modules/server"
  modname = "t2.micro"
  awssecgp = "${module.vpc.security_group_id}"
  awssub = "${module.vpc.private_subnet_id}"

}


module "ec_puppet_provisioner" {
  source  = "github.com/chandancode/terramodules/puppetmasterpro"
  modname = "t2.medium"
  awssecgp = "${module.vpc.security_group_id}"
  awssub = "${module.vpc.public_subnet_id}"

}

#module "ellb" {

#  source = "github.com/chandancode/myproject/elb"
#  security_groups = "${module.vpc.security_group_id}"
#  subnet_id =  "${module.vpc.private_subnet_id}"

#}

