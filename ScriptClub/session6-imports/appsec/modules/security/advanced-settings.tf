resource "akamai_botman_client_side_security" "client_side_security" {
  config_id = local.config_id
  client_side_security = jsonencode(
    {
      "useAllSecureTraffic" : true,
      "useSameSiteCookies" : true,
      "useStrictCspCompatibility" : false
    }
  )
}

resource "akamai_botman_transactional_endpoint_protection" "transactional_endpoint_protection" {
  config_id = local.config_id
  transactional_endpoint_protection = jsonencode(
    {
      "inlineTelemetry" : {
        "aggressiveThreshold" : 90,
        "detectionSetType" : "BOT_SCORE",
        "safeguardAction" : "USE_STRICT_ACTION",
        "strictThreshold" : 50
      },
      "sdkTelemetry" : {
        "androidAggressiveThreshold" : 90,
        "androidStrictThreshold" : 50,
        "detectionSetType" : "BOT_SCORE_SDK",
        "iosAggressiveThreshold" : 90,
        "iosStrictThreshold" : 50,
        "safeguardAction" : "USE_STRICT_ACTION"
      },
      "standardTelemetry" : {
        "aggressiveThreshold" : 90,
        "detectionSetType" : "BOT_SCORE",
        "safeguardAction" : "USE_STRICT_ACTION",
        "strictThreshold" : 50
      }
    }
  )
}

resource "akamai_apr_user_risk_response_strategy" "user_risk_response_strategy" {
  config_id = local.config_id
  user_risk_response_strategy = jsonencode(
    {
      "traffic" : {
        "inline" : {
          "aggressive" : {
            "threshold" : 90
          },
          "cautious" : {
            "threshold" : 30
          },
          "strict" : {
            "threshold" : 70
          }
        },
        "nativeSdkAndroid" : {
          "aggressive" : {
            "threshold" : 90
          },
          "cautious" : {
            "threshold" : 30
          },
          "strict" : {
            "threshold" : 70
          }
        },
        "nativeSdkIos" : {
          "aggressive" : {
            "threshold" : 90
          },
          "cautious" : {
            "threshold" : 30
          },
          "strict" : {
            "threshold" : 70
          }
        },
        "standard" : {
          "aggressive" : {
            "threshold" : 90
          },
          "cautious" : {
            "threshold" : 30
          },
          "strict" : {
            "threshold" : 70
          }
        }
      }
    }
  )
}
