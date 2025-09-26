data "akamai_group" "sc_group" {
     group_name   = "Script Club"
     contract_id  = "1-5C13O2"
}

output "sc_group_id" {
    value = data.akamai_group.sc_group.id
}

data "akamai_appsec_configuration" "sec_configuration" {
    name = "bucktest"
}

output "appsec_config_id" {
  value = data.akamai_appsec_configuration.sec_configuration.id
}

data "akamai_property" "mmmongemu_property" {
  name    = "mmongemu-scriptclub"
  version = "7"
}

output "my_property_id" {
  value = data.akamai_property.mmmongemu_property.id
}