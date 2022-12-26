resource "local_file" "sshd_config" {
    content  = "Host ${aws_instance.jenkins.private_ip} ${aws_instance.app.private_ip}\n   ProxyJump ${aws_instance.bastion.public_ip}"
    filename = "/home/ubuntu/.ssh/config"
}
