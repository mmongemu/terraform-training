terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 9.2.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

data "akamai_property_rules_template" "rules" {
  template_file = abspath("${path.module}/property-snippets/main.json")
}

resource "akamai_edge_hostname" "mmongemu-trsc-com-edgesuite-net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  ip_behavior   = "IPV4"
  edge_hostname = "mmongemu-trsc.com.edgesuite.net"
  ttl           = 300
}

resource "akamai_property" "mmongemu-trsc4-com" {
  name        = "mmongemu-trsc4.com"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Fresca"
  hostnames {
    cname_from             = "api.mmongemu-trsc.com"
    cname_to               = akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  hostnames {
    cname_from             = "blog.mmongemu-trsc.com"
    cname_to               = akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  hostnames {
    cname_from             = "cdn.mmongemu-trsc.com"
    cname_to               = akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  hostnames {
    cname_from             = "shop.mmongemu-trsc.com"
    cname_to               = akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  hostnames {
    cname_from             = "www.mmongemu-trsc.com"
    cname_to               = akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format = "v2018-09-12"
  rules       = data.akamai_property_rules_template.rules.json
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "mmongemu-trsc4-com-staging" {
  property_id                    = akamai_property.mmongemu-trsc4-com.id
  contact                        = ["mmongemu@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.mmongemu-trsc4-com.latest_version : akamai_property.mmongemu-trsc4-com.staging_version
  network                        = "STAGING"
  note                           = "Script Club s4"
  auto_acknowledge_rule_warnings = false
}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "mmongemu-trsc4-com-production" {
#  property_id                    = akamai_property.mmongemu-trsc4-com.id
#  contact                        = []
#  version                        = var.activate_latest_on_production ? akamai_property.mmongemu-trsc4-com.latest_version : akamai_property.mmongemu-trsc4-com.production_version
#  network                        = "PRODUCTION"
#  auto_acknowledge_rule_warnings = false
#}
