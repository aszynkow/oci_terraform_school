# Session 0: Introduction to Terraform

- Overview of Terraform
- Providers and Resources
- How Terraform interacts with OCI APIs

```mermaid
graph TD
    A[Terraform CLI] --> B[Terraform Provider (OCI)]
    B --> C[OCI REST API]
    C --> D[OCI Services: VCN, Compute, DB]
```
