tf_aws_nixos_ami
=================

Terraform module to get the current set of publicly available nixos AMIs.

This module grabs all of the AMIs listed at:

    https://nixos.org/wiki/NixOS_on_Amazon_EC2

and then looks up the one you want given the input variables

## Input variables

  * region - E.g. eu-central-1
  * version - E.g. 14.12
  * type -  s3/hvm/ebs

## Outputs

  * ami_id

## Example use

    module "ami" {
      source = "github.com/terraform-community-modules/tf_aws_nixos_ami"
      region = "eu-central-1"
      version = "14.12"
      type = "hvm"
    }

    resource "aws_instance" "web" {
      ami = "${module.ami.ami_id}"
      instance_type = "m3.8xlarge"
    }

## License

Apache2 - see the included LICENSE file for more details.

