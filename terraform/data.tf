data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}


data "aws_ami" "Ubuntu_20" {
	most_recent = true
	owners = ["099720109477"]
filter {
	name = "name"
	values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20221201"]

}
}
