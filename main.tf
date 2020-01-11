provider "aws"{
  region = var.region
}


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-nxgcloud-infra-development"
    key            = "global/infra/lampstack.tfstate"
    region         = "ap-south-1"
  }
}

data "aws_ami" "latest-ubuntu" {
most_recent = true
owners = ["099720109477"] # Canonical

  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}


module "web" {
  #source           = "github.com/Nareshcbit/terraform-ec2.git?ref=v0.2.0"
  source           = "git@github.com:Nareshcbit/terraform-ec2.git"
  ami              = "${data.aws_ami.latest-ubuntu.id}"
  instance_type    = "t2.micro"
  subnet_id        = var.web_subnet_id
  security_group_ids = var.web_security_group_ids
  instance_name      = "webserver"
  instance_count     = 2
  common_tags        = "${merge(var.global_tags,var.app_tags,var.opt_tags)}"
}
