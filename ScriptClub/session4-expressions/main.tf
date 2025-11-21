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
  app_hostnames = {for apps in var.apps : "${apps}" => "${apps}.mmongemu-trsc.com"}
  notes         = "Script Club s4"
  email         = "mmongemu@akamai.com"
  app_edge_hostnames = {for hostnames in local.app_hostnames : "${hostnames}" => "${hostnames}.edgesuite.net"}

}

 
output "hostname" {
  value = local.app_hostnames
}
