variable "region" {
  description = "la region ou il est Aws"
  type        = string
}

variable "cidre-block-private" {
  type        = string
  description = "Bloc CIDR pour les règles de sécurité"
}

variable "cidre-block-public" {
  type        = string
  description = "Bloc CIDR pour les règles de sécurité"
}

variable "cidre-in-sg-public" {
  type        = string
  description = "Bloc CIDR pour les règles de sécurité"
}


variable "cidre-in-sg-private" {
  type        = string
  description = "Bloc CIDR pour les règles de sécurité"
}
 