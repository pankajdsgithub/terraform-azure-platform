output "id" {
  description = "Resource ID of the cache."
  value       = azurerm_redis_cache.this.id
}

output "hostname" {
  description = "Host name of the cache."
  value       = azurerm_redis_cache.this.hostname
}

output "ssl_port" {
  description = "TLS port of the cache."
  value       = azurerm_redis_cache.this.ssl_port
}
