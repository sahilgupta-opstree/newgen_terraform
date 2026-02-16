# Cluster endpoint for application connection
output "cluster_endpoint" {
  value       = aws_rds_cluster.this.endpoint
  description = "The endpoint of the RDS cluster"
}

# Reader endpoint for read replicas
output "reader_endpoint" {
  value       = aws_rds_cluster.this.reader_endpoint
  description = "The reader endpoint for the RDS cluster"
}

# Cluster ID
output "cluster_id" {
  value       = aws_rds_cluster.this.id
  description = "The ID of the RDS cluster"
}

# Cluster ARN
output "cluster_arn" {
  value       = aws_rds_cluster.this.arn
  description = "The ARN of the RDS cluster"
}

# Cluster port
output "cluster_port" {
  value       = aws_rds_cluster.this.port
  description = "The port on which the RDS cluster is listening"
}

# Instance IDs
output "instance_ids" {
  value       = aws_rds_cluster_instance.this[*].id
  description = "IDs of all RDS cluster instances"
}
