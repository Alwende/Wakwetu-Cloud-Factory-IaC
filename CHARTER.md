# PROJECT CHARTER: WAK-IAC-2026 (THE IaC FACTORY)

## 1. PROJECT IDENTIFICATION
* **Project Name:** Wakwetu Enterprise Landing Zone Automation
* **Lead Authority:** Dan Alwende, PMP | Enterprise Solutions Architect
* **Status:** Phase 4 Complete - Awaiting Decommissioning

## 2. BUSINESS CASE
To eliminate the manual errors and "Configuration Drift" identified in Project 1. By codifying the infrastructure, we ensure that the "Liquid" Network and "AIME" Cluster can be redeployed globally in under 15 minutes with 100% accuracy.

## 3. TECHNICAL SCOPE
* **IaC Engine:** Terraform v1.14.6
* **State Management:** S3 Remote Backend with DynamoDB Locking.
* **Network:** Multi-AZ VPC with Public/Private Subnet Tiers and NAT Gateway.
* **Compute:** Managed Amazon EKS Cluster with Automated Node Groups.

## 4. MILESTONES & SUCCESS CRITERIA
* **M1 (Foundation):** Remote state locked and encrypted. [SUCCESS]
* **M2 (Network):** VPC and NAT Gateway verified via Terraform Apply. [SUCCESS]
* **M3 (Security):** IAM roles imported and policies attached via code. [SUCCESS]
* **M4 (Execution):** 2 Nodes in "Ready" status confirmed via Kubectl. [SUCCESS]

**APPROVAL:** Dan Alwende, PMP
