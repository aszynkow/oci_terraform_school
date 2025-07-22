# Session 0: Introduction to Terraform

Welcome to **Session 0** of the OCI Terraform School. In this session, you'll understand what Terrafrom is and how it works with Cloud API's

---

## ✅ What You'll Learn

- What is Terraform
- How it works with Cloud API's
- What is a Terraform state file

---


## **What Is Terraform?**

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows you to define and manage cloud infrastructure using configuration files written in a declarative language called HCL (HashiCorp Configuration Language).

## **How It Works with APIs**

1. You write a **.tf** file defining the desired infrastructure (e.g., a compute instance in OCI).

2. Terraform uses a provider (like oci) to translate your config into API calls.

3. Terraform sends authenticated API requests to **Oracle Cloud Infrastructure**.

4. OCI creates, modifies, or destroys resources based on the API calls.

![Terraform Provider: Flow](../images/tfprovider_flow.png)

**Example:**

example.tf file:

    resource "oci_core_vcn" "example" {
    cidr_block     = "10.0.0.0/16"
    display_name   = "example-vcn"
    compartment_id = "ocid1.compartment.oc1..."
    }

Terraform provider's job is to map the varibales, crate a payload and call an API.

    Map variables and create a payload:

    cidr_block     -> cidrBlock
    display_name   -> displayName
    compartment_id -> compartmentId

    API Call:

    POST https://iaas.ap-sydney-1.oraclecloud.com/20160918/vcns
    Authorization: Signature ...
    Content-Type: application/json
    {
    "cidrBlock": "10.0.0.0/16",
    "displayName": "example-vcn",
    "compartmentId": "ocid1.compartment.oc1..."
    }

## **What Is the Terraform State File?**

After applying the configuration and OCI creates the resource, **Terraform writes metadata into a local file called `terraform.tfstate`**.

The **state file** keeps track of:

- The resources Terraform manages
- Their real-world IDs (like OCIDs)
- Attributes (like IP addresses, OCID, shape, etc.)

This file is crucial for:

- **Tracking changes**: so Terraform knows what to add, change, or destroy
- **Drift detection**: identifying manual changes in the cloud
- **Enabling collaboration**: via remote state storage like OCI Object Storage or Terraform Cloud

> **Warning**: The state file may contain sensitive information (e.g., passwords, secrets), so treat it securely.

## 🚀 Coming Up in Session 1

We'll start Terraform set up for OCI and deploy a compartment.

---

📁 **Next:** [Session 1 - Setup and BAsics](../session1_setup_and_basics/README.md)