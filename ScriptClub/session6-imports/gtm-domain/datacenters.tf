resource "akamai_gtm_datacenter" "EU" {
  domain                            = akamai_gtm_domain.mmongemu.name
  nickname                          = "EU"
  city                              = "N/A"
  state_or_province                 = "N/A"
  country                           = "N/A"
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_datacenter" "NA" {
  domain                            = akamai_gtm_domain.mmongemu.name
  nickname                          = "NA"
  city                              = "N/A"
  state_or_province                 = "N/A"
  country                           = "N/A"
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_datacenter" "APAC" {
  domain                            = akamai_gtm_domain.mmongemu.name
  nickname                          = "APAC"
  city                              = "N/A"
  state_or_province                 = "N/A"
  country                           = "JP"
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_datacenter" "APAC-S" {
  domain                            = akamai_gtm_domain.mmongemu.name
  nickname                          = "APAC-S"
  city                              = "N/A"
  state_or_province                 = "N/A"
  country                           = "N/A"
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_datacenter" "OC" {
  domain                            = akamai_gtm_domain.mmongemu.name
  nickname                          = "OC"
  city                              = "N/A"
  state_or_province                 = "N/A"
  country                           = "N/A"
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.mmongemu
  ]
}

