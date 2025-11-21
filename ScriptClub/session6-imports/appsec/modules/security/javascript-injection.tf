resource "akamai_botman_javascript_injection" "mmtestpolicy" {
  config_id          = local.config_id
  security_policy_id = akamai_botman_bot_management_settings.mmtestpolicy.security_policy_id
  javascript_injection = jsonencode(
    {
      "injectJavaScript" : "AROUND_PROTECTED_OPERATIONS",
      "rules" : []
    }
  )
}

