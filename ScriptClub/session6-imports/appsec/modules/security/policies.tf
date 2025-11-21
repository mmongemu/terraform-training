resource "akamai_appsec_security_policy" "mmtestpolicy" {
  config_id              = local.config_id
  default_settings       = true
  security_policy_name   = "mm-test-policy"
  security_policy_prefix = "waf1"
}

