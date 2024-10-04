resource "helm_release" "kube_prometheus_stack" {
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  name             = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  timeout = 2000
  # set_sensitive {
  #   name  = "grafana.adminPassword"
  #   value = "random_password.grafana_admin_password.result"
  # }

  # set_sensitive {
  #   name  = "grafana.adminUser"
  #   value = "admin"
  # }

  set {
    name  = "podSecurityPolicy.enabled"
    value = "true"
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = "true"
  }

  set {
    name  = "grafana.service.type"
    value = "LoadBalancer" #LoadBalancer #ClusterIP
  }

  set {
    name  = "prometheus.service.type"
    value = "LoadBalancer" #LoadBalancer #ClusterIP
  }

  depends_on = [helm_release.argocd]

}