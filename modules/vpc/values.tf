variable "vpc_name" { type = string }
variable "cidr_block" { type = string }
variable "enable_dns_support" { type = bool }
variable "az" { type = list(string) }
variable "enable_dns_hostnames" { type = bool }
variable "map_public_ip_on_launch" { type = bool }
variable "cluster_name" { type = string }