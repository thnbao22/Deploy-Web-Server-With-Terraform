resource "aws_instance" "web-server" {
    # Defome your AMI 
    ami = "ami-0fd77db8c27ba5cc5"
    # we use t2.micro
    instance_type = var.instance_type
    key_name = "web-server"
    user_data = filebase64("install_apache.sh")
    availability_zone = "ap-southeast-1a"
    security_groups = var.security_groups_web_server
    subnet_id = var.public_subnet_id
    tags = {
      "Name" = "Web-server"
    }
}