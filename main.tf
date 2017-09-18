#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-1d4e7a66
#
# Your subnet ID is:
#
#     subnet-27f55043
#
# Your security group ID is:
#
#     sg-e72efe94
#
# Your Identity is:
#
#     terraform-heron
#

provider "aws" {
  access_key = "AKIAJU6MRGSIJDKTVJYQ"
  secret_key = "MSM75ZhcPrz0+1GzUuQNIz+RS6A7F6CdlGiPcsew"
  region     = "us-east-1"
}

terraform {
  backend "atlas" {
    name = "anandkdaga/training"
  }
}

/*module "example-module" {
  source  = "./example-module"
  command = "echo Goodbye world"
}
*/
resource "aws_instance" "web" {
  # ...
  count                  = "${var.num_webs}"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-27f55043"
  vpc_security_group_ids = ["sg-e72efe94"]
  ami                    = "ami-1d4e7a66"

  tags {
    #
    "Identity" = "..."
    "Foo"      = "bar"
    "Zip"      = "zap"
    "Name"     = "web ${count.index+1}/${var.num_webs}"
  }
}

output "public_ip" {
  value = "${aws_instance.web.*.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.*.public_dns}"
}
