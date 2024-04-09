output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
}
output "security_groups_web_server_id" {
    value = aws_security_group.public_sg.id
}