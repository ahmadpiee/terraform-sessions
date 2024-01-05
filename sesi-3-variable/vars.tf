# provider
variable "project" {
  type        = string
  description = "Project ID google cloud"
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "credentials" {
  type    = string
  default = "/home/sofyan/Desktop/DEVOPS/terraform/credentials.json"
}


# instances
variable "name" {
  description = "isntance name"
  type        = string
}

variable "machine_type" {
  type = string
}

variable "tags" {
  type = list(string)
}

variable "image" {
  type = string
}

variable "disk_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "metadata_startup_script" {
  type = string
}
