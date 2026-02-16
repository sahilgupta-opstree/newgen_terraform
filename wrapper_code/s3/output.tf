output "bucket_names" {
  description = "Names of all S3 buckets created"
  value = [
    for m in module.s3 : m.bucket_name
  ]
}
