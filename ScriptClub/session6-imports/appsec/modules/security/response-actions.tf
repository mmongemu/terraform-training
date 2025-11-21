resource "akamai_botman_challenge_injection_rules" "challenge_injection_rules" {
  config_id = local.config_id
  challenge_injection_rules = jsonencode(
    {
      "ajaxResubmit" : false,
      "injectJavaScript" : false
    }
  )
}

