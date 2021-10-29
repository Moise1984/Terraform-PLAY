output "public_Ip_moisepub" {
  value = aws_instance.moise-pub[*].public_ip
} 

output "private_dns_moisepriv" {
  value = aws_instance.moise-priv[*].private_dns
}
