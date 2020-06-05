variable "AWS_ACCESS_KEY" {default = "xxxxxxxxxx"}
variable "AWS_SECRET_KEY" {default = "xxxxxxxxxxxxxxxx"}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-04763b3055de4860b"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}


variable "instance_type" {
  default = "default_instance_type"
}
variable "key_pair" {
  default = "example"
}

variable "associate_public_ip_address" {
  
}

variable "count" {
  default = "3"
}

# this may not work. Verify if you need to put ebs or something else
variable "root_vol_type" {
  default = "ebs"
}

variable "root_vol_size" {
  default = "20"
}