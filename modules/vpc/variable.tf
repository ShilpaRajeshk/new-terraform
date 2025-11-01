variable "vpc_cidr" {
    type = string
    description = "Public Subnet CIDR Value"
    default = "10.0.0.0/16"
  
}
variable "cidr_public_subnet" {
    type = list(string)
    description = "Public subnet CIDR values"
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
  
}

variable "cidr_private_subnet" {
    type = list(string)
    description = "private subnet cidr values"
    default = [ "10.0.3.0/24","10.0.4.0/24" ]
  
}

variable "availability_zone" {
    type = list(string)
    description = "list of availablility zone"
    default = [ "eu-north-1a", "eu-north-1b" ]
  
}
