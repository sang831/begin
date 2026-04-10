module "network" {
  source             = "../../modules/network"
  name               = var.name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "compute" {
  source           = "../../modules/compute"
  name             = var.name
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
  instance_type    = var.instance_type
  ami_id           = var.ami_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

