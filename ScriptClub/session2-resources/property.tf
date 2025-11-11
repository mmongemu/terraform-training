

//CP Code
resource "akamai_cp_code" "my_new_cp_code" {
  name        = "mmongemu-sc"
  contract_id = "1-1NC95D"
  group_id    = data.akamai_group.sc_group.id
  product_id  = "prd_Fresca"
  timeouts {
    update = "1h"
  }
}

//Edge hostname
resource "akamai_edge_hostname" "my_new_edge_hostname" {
  product_id    = "prd_Fresca"
  contract_id   = "1-1NC95D"
  group_id      = data.akamai_group.sc_group.id
  edge_hostname = "mmongemu-trsc.com.edgesuite.net"
  ip_behavior   = "IPV4"
  ttl           = 300
  timeouts {
    default = "1h"
  }
}

//CP Code
data "akamai_cp_code" "my_new_cp_code" {
    contract_id = "1-1NC95D"
    group_id    = data.akamai_group.sc_group.id
    name        = "mmongemu-sc"
}

output "my_new_cp_code" {
    value = data.akamai_cp_code.my_new_cp_code.id
}

// Rule tree Default rule information
data "akamai_property_rules_builder" "my_default_rule" {
    rules_v2025_07_07 {
    name      = "default"
    is_secure = false
    comments  = <<-EOT
      The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
    EOT
    behavior {  
      origin {
        origin_type                   = "CUSTOMER"
        hostname                      = var.ab_test == "A" ? "origin-a.customer.com" : "origin-b.customer.com"
        forward_host_header           = "ORIGIN_HOSTNAME"
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = true
        http_port                     = 80
      }
    }
    behavior {
      cp_code {
        value {
          id   = data.akamai_cp_code.my_new_cp_code.id
          name = data.akamai_cp_code.my_new_cp_code.name
        }
      }
    }
    children = [
      data.akamai_property_rules_builder.compress_text_content.json
    ]
  }
}

// Your child rule information
data "akamai_property_rules_builder" "compress_text_content" {
  rules_v2025_07_07 {
    name = "Compress Text Content"
    behavior {
      gzip_response {
          behavior = "ALWAYS"
      }
    }
    criterion {
      content_type {
        values             = ["text/html*", "text/css*", "application/x-javascript*"]
      }
    }
  }
}

output "my_default_rule" {
  value = data.akamai_property_rules_builder.my_default_rule
} 

resource "akamai_property" "my_new_property" {
  name        = "mmongemu-trsc.com"
  product_id  = "prd_Fresca"
  contract_id = "1-1NC95D"
  group_id    = data.akamai_group.sc_group.id
  hostnames {
    cname_from  = "mmongemu-trsc.com"
    cname_to    = "mmongemu-trsc.com.edgesuite.net"
    cert_provisioning_type  = "CPS_MANAGED"
  }
  rules = data.akamai_property_rules_builder.my_default_rule.json
}