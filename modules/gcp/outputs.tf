output "instance_id" {
  description = "ID of the Compute Engine instance"
  value       = google_compute_instance.instance.id
}

output "public_ip" {
  description = "Public IP of the Compute Engine instance"
  value       = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
}

output "network_cidr" {
  description = "Network CIDR of the instance"
  value       = "0.0.0.0/0"  # This should be replaced with actual network CIDR in production
} 