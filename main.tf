resource "google_gke_backup_backup_plan_iam_binding" "gke_backup_backup_plan_iam_bindings" {
  for_each = var.gke_backup_backup_plan_iam_bindings

  members  = each.value.members
  name     = each.value.name
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

