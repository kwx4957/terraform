resource "aws_instance" "web_server" {
  ami                    = "ami-04c596dcf23eb98d8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]

  user_data = <<-EOF
                #!/bin/bash
                yum install -y yum-utils 
                touch /etc/yum.repos.d/nginx.repo

                echo "[nginx-stable]
                name=nginx stable repo
                baseurl=http://nginx.org/packages/amzn/2023/\$basearch/
                gpgcheck=1
                enabled=1
                gpgkey=https://nginx.org/keys/nginx_signing.key
                module_hotfixes=true
                priority=9
                [nginx-mainline]
                name=nginx mainline repo
                baseurl=http://nginx.org/packages/mainline/amzn/2023/\$basearch/
                gpgcheck=1
                enabled=0
                gpgkey=https://nginx.org/keys/nginx_signing.key
                module_hotfixes=true
                priority=9" > /etc/yum.repos.d/nginx.repo

                yum install -y nginx
                systemctl start nginx
                EOF

  tags = {
    name = "web-server"
  }
}