terraform {
  required_version = ">= 1.0"
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = ">= 9.0.0"
    }
  }
}

locals {
    zone = "1testedns.com"
}

resource "akamai_dns_zone" "_1testedns_com" {
    contract = var.contractid
    group = var.groupid
    zone = local.zone
    type = "SECONDARY"
    masters = ["1.2.3.4", "2.2.2.2"]
    comment = ""
    sign_and_serve = false
    sign_and_serve_algorithm = ""
    target = ""
    end_customer_id = ""
}


resource "akamai_dns_record" "_1testedns_com__1testedns_com_AKAMAICDN" {
    zone = local.zone
    name = "1testedns.com"
    recordtype = "AKAMAICDN"
    target = ["abodhanktest.edgekey.net"]
    ttl = 20
}
