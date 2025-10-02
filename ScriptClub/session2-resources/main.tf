data "akamai_group" "sc_group" {
     group_name   = "Akamai Professional Services-1-1NC95D"
     contract_id  = "1-1NC95D"
}

output "sc_group_id" {
    value = data.akamai_group.sc_group.id
}