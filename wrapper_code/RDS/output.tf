# Expose the RDS cluster endpoint
output "rds_cluster_endpoint" {
  value       = module.rds.cluster_endpoint
  description = "The endpoint of the RDS cluster"
}

# Expose the RDS reader endpoint (for read replicas)
output "rds_reader_endpoint" {
  value       = module.rds.reader_endpoint
  description = "The reader endpoint of the RDS cluster"
}

# Expose the cluster ID
output "rds_cluster_id" {
  value       = module.rds.cluster_id
  description = "The ID of the RDS cluster"
}

# Expose instance IDs if you need them downstream
output "rds_instance_ids" {
  value       = module.rds.instance_ids
  description = "IDs of all RDS cluster instances"
}
