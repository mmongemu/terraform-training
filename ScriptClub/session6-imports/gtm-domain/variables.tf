variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "Akamai-PS"
}

variable "contractid" {
  type        = string
  default     = ""
  description = "Value unknown at the time of import. Please update."
}

variable "groupid" {
  type        = string
  default     = ""
  description = "Value unknown at the time of import. Please update."
}
