resource "akamai_dns_record" "my_dns_zone" {
   count        = length (values(local.app_hostnames))

    zone        = "dummy20671.com"
    recordtype  = "CNAME"
    ttl         = 86400
    name       = values(local.app_hostnames)[count.index]
    target      = ["test.edgesuite.net"]
}
