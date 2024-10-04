#https://github.com/argoproj/argo-helm/blob/main/charts/argo-cd/README.md
#https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/

resource "helm_release" "argocd" {
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  #version    = "5.24.1"# If this is not specified, the latest version is installed.
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  timeout = 2000

  set {
    name  = "server.service.type"
    value = "LoadBalancer" #LoadBalancer #ClusterIP
  }

  # set {
  #   name =  "server.serviceAccount.name"
  #   value = "argocd-server"
  # }

  set {
    name  = "server.ingress.enabled"
    value = "false"
  }

  depends_on = [helm_release.alb_ingress_controller]

}
