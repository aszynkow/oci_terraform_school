# 🌱 Session 1: Setup and Basics

Welcome to **Session 1** of the OCI Terraform School. In this session, you'll set up your environment, install the required tools, and run your first Terraform commands.

---

## ✅ What You'll Learn

- How to install Terraform
- How to write a basic provider configuration
- How to run the core Terraform CLI commands

---
## 🛠 Step 0: Clone this repository 

```bash
cd ~
git clone  
```

## 🛠 Step 1: Install Terraform

1. Download Terraform from the [official site](https://developer.hashicorp.com/terraform/downloads).
2. Unzip the binary and place it in your system's `PATH`.
3. Verify installation:

```bash
terraform -version
```

## 🛠 Step 2: Create Your Terraform Provider Configuration

1. Create a [provider.tf](provider.tf) file
2. Define your variables in [variables.tf](variables.tf) file
            
## **Variable Value Precedence Order (Highest to Lowest):**
1. **Command-line arguments:**
 
    Arguments passed directly to the terraform command (e.g., terraform apply -var 'instance_type=t2.medium') override other sources.

2. **Environment variables (TF_VAR_name):**

    Environment variables prefixed with TF_VAR_ are used as variable values 
            
3. **Priority Variable Sets:**
            
    In HCP Terraform, variable sets with the "priority" attribute set will override variables from less specific scopes, according to HashiCorp Developer. 
            
4. ***.auto.tfvars files in test directories:**
            
    Variables defined in *.auto.tfvars files within test directories are given higher precedence than those in the main configuration directory, according to HashiCorp Developer. 
            
5. ***.auto.tfvars files:**
            
    Files with the .auto.tfvars extension are loaded automatically and their values are used. If multiple such files exist, they are loaded alphabetically, with the last one loaded taking precedence, according to Medium. 
            
6. **terraform.tfvars file:** -> Define your variables in [variables.tf](variables.tf) file
            
    The terraform.tfvars file is loaded by default, and its values are used if no other higher-priority sources provide values for the same variables. 
            
7. **Default values in variable definitions:**
            
    If no other source provides a value, the default value defined in the variable definition is used. 
            
8. **Values defined in the configuration:**

    Values defined directly within the Terraform configuration using var.variable_name are only used if no other source provides a value.        

## 🛠 Step 3: Source Terrafrom Environment

### 🔸 Populate TF Environemnt sourcing script

```bash
cd ~/oci_terraform_school
vi ./scripts/sourceTfEnv.sh
```

**Below are just examples so you still need to populate with values from your OCI tenancy or ~/.oci/config file if alerady have one**

export TF_VAR_user_ocid="ocid1.user.oc1.."
export TF_VAR_fingerprint="f3:F4....."
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1.."
export TF_VAR_region="ap-melbourne-1"
export TF_VAR_private_key_path="/path/to/private/api/key/apikey.pem"

### 🔸 SAve and run (dot) it

```bash
. ./scripts/sourceTfEnv.yf
```

## 🛠 Step 4: Run Terraform Commands

### 🔸 Initialize Terraform

```bash
terraform init
```

Output:

```
Terraform initialized in an empty directory!

The directory has no Terraform configuration files. You may begin working
with Terraform immediately by creating Terraform configuration files.
Shows what Terraform would do before applying changes.

This sets up your working directory and downloads the provider plugin.
```
---

### 🔸 Validate Your Code

```bash
terraform validate
```

Output:
```
Success! The configuration is valid.
```

---

### 🔸 Preview the Plan

```bash
terraform plan
```

Output:

```
Error: No configuration files
│ 
│ Plan requires configuration to be present. Planning without a configuration would mark
│ everything for destruction, which is normally not what is desired. If you would like to
│ destroy everything, run plan with the -destroy option. Otherwise, create a Terraform
│ configuration file (.tf file) and try again.
```

---

### 🔸 Apply the Plan

```bash
terraform apply
```

Output:

```
Error: No configuration files
│ 
│ Apply requires configuration to be present. Applying without a configuration would mark
│ everything for destruction, which is normally not what is desired. If you would like to
│ destroy everything, run 'terraform destroy' instead.
```

---

## 🗂 Recommended Folder Structure

```
session1-setup_and_basics/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars (optional)
└── README.md
```

---

## 🧠 Key Takeaways

- Terraform is installed and ready.
- OCI CLI is configured and can interact with Oracle Cloud.
- You have a basic `provider.tf` and variables setup.
- You know how to run the core Terraform commands: `init`, `validate`, `plan`, `apply`.

---

## 🚀 Coming Up in Session 2

We'll start deploying actual OCI infrastructure — beginning with Virtual Cloud Networks (VCNs) and subnets.

---

📁 **Next:** [Session 2 - Compartment](../session2_compartment/README.md)
