resource "aws_instance" "bastion" {
  ami           = "${data.aws_ami.Ubuntu_20.id}"
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name
  subnet_id = "${module.vpc.public_subnets[0]}"
  vpc_security_group_ids = [aws_security_group.Bastion_SG.id]
  provisioner "local-exec" {
    command = "chmod 600 /home/ubuntu/.ssh/id_rsa ;echo -n '${tls_private_key.ssh.private_key_openssh}' > /home/ubuntu/.ssh/id_rsa;chmod 400  /home/ubuntu/.ssh/id_rsa;echo  -n '${tls_private_key.ssh.public_key_openssh}' > /home/ubuntu/.ssh/id_rsa.pub"
  }
   user_data = <<EOF
#!/bin/bash
echo -n "${tls_private_key.ssh.private_key_openssh}" > /home/ubuntu/.ssh/id_rsa
chmod 600 /home/ubuntu/.ssh/id_rsa
chown ubuntu: /home/ubuntu/.ssh/id_rsa
EOF
  tags = {
    Name  = "Bastion"
  }
}


resource "aws_instance" "jenkins" {
  ami           = "${data.aws_ami.Ubuntu_20.id}"
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name
  subnet_id = "${module.vpc.private_subnets[0]}"
  vpc_security_group_ids = [aws_security_group.Private_SG.id]
   user_data = <<EOF
#!/bin/bash
echo -n "${tls_private_key.ssh.private_key_openssh}" > /home/ubuntu/.ssh/id_rsa
chmod 600 /home/ubuntu/.ssh/id_rsa
chown ubuntu: /home/ubuntu/.ssh/id_rsa
EOF
 tags = {
    Name  = "Jenkins"
  }
}



resource "aws_instance" "app" {
  ami           = "${data.aws_ami.Ubuntu_20.id}"
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh_key.key_name
  subnet_id = "${module.vpc.private_subnets[1]}"
  vpc_security_group_ids = [aws_security_group.Public_SG.id]
   user_data = <<EOF
#!/bin/bash
echo -n "${tls_private_key.ssh.private_key_openssh}" > /home/ubuntu/.ssh/id_rsa
chmod 600 /home/ubuntu/.ssh/id_rsa
chown ubuntu: /home/ubuntu/.ssh/id_rsa
EOF
 tags = {
    Name  = "App"
  }
}
