resource "aws_instance" "this" {
  ami                    = var.publique ? data.aws_ami.ubuntu_latest.id : data.aws_ami.amazon_linux_latest.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = data.aws_key_pair.cle-kuikvengers-Mammar.key_name
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip

  user_data = var.publique ? file("/home/nadir/terraform-projet/terraform-local/modules/ec2/installation-ubuntu.sh") : file("/home/nadir/terraform-projet/terraform-local/modules/ec2/installation-amazon-linux.sh")

  tags = {
    Name = var.publique ? "Mammar-EC2-Angular" : "Mammar-EC2-Nginx"
  }
}



data "aws_key_pair" "cle-kuikvengers-Mammar" {
  key_name = "kuikvengers_Mammar"
}

data "aws_ami" "ubuntu_latest" {
  most_recent = true
  owners      = ["099720109477"]   

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


data "aws_ami" "amazon_linux_latest" {
  most_recent = true
  owners      = ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}
 
