data "akamai_group" "sc_group" {
     group_name   = "Akamai Professional Services-1-1NC95D"
     contract_id  = "1-1NC95D"
}

output "sc_group_id" {
    value = data.akamai_group.sc_group.id
}

variable "ab_test" {
  type        = string
  description = "origin value"
  default = "A"
}

locals {
  app_hostnames = {for apps in var.apps : "${apps}" => "${apps}.customer.com"}
}
 
output "hostname" {
  value = local.app_hostnames
}