output "public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "public ip address of nginx web server"
}