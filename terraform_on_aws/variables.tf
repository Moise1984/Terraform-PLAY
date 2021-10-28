variable "aws_region" {
    type = string
    description = "var for region"
    # default = "us-east-1" 
}

variable "instance_key_pair" {
    type = string
    description = "type of my instance"
    default = "pub2_key"
}



variable "instance_type_list" {
    type = list(string)
    default = ["t2.micro", "t3.micro", "t2.small"]
}

variable "az_number" {
    type = string
    description = "az to deploy"
    # default = "us-east-1a"
  }
