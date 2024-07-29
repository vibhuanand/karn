variable "environment" {
  type        = string
  description = "(Requierd) Name of the resource group"
  default     = "sand"
}

variable "resource_group_name" {
  type        = string
  description = "(Requierd) Name of the resource group"
  default     = "karn-rg-{{ var.environment }}"
}

variable "location" {
  type        = string
  description = "(Requierd) Location of the resources"
  default     = "Central India"
}