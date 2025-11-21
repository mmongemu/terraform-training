// Client Reputation Actions
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673415" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_high_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673417" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_high_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673419" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_high_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673421" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_attackers_low_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673423" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.dos_attackers_low_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673425" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.scanning_tools_low_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673427" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_low_threat.reputation_profile_id
  action                = "alert"
}
resource "akamai_appsec_reputation_profile_action" "mmtestpolicy_10673429" {
  config_id             = local.config_id
  security_policy_id    = akamai_appsec_reputation_protection.mmtestpolicy.security_policy_id
  reputation_profile_id = akamai_appsec_reputation_profile.web_scrapers_high_threat.reputation_profile_id
  action                = "alert"
}
