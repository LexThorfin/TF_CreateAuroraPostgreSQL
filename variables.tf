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
variable "instancetype" {
    default = "db.t3.medium"
}