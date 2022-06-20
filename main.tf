provider "aws" {
  region = local.region
  profile = "maslow"
}

locals {
    region = "us-east-1"
    tags = { 
        Owner       = "ForEssent"
        Environment = "dev"
    }
}

resource "aws_rds_cluster" "postgresql" {
    cluster_identifier         = "aurora-cluster-demo"
    engine                     = "aurora-postgresql"
    availability_zones         = ["us-east-1a", "us-east-1b", "us-east-1c"]
    database_name              = "SATT"
    master_username            = "postgres"
    master_password            = "Essent2022"
    backup_retention_period    = 5
    preferred_backup_window    = "07:00-09:00"
}

