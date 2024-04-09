resource "aws_instance" "web-server" {
    # Defome your AMI 
    ami = "ami-0fd77db8c27ba5cc5"
    # we use t2.micro
    instance_type = "t2.micro"
    key_name = "web-server"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install httpd
                sudo systemctl start httpd
                sudo systemctl status httpd
                EOF
    availability_zone = "ap-southeast-1a"
    security_groups = [var.security_groups_web_server]
    subnet_id = var.public_subnet_id
    tags = {
      "Name" = "Web-server"
    }
}
