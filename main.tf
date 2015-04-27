variable "region" {}
variable "version" {
  default = "14.12"
}
variable "type" {}

output "ami_id" {
    value = "${lookup(var.all_amis, format(\"%s-%s-%s\", var.version, var.region, var.type))}"
}

