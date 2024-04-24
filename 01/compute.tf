resource "aws_instance" "web_server" {
  # Amazon Linux 2023 
  ami           = "ami-04c596dcf23eb98d8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = <<-EOF
                #!/bin/bash
                yum install -y yum-utils 
                touch /etc/yum.repos.d/nginx.repo
                echo "[nginx-stable]\n
                name=nginx stable repo\n
                baseurl=http://nginx.org/packages/amzn/2023/\$basearch/\n
                gpgcheck=1\n
                enabled=1\n
                gpgkey=https://nginx.org/keys/nginx_signing.key\n
                module_hotfixes=true\n
                priority=9\n
                [nginx-mainline]\n
                name=nginx mainline repo\n
                baseurl=http://nginx.org/packages/mainline/amzn/2023/\$basearch/\n
                gpgcheck=1\n
                enabled=0\n
                gpgkey=https://nginx.org/keys/nginx_signing.key\n
                module_hotfixes=true\n
                priority=9" > /etc/yum.repos.d/nginx.repo
                yum install -y nginx
                systemctl start nginx
                EOF

  tags = {
    name = "web-server"
  }
}