variable "edgerc_path" {
  type        = string
  description = ".edgerc directory"
  default     = "~/"
}

variable "config_section" {
  type        = string
  description = ".edgerc config section"
  default     = "Akamai-PS"
}