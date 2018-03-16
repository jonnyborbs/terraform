output "elb_dns_name" {
  value = "${aws_elb.example.dns_name}"
}

output "url" {
  value = "http://${aws_elb.example.dns_name}:${var.lb_outside_port}"
}
