resource "aws_instance" "web_server" {
  ami                         = "ami-08589eca6dcc9b39c"
  instance_type               = "t2.micro"
  key_name                    = "default"
  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data.sh")
}

output "hello_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}
