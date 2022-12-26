output "bastion_public_ip" {
value = "${aws_instance.bastion.public_ip}"
}
output "jenkins_ip" {
value = "${aws_instance.jenkins.private_ip}"
}
output "app_ip" {
value = "${aws_instance.app.private_ip}"
}
output "alb_dns" {
value = "${aws_lb.jenkins.dns_name}"
}
