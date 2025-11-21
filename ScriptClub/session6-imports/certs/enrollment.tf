terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

resource "akamai_cps_third_party_enrollment" "enrollment_id_269323" {
  common_name                           = "*.bucktfdemo.com"
  allow_duplicate_common_name           = false
  secure_network                        = "enhanced-tls"
  sni_only                              = true
  acknowledge_pre_verification_warnings = false
  auto_approve_warnings                 = []
  admin_contact {
    first_name       = "roberto"
    last_name        = "monge"
    organization     = ""
    email            = "rmongeag@bucktf.com"
    phone            = "5060000"
    address_line_one = ""
    city             = ""
    region           = ""
    postal_code      = ""
    country_code     = ""
  }
  certificate_chain_type = "default"
  csr {
    country_code        = "CR"
    city                = "San Jose"
    organization        = "bucktfdemo.com"
    organizational_unit = "tf"
    state               = "San Jose"
  }
  network_configuration {
    disallowed_tls_versions = ["TLSv1", "TLSv1_1", ]
    clone_dns_names         = true
    geography               = "core"
    must_have_ciphers       = "ak-akamai-2020q1"
    ocsp_stapling           = "on"
    preferred_ciphers       = "ak-akamai-2020q1"
  }
  signature_algorithm = ""
  tech_contact {
    first_name       = "roberto"
    last_name        = "monge"
    organization     = ""
    email            = "rmongeag@akamai.com"
    phone            = "5060000"
    address_line_one = ""
    city             = ""
    region           = ""
    postal_code      = ""
    country_code     = ""
  }
  organization {
    name             = "bucktfdemo.com"
    phone            = "506000000"
    address_line_one = "san jose costa rica"
    city             = "San Jose"
    region           = "San Jose"
    postal_code      = "00000"
    country_code     = "CR"
  }
  contract_id       = "1-1NC95D"
  change_management = false
  exclude_sans      = true
}

/*
data "akamai_cps_csr" "enrollment_id_269323" {
  enrollment_id = 269323
}
*/

