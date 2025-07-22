// Add your resources here
resource oci_identity_compartment tfschool {
    compartment_id = var.compartment_ocid
    description = var.compartment_description
    name = var.compartment_name
    enable_delete = var.enable_delete
}