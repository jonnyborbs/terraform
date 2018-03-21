variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "lb_outside_port" {
  description = "The port that the load balancer will expose outside"
  default     = 80
}
