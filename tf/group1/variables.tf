# variables.tf

variable "environment" {
  type        = string
  description = "(Required) Environment for the resource group"
  default = "sand"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group"
  default = "karn-static-webapp-sand"
}

variable "location" {
  type        = string
  description = "(Required) Location of the resources"
  default = "inc"
}
