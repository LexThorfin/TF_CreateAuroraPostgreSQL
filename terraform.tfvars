#this overrides the default value in variables.tf
#this file must be named terraform.tfvars - to be recognized and make changes to variable values
#to use a different filename you can specify it on the command line like this:
#terraform plan -var-file="customname.tfvars"

##we can set it as an environment variable with the below command line statement
#setx TF_VAR_instancetype t3.large
#In windows... You can set the environment variable with setx... But in order to use it you
#have to open or refresh your command line window.
instancetype="db.t3.medium"
