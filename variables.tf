variable "name" {
  type    = string
  default = "temporary"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "pool_size" {
  type    = string
  default = "Standard_B2s"
}

variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = "Southeast Asia"
}

variable "acr_name" {
  type    = string
  default = ""
}

variable "pod_cidr" {
  type    = string
  default = "10.244.0.0/16"
}

variable "address_space" {
  type    = string
  default = ""
}

variable "address_prefixes" {
  type    = string
  default = ""
}

variable "acr_rg" {
  type    = string
  default = ""
}

variable "min_count" {
  type    = number
  default = 0
}

variable "max_count" {
  type    = number
  default = 0
}

variable "auto_scaling_enabled" {
  type    = bool
  default = false
}

variable "department" {
  type    = string
  default = "ds"
}
