variable "project" {
  type = string
  default = "localize-343216"
  description = "Project name"
}

variable "credentials" {
  type = string
  default = "./key.json"
  description = "Path to the credentials json"
}

variable "region" {
  type = string
  default = "europe-west1"
  description = "Region instance"
}

variable "zone" {
  type = string
  default = "europe-west1-d"
  description = "Zone instance"
}