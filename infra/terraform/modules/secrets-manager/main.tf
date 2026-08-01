resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id

  secret_string = jsonencode({
    username = "admin"
    password = "ChangeMe123!"
  })

  lifecycle {
    ignore_changes = [secret_string]
  }
}
