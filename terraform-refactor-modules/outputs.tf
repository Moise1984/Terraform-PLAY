output "vpc" {
  description = "VPC id"
  value       = module.vpc.vpc_id

}

output "security-group" {
  description = "security group id"
  value       = module.security-group.this_security_group_id

}

output "security-group2" {
  description = "security group id"
  value       = module.security-group2.security_group_id

}
