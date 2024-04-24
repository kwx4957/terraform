resource "aws_security_group" "web_server" { 
    name = "web-server-asg"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}