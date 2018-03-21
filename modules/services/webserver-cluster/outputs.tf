output "elb_dns_name" {
  value = "${aws_elb.example.dns_name}"
}

output "url" {
  value = "http://${aws_elb.example.dns_name}:${var.lb_outside_port}"
}

output "dbserver" {
  value = "${data.terraform_remote_state.db.address}"
}

output "dbport" {
  value = "${data.terraform_remote_state.db.port}"
}
