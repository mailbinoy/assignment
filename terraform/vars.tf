#Global vars
variable "aws_region" {}
variable "desktop_ip" {}

#Network Vars
variable "vpc_cidr" {}
variable "azs" {}
variable "private_subnets" {}
variable "public_subnets" {}

#Instance Vars
variable "instance_type" {}
