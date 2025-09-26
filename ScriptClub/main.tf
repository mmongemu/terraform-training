data "akamai_group" "sc_group" {
     group_name   = "Script Club"
     contract_id  = "1-5C13O2"
}

output "sc_group" {
    value = data.akamai_group.sc_group
}

data "akamai_appsec_configuration" "sec_configuration" {
    name = "bucktest"
}

output "appsec_config" {
  value = data.akamai_appsec_configuration.sec_configuration
}

ata "akamai_property" "mmmongemu_property" {
  name    = "mmongemu-scriptclub"
  version = "7"
}

output "my_property" {
  value = data.akamai_property.mmmongemu_property
}