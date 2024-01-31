output "fmg_id" {
  description = "FortiManager instance ID"
  value       = google_compute_instance.fmg.instance_id
}

output "fmg_self_link" {
  description = "FortiManager instance SelfLink"
  value       = google_compute_instance.fmg.self_link
}

output "fmg_public-ip" {
  description = "FortiManager public IP"
  value       = google_compute_address.fmg-public-ip.address
}
