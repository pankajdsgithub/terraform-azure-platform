output "id" {
  description = "Resource ID of the plan (pass to the web app module)."
  value       = azurerm_service_plan.this.id
}
