# provider "aws" {
#   region = "ca-central-1"
#   profile = "default"
  
# }




resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

}


resource "aws_security_group" "public-grp" {
  name = "security"
  description = "Public internet access"
  vpc_id = aws_vpc.vpc.id

 tags = {
    Name        = var.env
    Role        = var.Role
    Project     = "cloud"
    Environment = var.env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_security_group_rule" "public-output" {
    for_each=var.public-sg
        type="ingress"
        from_port=each.value.port
        to_port=each.value.port
        protocol=each.value.protocol
        cidr_blocks=each.value.cidr_blocks
        security_group_id=aws_security_group.public-grp.id
        description=each.key
}

 
 
##
# Private Security Group
#
 
# resource "aws_security_group" "private-grp1" {
#   name = "security"
#   description = "Public internet access"
#   vpc_id = aws_vpc.vpc.id

#  tags = {
#     Name        = var.env
#     Role        = var.Role
#     Project     = "cloud"
#     Environment = var.env
#     ManagedBy   = "terraform"
#   }
# }
 
# resource "aws_security_group_rule" "private-output" {
#     for_each=var.private-sg
#         type="ingress"
#         from_port=each.value.port
#         to_port=each.value.port
#         protocol=each.value.protocol
#         cidr_blocks=each.value.cidr_blocks
#         security_group_id=aws_security_group.public-grp.id
#         description=each.key
# }
