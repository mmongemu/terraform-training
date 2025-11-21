// IP/GEO/ASN Firewall
resource "akamai_appsec_ip_geo" "mmtestpolicy" {
  config_id                  = local.config_id
  security_policy_id         = akamai_appsec_ip_geo_protection.mmtestpolicy.security_policy_id
  mode                       = "block"
  ukraine_geo_control_action = "none"
}

