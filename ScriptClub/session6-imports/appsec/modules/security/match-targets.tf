resource "akamai_appsec_match_target" "website_10961902" {
  config_id = local.config_id
  match_target = jsonencode(
    {
      "defaultFile" : "NO_MATCH",
      "filePaths" : [
        "/*"
      ],
      "hostnames" : [
        "mmongemu.ps.com"
      ],
      "isNegativeFileExtensionMatch" : false,
      "isNegativePathMatch" : false,
      "securityPolicy" : {
        "policyId" : akamai_appsec_security_policy.mmtestpolicy.security_policy_id
      },
      "sequence" : 0,
      "type" : "website"
    }
  )
}
