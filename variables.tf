variable "project" {
  description = "Google cloud active project"
  type        = string
  default     = "secure-petal-414717"
}

variable "region" {
  description = "default region to deploy infrastructure"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  type        = string
  description = "The availability zone where the instance will be deployed"
  default     = "europe-central2-a"
}

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "vpc-development"
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
  default     = "subnet-development"
}

variable "subnet_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "image_family" {
  description = "The family of the VM image for the instance to be launched"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "image_project" {
  description = "The project of the VM image for the instance to be launched"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "webserver"
}

variable "network_tags" {
  description = "A list of network tags to be applied to the instance"
  type        = list(string)
  default     = ["web"]
}

variable "instance_type" {
  description = "The instance type to be used for the Compute Engine instance"
  type        = string
  default     = "e2-micro"
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}
