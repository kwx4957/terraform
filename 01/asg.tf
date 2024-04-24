resource "aws_security_group" "web_server" { 
    name = "web-server-asg"

    ingress {
        from_port = var.web_server_port
        to_port = var.web_server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}