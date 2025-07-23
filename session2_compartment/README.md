# 🌱 Session 2: Compartment 

Welcome to **Session 2** of the OCI Terraform School. In this session, you'll explore other ways of setting TF variables and provision an OCI compartment using Terraform commands.

---

## ✅ What You'll Learn

- How to use trraform.tfvars to set variables
- How to create and destroy an OCI compartment
- How to work with Outputs and variables

## 🛠 Step 0: Clone this repository (if you have not already)

```bash
cd ~
git clone https://github.com/aszynkow/oci_terraform_school.git 
```

## 🛠 Step 1: Run (dot) TF Environemnt sourcing script

Populate your environment sourcing script [sourceTfEnv.sh](../scripts/sourceTfEnv.sh)

```bash
. ./scripts/sourceTfEnv.sh
env | grep TF
```

Output:

```
TF_VAR_user_ocid=ocid1.user.oc1..
TF_VAR_fingerprint=f3:F4.....
TF_VAR_tenancy_ocid=ocid1.tenancy.oc1..
TF_VAR_region=ap-melbourne-1
TF_VAR_private_key_path=/path/to/private/api/key/apikey.pem
```

## Step 2. Set Resource Variables in `terraform.tfvars`

Next, create or edit a [terraform.tfvars](./terraform.tfvars) file to define the values of your custom variables used in resource creation:

```hcl
compartment_ocid        = "ocid1.compartment.oc1..xxxxx"
compartment_name        = "tf-school-compartment"
compartment_description = "Compartment for Terraform School demo"
```

These variables are defined in your [variables.tf](./variables.tf) file and are passed into modules or resources such as compartments, VCNs, and compute instances.

---

**Difference: OCI Terraform Provider's requred  variables vs OCI resource confgiuration variables**

| Type                        | Purpose                                                       | Example                                     |
|-----------------------------|---------------------------------------------------------------|---------------------------------------------|
| **Provider Env Variables**  | Used by the provider (OCI) for authentication                | `TF_VAR_tenancy_ocid`, `region`, etc.       |
| **tfvars File Variables**   | Used for configuring resource values in Terraform configs     | `compartment_name`, `vcn_cidr_block`, etc.  |

- ✅ **Provider environment variables** → Required for provider to make authenticated API calls
- ✅ **tfvars variables** → Used in defining and customizing the infrastructure

## 4. Initialize Terraform

Run `terraform init` to initialize your working directory and download the necessary provider plugins:

```bash
terraform init
```

---

## 5. Validate the Configuration

Make sure the configuration is syntactically valid and all required variables are accounted for:

```bash
terraform validate
```

---

## 6. Plan the Deployment

Check what resources will be created without applying any changes:

```bash
terraform plan
```

Expected output:

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

---

## 7. Apply the Configuration

Apply the plan and provision resources in OCI:

```bash
terraform apply
```

You’ll be prompted to confirm:

```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```

Or use the --auto-apply falg to force a 'yes' as a value fro a prompt above.

```bash
terraform apply --auto-apply
```

---

### 🔐 Explanation:

📁 main.tf

The main.tf file is where we define the actual OCI resource to be created — in this case, a compartment. This file uses the oci_identity_compartment resource type from the OCI Terraform provider.

```hcl
resource "oci_identity_compartment" "tfschool" {
  compartment_id = var.compartment_ocid
  description    = var.compartment_description
  name           = var.compartment_name
  enable_delete  = var.enable_delete
}
```

- **compartment_id:** This is the OCID of the parent compartment under which this new compartment will be created. It's passed as a variable (var.compartment_ocid).

- **description:** A user-defined description for the new compartment.

- **name:** The name to assign to the new compartment.

- **enable_delete:** A flag (true/false) which determines whether the compartment can be deleted using Terraform. If set to false, Terraform will not delete the compartment on terraform destroy.

This resource declaration allows Terraform to manage the lifecycle of an OCI compartment — including creating it, detecting changes, and (if permitted) deleting it.

- `enable_delete = false`: Protects the resource from being destroyed (`prevent_destroy = true`)
- `enable_delete = true`: Allows Terraform to delete the resource if needed

This is especially useful when working in production environments to avoid accidental data loss.

📁 outputs.tf

The outputs.tf file is used to expose important values created by the resource for reference or use in downstream modules, automation scripts, or simply for user visibility after deployment.

```hcl
output "parent_compartment_name" {
  value = oci_identity_compartment.tfschool.parent_compartment_name
}

output "parent_compartment_id" {
  value = oci_identity_compartment.tfschool.parent_compartment_id
}

output "compartment_id" {
  value = oci_identity_compartment.tfschool.compartment_id
}

output "compartment_name" {
  value = oci_identity_compartment.tfschool.name
}
```

- **parent_compartment_name:** Displays the name of the parent compartment in which the new compartment was created.

- **parent_compartment_id:** Outputs the OCID of the parent compartment.

- **compartment_id:** Outputs the OCID of the new compartment created by Terraform.

- **compartment_name:** Outputs the name of the newly created compartment.

These outputs are especially useful when chaining Terraform modules or providing quick verification of successful resource creation.
---

## ✅ Summary

- Use `sourceTfEnv.sh` to export OCI authentication variables
- Use `terraform.tfvars` to define custom infrastructure inputs
- Use of Terraform `resource` and `output` clause 
- Understand the difference between provider env vars and tfvars
- Run `init`, `validate`, `plan`, and `apply` to provision resourcess
- Use `enable_delete` to protect critical resources from deletion

## 🚀 Coming Up in Session 3

We'll start deploying more OCI infrastructure in existing Compartment — beginning with Virtual Cloud Networks and Subnets.

---

📁 **Next:** [Session 3 - VCNs and Subnets](../session3_vcn_and_subnet/README.md)