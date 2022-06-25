## default value of securitygroup can be overridden on the command line
##like this terraform plan -var="securitygroup=sg-933221123"

##if not default is provided - Terraform will command prompt input
##request the value for the securitygroup
variable "securitygroup" {
    default = "sg-0a7d79a922bf0d2d4"
}
variable "sgcidr" {
    default = "24.151.71.66/32"
}

##Example of setting a type for a variable
variable "instancetype" {
    type = string
    default = "db.t3.medium"
}

variable "clusterid" {
    type = string
    default = "aurora-postgres"
}

#example of a list variable type and default value assignment
variable "AZs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "db" {
    type = map
    default = {
        engine = "aurora-postgresql"
        mode = "provisioned"
        ver = "13.6"
        dbname = "AnimalFarm"
        uname = "postgres"
        pw = "DucksGeeseChickens"
    }
}

variable "sg" {
    type = string
    default = "sg-0ed8a069614427654"
}

variable "clusterindex" {
    type = number
    default = 0
}