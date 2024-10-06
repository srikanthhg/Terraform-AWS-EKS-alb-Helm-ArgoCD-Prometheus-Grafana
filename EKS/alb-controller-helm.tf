resource "helm_release" "alb_ingress_controller" {

  name            = "aws-load-balancer-controller"
  repository      = "https://aws.github.io/eks-charts"
  chart           = "aws-load-balancer-controller"
  version         = "1.4.1"
  namespace       = "kube-system"
  cleanup_on_fail = true
  recreate_pods   = true
  replace         = true

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [ kubernetes_service_account.alb_controller_sa ]

}