 
variable "cidr_block" {
  type = string
  description = "Le bloc CIDR du subnet"
}

variable "vpc_id" {
  type = string
  description = "L'ID du VPC où créer le subnet"
  default     = "vpc-0e2057eab81a540b2"
}

variable "public" {
  type = bool
  description = "Indique si le subnet est public ou non (map_public_ip_on_launch)"
}
