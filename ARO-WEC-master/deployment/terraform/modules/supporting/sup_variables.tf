variable "location" {
  type = string
}

variable "spoke_rg_name" {
  type = string
  default = "spoke-aro"
}

variable "hub_rg_name" {
  type = string
  default = "hub-aro"
}

variable "base_name" {
  type = string
  default = "aroacr"
}

variable "hub_vnet_name" {
  type = string
  default = "hub-aro"
}

variable "hub_vnet_id" {
  type = string
}

variable "spoke_vnet_name" {
  type = string
  default = "spoke-aro"
}

variable "spoke_vnet_id" {
  type = string
}

variable "private_endpoint_subnet_name" {
  type = string
  default = "PrivateEndpoint-subnet"
}

variable "private_endpoint_subnet_id" {
  type = string
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999

  keepers = {
    base_name = var.base_name
  }
}

locals {
  cosmosdb_name = "${var.base_name}-${random_integer.ri.result}"
  key_vault_name = "keyvault${random_integer.ri.result}"
}