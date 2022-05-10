output "security_group_public" {
  value = aws_security_group.public-grp.id
}
 
output "security_group_private" {
  value = aws_security_group.private-grp1.id
}
