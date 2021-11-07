variable "vpc_cidr_block" {
  description = "VPC CIDR BLOCK"
  type        = string
}


variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
}


variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
}


variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
}

variable "vpc_database_subnets" {
  description = "VPC database Subnets"
  type        = list(string)
}


variable "vpc_create_database_subnet_group" {
  description = "VPC create database subnet group"
  type        = bool
}

variable "vpc_create_database_subnet_route_table" {
  description = "VPC  create database subnet route table"
  type        = bool
}


variable "vpc_enable_nat_gateway" {
  description = "enable NAT Gateway"
  type        = bool
}


variable "vpc_single_nat_gateway" {
  description = "enable single NAT Gateway in one public subnet"
  type        = bool
}


variable "vpc_one_nat_gateway_per_az" {
  description = "enable NAT Gateway per az"
  type        = bool
}


variable "vpc_enable_dns_support" {
  description = "enable DNS Support"
  type        = bool
}


variable "vpc_enable_dns_hostnames" {
  description = "enable DNS hostnames"
  type        = bool
}

variable "vpc_name" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "ec2_monitoring" {
  description = "monotoring"
  type        = bool
}

variable "instance_key_pair" {
  type        = string
  description = "type of my instance"
}

variable "instance_type_map" {
  type = map(string)

}

 variable "ingress_cidr_blocks" {
   type = list(string)
 }

variable "instance_count" {
  type = number
}