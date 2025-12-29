 
variable "ingress_ports" {
  type        = list(number)
  description = "Liste des ports TCP à ouvrir"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-0e2057eab81a540b2"
}

variable "cidr_block" {
  type        = string
  description = "Bloc CIDR pour les règles de sécurité"
}

variable "oui_non" {
  type        = bool
  description = "Indique si le SG est public ou privé"
}
variable "name_sg" {
  type        = list(string)
  description = "Nom du security group"
  default     = ["Mammar-publique-sg", "Mammar-privee-sg"]
}

 