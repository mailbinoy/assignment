resource "local_file" "sshd_config" {
    content  = "Host ${aws_instance.jenkins.private_ip} ${aws_instance.app.private_ip}\n   ProxyJump 52.87.221.164"
    filename = "/home/ubuntu/.ssh/config"
}