resource "akamai_cps_upload_certificate" "enrollment_id_269323" {
  enrollment_id                          = 269323
  certificate_rsa_pem                    = "-----BEGIN CERTIFICATE-----\nMIIDPjCCAqegAwIBAgICEjUwDQYJKoZIhvcNAQEEBQAwgYwxCzAJBgNVBAYTAkNS\nMREwDwYDVQQIDAhTYW4gSm9zZTERMA8GA1UEBwwIU2FuIEpvc2UxDzANBgNVBAoM\nBmJ1Y2tjYTELMAkGA1UECwwCY2ExFTATBgNVBAMMDCouYnVja2NhLmNvbTEiMCAG\nCSqGSIb3DQEJARYTcm1vbmdlYWdAYnVja2NhLmNvbTAeFw0yNTA3MTUwMDU4NTRa\nFw0yNjA3MTUwMDU4NTRaMHQxCzAJBgNVBAYTAkNSMREwDwYDVQQIDAhTYW4gSm9z\nZTERMA8GA1UEBwwIU2FuIEpvc2UxFzAVBgNVBAoMDmJ1Y2t0ZmRlbW8uY29tMQsw\nCQYDVQQLDAJ0ZjEZMBcGA1UEAwwQKi5idWNrdGZkZW1vLmNvbTCCASIwDQYJKoZI\nhvcNAQEBBQADggEPADCCAQoCggEBALBWvQx50LpOWdFKHZtG5twK4fjtDJTBY73i\n2qxDI9KDAgsoAHsnDgj1eTRvbWo8uCVvKGHPWtXnDlffLaeSrSo+lNPgyxEElwzg\nUIr+FyHYuG9ysaZqXrOhoqsiXdpD1ydaANyzvuBcyPQ7i3Dpn/fgmjEayQ6lAt7P\nsZvIlJW6HxnmNwpW1jenynlkay7GJof8v9RPjlA9w1TGkcxaHwr9qoqi8sifxob7\noCR27dLHLkiJHeX7dvzYC5bvv61J3NyrQNs3RKS5+Kzmm+FY2I6sHCvbpiHjvfLA\nSyNhp69XAcvGeiM9aPt1tOQinPwIibsLzi8asC0hg1afSGprrAUCAwEAAaNCMEAw\nHQYDVR0OBBYEFNTAK57rcG6cToQd0YXFnfLNsuVfMB8GA1UdIwQYMBaAFILcZBQO\nZXNW8/yl7FDYlr2B8hRRMA0GCSqGSIb3DQEBBAUAA4GBAGwfk0ueYiIxAqzzOHvc\n6HZGXV/SYrixwRPc1O12ICvOJeEeq9F2UnLKiGEqqCc1iD2npeVjtu+Ps6vpJwc3\nUmgsiTVZggBQvjSEJtNCMwrVluVIYIlUBGAQpz+wH3ll3OvYFKu/8WZiy2Xa9zU5\nwS7ryqvpZ6/ISRJPrTCQSDKK\n-----END CERTIFICATE-----"
  trust_chain_rsa_pem                    = "-----BEGIN CERTIFICATE-----\nMIIC+DCCAmGgAwIBAgIUf+XDmqyI/LJIVpxk3IVBwsbb2vQwDQYJKoZIhvcNAQEL\nBQAwgYwxCzAJBgNVBAYTAkNSMREwDwYDVQQIDAhTYW4gSm9zZTERMA8GA1UEBwwI\nU2FuIEpvc2UxDzANBgNVBAoMBmJ1Y2tjYTELMAkGA1UECwwCY2ExFTATBgNVBAMM\nDCouYnVja2NhLmNvbTEiMCAGCSqGSIb3DQEJARYTcm1vbmdlYWdAYnVja2NhLmNv\nbTAgFw0yNTA3MTUwMDMzMzhaGA8yMDUyMTEzMDAwMzMzOFowgYwxCzAJBgNVBAYT\nAkNSMREwDwYDVQQIDAhTYW4gSm9zZTERMA8GA1UEBwwIU2FuIEpvc2UxDzANBgNV\nBAoMBmJ1Y2tjYTELMAkGA1UECwwCY2ExFTATBgNVBAMMDCouYnVja2NhLmNvbTEi\nMCAGCSqGSIb3DQEJARYTcm1vbmdlYWdAYnVja2NhLmNvbTCBnzANBgkqhkiG9w0B\nAQEFAAOBjQAwgYkCgYEAzIHs4LM1Znyr0iwndECPQEBwT1hLyVELRbNtqu1CncE2\nTF2ZOVgBeNNKw8aox61DKd2+ZvDq9C1qMdYsSiWD12Tc8rMrq9GStelYutQIaY5G\n3rmoQWYgNVvOdts4jlosTeJqSWvr14h8zzLpz1GSSSwC3FF/FBsg0a9NQ94JQLkC\nAwEAAaNTMFEwHQYDVR0OBBYEFILcZBQOZXNW8/yl7FDYlr2B8hRRMB8GA1UdIwQY\nMBaAFILcZBQOZXNW8/yl7FDYlr2B8hRRMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZI\nhvcNAQELBQADgYEAgWtr0cn5wwy1iJd0glbxkpBm4XR4efckGlad3SxodogZGEAM\n50eYy9S0JvEavBcb/fm00BlUjp8erdBR3mQu2Gb115E/i0cjHOeIDiE3zI+Ct60h\nC80fZu5HR/FG8KJAKy4G+4SDruRDHiEEKwMaObfZCVv2UQnlqylXMhlp1xE=\n-----END CERTIFICATE-----"
  acknowledge_post_verification_warnings = false
  auto_approve_warnings                  = []
  acknowledge_change_management          = false
  wait_for_deployment                    = false
}