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
        Owner       = "ForResearchAndDevelopment"
        Environment = "dev"
        Terraform   = "true"
    }
}

resource "aws_rds_cluster_instance" "cinstances" {
    count = 3
    identifier = "aurora-cluster-demo-${count.index}"
    cluster_identifier = aws_rds_cluster.TFSatt.id
    instance_class = var.instancetype
    engine = aws_rds_cluster.TFSatt.engine
    engine_version = aws_rds_cluster.TFSatt.engine_version
    publicly_accessible = true
    tags = local.tags
}

resource "aws_rds_cluster" "TFSatt" {
    cluster_identifier = var.clusterid
    availability_zones = var.AZs
    engine             = var.db["engine"]
    engine_mode        = var.db["mode"]
    engine_version     = var.db["ver"]
    database_name = var.db["dbname"]
    master_username = var.db["uname"]
    master_password = var.db["pw"]
    skip_final_snapshot = true
    vpc_security_group_ids = [var.sg]
    db_subnet_group_name = "default"
    tags = local.tags
}

resource "aws_db_instance" "mssql" {
    identifier = "rds-mssql"
    allocated_storage = "20"
    license_model = "license-included"
    storage_type = "gp2"
    engine = "sqlserver-ex"
    engine_version = "15.00.4198.2.v1"
    instance_class = "db.t3.medium"
    multi_az = false
    username = var.db["uname"]
    password = var.db["pw"]
    vpc_security_group_ids = [var.sg]
    backup_retention_period = 3
    skip_final_snapshot = true
    tags = local.tags
    publicly_accessible = true
    db_subnet_group_name = "default"
}