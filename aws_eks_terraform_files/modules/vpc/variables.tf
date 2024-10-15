variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "odo-vpc"
}

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 2
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  type        = bool
  default     = true
}

variable "subnet_name" {
  description = "The name tag for subnets"
  type        = string
  default     = "odo-subnet"
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type        = string
  default     = "odo-igw"
}

variable "route_table_name" {
  description = "The name tag for the Route Table"
  type        = string
  default     = "odo-route-table"
}
