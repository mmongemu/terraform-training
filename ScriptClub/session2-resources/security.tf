
# resource "akamai_appsec_configuration" "my_security_config" {
#   name          = "mmongemu-sc"
#   contract_id   = "1-1NC95D"
#   group_id      =  data.akamai_group.sc_group.id   
#   host_names    =  ["mmongemu.dsa.com"]
#   description   = "new config for Terraform SC training"
# }

# data "akamai_appsec_configuration" "my_security_config" {
#     name = "mmongemu-sc"
# }

# output "appsec_config_id" {
#   value = data.akamai_appsec_configuration.my_security_config.id
# }

# resource "akamai_appsec_security_policy" "my-sec-policy" {
#   config_id              = data.akamai_appsec_configuration.my_security_config.id
#   security_policy_name   = "mm-test-policy"
#   security_policy_prefix = "waf1"
# }

# data "akamai_appsec_security_policy" "my-sec-policy" {
#   security_policy_name = "mm-test-policy"
#   config_id            = data.akamai_appsec_configuration.my_security_config.id
# }    

# output "my-sec-policy_output" {
#         value = data.akamai_appsec_security_policy.my-sec-policy.id
# }

# resource "akamai_appsec_security_policy" "my-new-policy" {
#   config_id                      = data.akamai_appsec_configuration.my_security_config.id
#   security_policy_name           = "mm-test-policy-clone"
#   security_policy_prefix         = "waf2"
#   create_from_security_policy_id = data.akamai_appsec_security_policy.my-sec-policy.security_policy_id
# }