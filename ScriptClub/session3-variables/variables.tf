variable "edgerc_path" {
  type        = string
  description = ".edgerc directory"
  default     = "~/.edgerc"
}

variable "config_section" {
  type        = string
  description = ".edgerc config section"
  default     = "Akamai-PS"
}

variable "group_id" {
  type        = string
  description = "Group ID"
  default ="19293"
}

variable "ticket_id" {
  type        = string
  description = "Reference ticket ID"
  default ="CS-1234"
}