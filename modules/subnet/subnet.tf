resource "aws_subnet" "this" {
  vpc_id                  = data.aws_vpc.vpc-kuikvengers.id
  cidr_block              = var.cidr_block
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = var.public

  tags = {
    Name = var.public ? "Mammar-public-subnet" : "Mammar-private-subnet"
  }
}
 

#Table de routage pour le subnet public

resource "aws_route_table" "Mammar-Policy-public" {
  vpc_id = data.aws_vpc.vpc-kuikvengers.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Mammar-public-route"
  }
}

#Table de routage pour le subnet privé

resource "aws_route_table" "Mammar-private-rt" {
  vpc_id = data.aws_vpc.vpc-kuikvengers.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = data.aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "Mammar-private-route"
  }
}

#Association de routage pour le subnet public
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = var.public ? aws_route_table.Mammar-Policy-public.id : aws_route_table.Mammar-private-rt.id
}

data "aws_vpc" "vpc-kuikvengers" {
  id = "vpc-0e2057eab81a540b2"
}

data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.vpc-kuikvengers.id]
  }
}

data "aws_nat_gateway" "nat-gateway" {
 
  filter {
   name   = "vpc-id"
   values = [data.aws_vpc.vpc-kuikvengers.id]
  }
  filter {
   name   = "tag:Name"
   values = ["kuikvengers_NAT_GeneralUse"]
    }
}

data "aws_availability_zones" "available" {
  state = "available"
}
