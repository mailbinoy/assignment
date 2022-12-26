resource "local_file" "inventory" {
    content  = "${aws_instance.jenkins.private_ip}\n${aws_instance.app.private_ip}"
    filename = "../ansible/inventory"
}
