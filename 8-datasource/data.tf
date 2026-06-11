data "aws_security_group" "selected" {
  name = "b60-sg"
}

# Output the security group info 
output "security_group_info" {
  value = data.aws_security_group.selected
}


# outputs the securitu group id only
output "security_group_id" {
  value = data.aws_security_group.selected.id
}