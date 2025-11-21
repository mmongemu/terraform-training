// Enable/Disable Protections for policy mmtestpolicy
resource "akamai_appsec_waf_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_security_policy.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_api_constraints_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_waf_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_ip_geo_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_api_constraints_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_malware_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_ip_geo_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_rate_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_malware_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_reputation_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_rate_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_appsec_slowpost_protection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  enabled            = true
}

resource "akamai_botman_bot_management_settings" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_appsec_slowpost_protection.mmtestpolicy.security_policy_id
  bot_management_settings = jsonencode(
    {
      "addAkamaiBotHeader" : false,
      "enableActiveDetections" : true,
      "enableBotManagement" : true,
      "enableBrowserValidation" : false,
      "removeBotManagementCookies" : true,
      "thirdPartyProxyServiceInUse" : true
    }
  )
}
