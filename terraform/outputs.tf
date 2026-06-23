output "control_node_public_ip" {
  value = aws_instance.control_node.public_ip
}

output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}