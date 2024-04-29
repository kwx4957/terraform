variable "web_server_http_port" {
  default     = "80"
  description = "nginx web-server http port ingress"
  type        = number
}

variable "ssh_port" {
  default     = "22"
  description = "ssh"
  type        = number
}

variable "web_server_https_port" {
  default     = "443"
  description = "nginx web-server https port ingress"
  type        = number
}