provider "aws" {
  region = "ap-southeast-1"
#  access_key = "XXX"
#  secret_key = "YYY"
}

module "networking" {
  source = "../modules/networking"
}
module "compute" {
  source = "../modules/compute"
  public_subnet_id = module.networking.public_subnet_id
  security_groups_web_server = module.networking.security_groups_web_server_id
}

