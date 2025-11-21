variable "group_name" {
  type    = string
  default = "Akamai Professional Services-1-1NC95D"
}

variable "contract_id" {
  type    = string
  default = "1-1NC95D"
}

variable "name" {
  type    = string
  default = "mmongemu-test-sc"
}

variable "description" {
  type    = string
  default = "Terraform SC test config"
}

variable "hostnames" {
  type    = list(string)
  default = ["mmongemu.ps.com"]
}

variable "emails" {
  type    = list(string)
  default = ["noreply@example.org"]
}

variable "activation_note" {
  type    = string
  default = "Activated by Terraform"
}

variable "network" {
  type    = string
  default = "STAGING"
}
