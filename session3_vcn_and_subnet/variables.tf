variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable compartment_ocid {
    description = "ocid of the parent corpartment"
    default = ""
}

variable compartment_name {
    description = "Required. Name of the compartment that is being created"
    default = ""
}

variable compartment_description {
    description = "Required. Description of the compartment that is being created"
    default = ""
}

variable enable_delete {
    description = "Enables TF to delete the compartment. If not specifically set the TF default is false"
    default = true
}