variable "publique" {
  type = bool
}

variable "subnet_id" {
  type = string
  
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "security_group_id" {
  type = string
}

variable "associate_public_ip" {
  type = bool
}
 