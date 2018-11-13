output "apps_external_ips" {
  value = "${module.app.app_external_ip}"
}

#output "balancer_external_ip" {
#  value = "${google_compute_forwarding_rule.reddit-app-balancer.ip_address}"
#}

