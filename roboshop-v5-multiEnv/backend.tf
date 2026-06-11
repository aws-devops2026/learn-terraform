terraform {
  backend "s3" { }

}

# Backend attribute is moved to env specific tfvars file, so that we can have different backend for
# different environment. This is required when we want to maintain separate state file for each 
# environment in same S3 bucket.
