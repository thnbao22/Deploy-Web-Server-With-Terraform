provider "aws" {
  region = local.location
}

locals {
  instance_type = "t2.micro"
  location = "ap-southeast-1"

}

module "networking" {
  source = "../modules/networking"
}
module "compute" {
  source = "../modules/compute"
  instance_type = local.instance_type
  public_subnet_id = module.networking.public_subnet_id
  security_groups_web_server = module.networking.security_groups_web_server_id
}