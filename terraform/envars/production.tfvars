## Environment variables
region = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
environment = "stack_id"
key_name = "test-key"


# EC2 
instance_type = "t2.medium"

## Elasticgroup parameters
instance_types_ondemand = "t2.small"
instance_types_spot = ["t2.large", "t2.medium", "t2.small"]
# key_name = "test-key"
userdata = "userdata.sh"

## Security Groups
lb_private_security_group  = ["sg-xxxxxxxx"]
lb_public_security_group   = ["sg-xxxxxxxx"]
common_security_group      = ["sg-xxxxxxxxxx"]

## Networking
vpc_id = "vpc-xxxxx"
web_private_subnet_ids = ["subnet-xxxxxx"]
db_private_subnet_ids = "subnet-xxxxxxx"
app_private_subnet_ids = ["subnet-xxxxx", "subnet-xxxx"]
lb_public_subnet_ids  = ["subnet-xxxxxx", "subnet-xxxxxx"]
lb_private_subnet_ids = ["subnet-xxxxxx", "subnet-xxxxxx"]

#Route 53
internal_zone_id = "XXXXXXXXXXX" #xyz.com
external_zone_id = "YYYYYYYYYYY" #abc.com
cert_acm_arn="arn:aws:acm:us-east-1:xxxxxx:certificate/xxxxx-xxxx-xxxx-xxxx-xxxxxx"
