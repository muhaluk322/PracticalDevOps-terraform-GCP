locals {
  project_id = var.project
}

resource "google_project_service" "compute_service" {
  project = local.project_id
  service = "compute.googleapis.com"
}

# Network configure

resource "google_compute_network" "vpc_network" {
  name                            = var.network_name
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
  depends_on = [
    google_project_service.compute_service
  ]
}

resource "google_compute_subnetwork" "private_network" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = var.project
  region = var.region
  depends_on = [ google_compute_firewall.web_firewall ]
}

# Define Firewall Rules
resource "google_compute_firewall" "web_firewall" {
  name    = "allow-web-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = ["0.0.0.0/0"]
}

# Create VM
resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone

  tags = var.network_tags

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      labels = {
        my_label = var.environment
      }
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.private_network.self_link

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  depends_on = [ google_compute_network.vpc_network, google_compute_subnetwork.private_network ]
}

