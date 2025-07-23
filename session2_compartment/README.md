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

## Step 3. Run Terraform Commands

### 🔸 Initialize Terraform

Run `terraform init` to initialize your working directory and download the necessary provider plugins:

```bash
terraform init
```

Expected output:

```
Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

---

### 🔸 Validate the Configuration

Make sure the configuration is syntactically valid and all required variables are accounted for:

```bash
terraform validate
```

---

### 🔸 Plan the Deployment

Check what resources will be created without applying any changes:

```bash
terraform plan
```

Expected output:

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # oci_identity_compartment.tfschool will be created
  + resource "oci_identity_compartment" "tfschool" {
      + compartment_id = "ocid1.compartment.oc1..aaaaaaaadd4reahxbwpu3usth6y2j4uzclwknj76ento4q63pajpekn6qjvq"
      + defined_tags   = (known after apply)
      + description    = "Compartment for Terraform School demo1"
      + enable_delete  = true
      + freeform_tags  = (known after apply)
      + id             = (known after apply)
      + inactive_state = (known after apply)
      + is_accessible  = (known after apply)
      + name           = "tf-school-compartmen"
      + state          = (known after apply)
      + time_created   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + compartment_id        = (known after apply)
  + compartment_name      = "tf-school-compartmen"
  + parent_compartment_id = "ocid1.compartment.oc1.."

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.
```

---

### 🔸 Apply the Configuration

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

Or use the --auto-approve falg to force a 'yes' as a value fro a prompt above.

```bash
terraform apply --auto-approve
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
output "parent_compartment_id" {
  value = var.compartment_ocid
}

output "compartment_id" {
  value = oci_identity_compartment.tfschool.id
}

output "compartment_name" {
  value = oci_identity_compartment.tfschool.name
}
```

- **var.compartment_ocid:** Outputs the OCID of the parent compartment whcih is value passed to the input variable

- **id:** Outputs the OCID of the new compartment created by Terraform.

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