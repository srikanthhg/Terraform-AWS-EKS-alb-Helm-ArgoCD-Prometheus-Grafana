# resource "kubernetes_namespace" "example" {
#   metadata {
#     name = "hipstershop"
#   }
# }
# #https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
# resource "kubernetes_service_account" "example" {
#   metadata {
#     name      = "my-service-account"
#     namespace = "hipstershop"
#     annotations = {
#       "eks.amazonaws.com/role-arn" = aws_iam_role.eks_oidc.arn
#     }
#   }
# }

# resource "kubernetes_secret" "example" {
#   metadata {
#     namespace = "hipstershop"
#     annotations = {
#       "kubernetes.io/service-account.name" = kubernetes_service_account.example.metadata.0.name
#     }

#     generate_name = "my-service-account-"
#   }

#   type                           = "kubernetes.io/service-account-token"
#   wait_for_service_account_token = true
# }