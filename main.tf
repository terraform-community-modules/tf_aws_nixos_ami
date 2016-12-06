### Inputs ###

variable "release" {
  description = "NixOS release"
  default     = "16.09"
}

# Valid values: ebs, instance-store
variable "root_device_type" {
  description = "Root device type"
  default     = "ebs"
}

# Valid values: hvm, paravirtual
variable "virtualization_type" {
  description = "Virtualization type"
  default     = "hvm"
}

### Main ###

data "aws_ami" "x" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nixos-${var.release}*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["${var.virtualization_type}"]
  }

  filter {
    name   = "root-device-type"
    values = ["${var.root_device_type}"]
  }

  owners = [
    "080433136561",
  ]
}

### Output ###

output "ami_id" {
  value = "${data.aws_ami.x.id}"
}
