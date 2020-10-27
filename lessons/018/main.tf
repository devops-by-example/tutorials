provider "google" {
  credentials = file("~/devops-by-example-9004d3b359f5.json")
  project     = "devops-by-example"
  region      = "us-west2"
}

# Main VPC
# https://www.terraform.io/docs/providers/google/r/compute_network.html#example-usage-network-basic
resource "google_compute_network" "main" {
  name                    = "main"
  auto_create_subnetworks = false
}

# Public Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "public" {
  name          = "public"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-west2"
  network       = google_compute_network.main.id
}

# Private Subnet
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
resource "google_compute_subnetwork" "private" {
  name          = "private"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west2"
  network       = google_compute_network.main.id
}

# Cloud Router
# https://www.terraform.io/docs/providers/google/r/compute_router.html
resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.main.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

# NAT Gateway
# https://www.terraform.io/docs/providers/google/r/compute_router_nat.html
resource "google_compute_router_nat" "nat" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = "private"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
