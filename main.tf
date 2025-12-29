 # Subnet public
module "subnet_public" {
  source     = "./modules/subnet"
  cidr_block = var.cidre-block-public
  public     = true
}

# Subnet privé
module "subnet_private" {
  source     = "./modules/subnet"
  cidr_block = var.cidre-block-private
  public     = false
}

# Security Group public
module "security_public" {
  source        = "./modules/sg"
  oui_non       = true
  cidr_block    = var.cidre-in-sg-public
  ingress_ports = [22, 80, 443]
}

# Security Group privé
module "security_private" {
  source        = "./modules/sg"
  oui_non       = false
  cidr_block    = var.cidre-in-sg-private
  ingress_ports = [22, 80, 443]
}

# EC2 instance Angular (publique)
module "ec2_instances_angular" {
  source              = "./modules/ec2"
  publique            = true
  subnet_id           = module.subnet_public.subnet_id
  security_group_id   = module.security_public.security_group_id
  associate_public_ip = true
}
# EC2 instance Nginx (privée)
module "ec2_instances_nginx" {
  source              = "./modules/ec2"
  publique            = false
  subnet_id           = module.subnet_private.subnet_id
  security_group_id   = module.security_private.security_group_id
  associate_public_ip = false
}