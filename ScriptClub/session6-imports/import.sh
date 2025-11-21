terraform init
terraform import akamai_edge_hostname.mmongemu-trsc-com-edgesuite-net ehn_6033038,ctr_1-1NC95D,grp_19293
terraform import akamai_property.mmongemu-trsc4-com prp_1284367,ctr_1-1NC95D,grp_19293,LATEST
terraform import akamai_property_activation.mmongemu-trsc4-com-staging prp_1284367:STAGING
