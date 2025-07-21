# Session 0: Introduction to Terraform

- Overview of Terraform
- Providers and Resources
- How Terraform interacts with OCI APIs

<details> <summary>
graph TD
    A[Terraform CLI] --> B[Terraform Provider (OCI)]
    B --> C[OCI REST API]
    C --> D[OCI Services: VCN, Compute, DB]
</summary>

![Terraform Provider: Flow](images/tfprovider_flow.png)
