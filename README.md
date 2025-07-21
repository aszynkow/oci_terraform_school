# 🌩️ OCI Terraform School – Hands-On Course for Cloud Engineers

Welcome to the **OCI Terraform School**, a structured, hands-on course designed to teach **cloud engineers new to Terraform** how to plan, write, and deploy cloud infrastructure using **Infrastructure as Code (IaC)** on **Oracle Cloud Infrastructure (OCI)**.

This 10-week journey covers everything from the basics of Terraform and providers, through real-world OCI services like **VCNs, compute instances, load balancers, databases**, and advanced topics like **modules, state management, and CI/CD integration**.

---

### 🎯 Who This Is For

- OCI cloud engineers with little or no Terraform experience
- Pre-sales, DevOps, or operations engineers looking to automate OCI
- Teams transitioning from manual console provisioning to IaC

---

### 🧭 What You'll Learn

- How Terraform works and talks to the OCI API  
- Writing reusable, scalable `.tf` code  
- Automating the provisioning of networks, compute, databases, etc.  
- Working with state files, variables, outputs, modules  
- Using cloud-init for instance bootstrapping  
- Integrating IaC into Git workflows and CI/CD pipelines

---

### 📦 What's Inside

Each folder represents one week of the course, with:

- ✅ A detailed `README.md` lab walkthrough
- ✅ Starter Terraform files (`provider.tf`, `main.tf`, `variables.tf`, etc.)
- ✅ Sample scripts (like `cloud-init.sh`)
- ✅ Real OCI examples and architecture patterns
- ✅ Exercises to reinforce each topic

---

### 🚀 Get Started

Start with [Session 0 – What is Terraform and How It Works](./session-00-intro/README.md)  
Or jump to any module from the table below 👇

## Sessions
- [Introduction to Terraform, providers, and APIs](./session0_intro_to_terraform/README.md)
- [Terraform installation, CLI commands, and provider setup](./session1_setup_and_basics/README.md)
- [Create a VCN and subnet using Terraform](./session2_vcn_and_subnet/README.md)
- [Launch a compute instance with cloud-init](./session3_compute_instance/README.md)
- [Deploy an OKE Kubernetes cluster](./session4_oke_cluster/README.md)
- [Provision ADB and DB Systems](./session5_oci_databases/README.md)
- [Refactor previous code using modules](./session6_modules/README.md)
- [Configure and use remote state in Object Storage](./session7_remote_state/README.md)
- [Build a full-stack app infrastructure using all components](./session8_final_project/README.md)
