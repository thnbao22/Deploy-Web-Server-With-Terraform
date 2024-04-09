resource "aws_instance" "web-server" {
    # Defome your AMI 
    ami = "ami-0fd77db8c27ba5cc5"
    # we use t2.micro
    instance_type = "t2.micro"
    key_name = "web-server"
    user_data = filebase64("install_apache.sh")
    tags = {
      "Name" = "Web-server"
    }
}