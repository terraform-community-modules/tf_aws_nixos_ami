tf_aws_nixos_ami
================

Terraform module to get the current set of publicly available nixos AMIs.

## Input variables

  * release - E.g. 16.04
  * root_device_type - ebs | instance-store
  * virtualization_type - hvm | paravirtual

NOTE: the AWS region is selected when configuring the aws provider.

## Outputs

  * ami_id

## Example use

    module "ami" {
      source = "github.com/terraform-community-modules/tf_aws_nixos_ami"
      release = "16.04"
    }

    resource "aws_instance" "web" {
      ami = "${module.ami.ami_id}"
      instance_type = "m3.8xlarge"
    }

## License

Apache2 - see the included LICENSE file for more details.

