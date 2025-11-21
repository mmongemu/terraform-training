resource "akamai_gtm_property" "oc-fo" {
  domain                      = akamai_gtm_domain.mmongemu.name
  name                        = "oc-fo"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 300
  handout_limit               = 8
  handout_mode                = "normal"
  backup_cname                = "eu-fo.mmongemu.akadns.net"
  failover_delay              = 0
  failback_delay              = 0
  comments                    = "Oceania origin with FO"
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.APAC.datacenter_id
    enabled       = true
    weight        = 0
    servers       = ["52.26.148.220"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.OC.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["52.26.148.220"]
  }
  liveness_test {
    name                             = "Anemone"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/akamaiflowershop/image/cache/WoodAnemone-250x250.jpg"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    http_header {
      name  = "Host"
      value = "www.akamaiflowershop.com"
    }
    test_timeout        = 25
    answers_required    = false
    recursion_requested = false
  }
  depends_on = [
    akamai_gtm_datacenter.APAC,
    akamai_gtm_datacenter.OC,
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_property" "na-fo" {
  domain                      = akamai_gtm_domain.mmongemu.name
  name                        = "na-fo"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 300
  handout_limit               = 8
  handout_mode                = "normal"
  backup_cname                = "apac-fo.mmongemu.akadns.net"
  failover_delay              = 0
  failback_delay              = 0
  comments                    = "North America origin"
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.NA.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["52.26.148.220"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.EU.datacenter_id
    enabled       = true
    weight        = 0
    servers       = ["52.26.148.220"]
  }
  liveness_test {
    name                             = "Anemone"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/akamaiflowershop/image/cache/WoodAnemone-250x250.jpg"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    http_header {
      name  = "Host"
      value = "www.akamaiflowershop.com"
    }
    test_timeout        = 25
    answers_required    = false
    recursion_requested = false
  }
  depends_on = [
    akamai_gtm_datacenter.NA,
    akamai_gtm_datacenter.EU,
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_property" "apac-fo" {
  domain                      = akamai_gtm_domain.mmongemu.name
  name                        = "apac-fo"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 300
  handout_limit               = 8
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  comments                    = "APAC origin with FO"
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.APAC.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["52.26.148.220"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.OC.datacenter_id
    enabled       = false
    weight        = 0
    servers       = ["52.26.148.220"]
  }
  liveness_test {
    name                             = "Anemone"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/akamaiflowershop/image/cache/WoodAnemone-250x250.jpg"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    http_header {
      name  = "Host"
      value = "www.akamaiflowershop.com"
    }
    test_timeout        = 25
    answers_required    = false
    recursion_requested = false
  }
  depends_on = [
    akamai_gtm_datacenter.APAC,
    akamai_gtm_datacenter.OC,
    akamai_gtm_domain.mmongemu
  ]
}

resource "akamai_gtm_property" "eu-fo" {
  domain                      = akamai_gtm_domain.mmongemu.name
  name                        = "eu-fo"
  type                        = "failover"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 300
  handout_limit               = 8
  handout_mode                = "normal"
  backup_cname                = "apac-fo.mmongemu.akadns.net"
  failover_delay              = 0
  failback_delay              = 0
  comments                    = "Europe origin with FO"
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.NA.datacenter_id
    enabled       = true
    weight        = 0
    servers       = ["52.26.148.220"]
  }
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.EU.datacenter_id
    enabled       = true
    weight        = 1
    servers       = ["52.26.148.220"]
  }
  liveness_test {
    name                             = "Anemone"
    peer_certificate_verification    = false
    test_interval                    = 60
    test_object                      = "/akamaiflowershop/image/cache/WoodAnemone-250x250.jpg"
    http_error3xx                    = true
    http_error4xx                    = true
    http_error5xx                    = true
    pre_2023_security_posture        = false
    disabled                         = false
    test_object_protocol             = "HTTP"
    test_object_port                 = 80
    disable_nonstandard_port_warning = false
    http_header {
      name  = "Host"
      value = "www.akamaiflowershop.com"
    }
    test_timeout        = 25
    answers_required    = false
    recursion_requested = false
  }
  depends_on = [
    akamai_gtm_datacenter.NA,
    akamai_gtm_datacenter.EU,
    akamai_gtm_domain.mmongemu
  ]
}

