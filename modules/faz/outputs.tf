output "faz_id" {
  description = "FAZ instance id"
  value = google_compute_instance.faz.instance_id
}

output "faz_self_link" {
  description = "FAZ GCP instance SelfLink"
  value = google_compute_instance.faz.self_link
}

output "faz_public-ip" {
  description = "FAZ public IP attached to public port"
  value = google_compute_address.faz-public-ip.address
}
