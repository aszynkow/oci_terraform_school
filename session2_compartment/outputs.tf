output "parent_compartment_id" {
  value = var.compartment_ocid
}

output  "compartment_id" {
  value = oci_identity_compartment.tfschool.id
}

output "compartment_name" {
  value = oci_identity_compartment.tfschool.name
}

