#NOTE: When getting PGAdmin4 to work - it somehow doesn't know where the
#   postgresql binaries are. (PGAdmin4 Windows 11)
#   in PGAdmin go to File --> Preferences --> Paths --> Binary Paths
#   on the bottom section "PostgreSQL14" - for me copy in the below path
#   C:\Program Files\PostgreSQL\14\bin 
provider "aws" {
  region = local.region
  profile = "maslow"
}

locals {
    region = "us-east-1"
    tags = { 
        Owner       = "ForEssent"
        Environment = "dev"
        Terraform   = "true"
    }
}

resource "aws_rds_cluster_instance" "cinstances" {
    count = 3
    identifier = "aurora-cluster-demo-${count.index}"
    cluster_identifier = aws_rds_cluster.TFSatt.id
    instance_class = "db.t3.medium"
    engine = aws_rds_cluster.TFSatt.engine
    engine_version = aws_rds_cluster.TFSatt.engine_version
    publicly_accessible = true
}

resource "aws_rds_cluster" "TFSatt" {
    cluster_identifier = "aurora-cluster-satt"
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    engine             = "aurora-postgresql"
    engine_mode        = "provisioned"
    engine_version     = "13.6"
    database_name = "TFSATT"
    master_username = "postgres"
    master_password = "Essent2022"
    skip_final_snapshot = true
    vpc_security_group_ids = ["sg-0ed8a069614427654"]
    db_subnet_group_name = "default"
}