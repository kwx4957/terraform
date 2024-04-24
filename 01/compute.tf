resource "aws_instance" "web_server" {
  # Amazon Linux 2023 
  ami           = "ami-04c596dcf23eb98d8"
  instance_type = "t2.micro"

  tags = {
    name = "web-server"
  }
}