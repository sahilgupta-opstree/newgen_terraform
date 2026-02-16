locals {
  merged_tags = merge(
    {
      ManagedBy = "terraform"
    },

  )
}
