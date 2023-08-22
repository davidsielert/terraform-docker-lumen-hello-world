variable "project_name" {
  default = "terraform-docker-lumen-hello-world"
  type = string
}

variable "start_container" {
  default = "false"
  type = bool
}

variable "remote_registry" {
  default = "davidsielert/example-lumen-hello-world"
  type = string
}
variable "push_image" {
    default = "false"
    type = bool
}