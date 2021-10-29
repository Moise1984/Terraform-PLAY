output "public_Ip_moisepub" {
  value = aws_autoscaling_group.Asg-moise.arn
} 

# output "private_dns_moisepriv" {
#   value = aws_instance.moise-priv[*].private_dns
# }
