# PROJECT CHARTER: WAK-IAC-2026 (THE IaC FACTORY)

## 1. PROJECT IDENTIFICATION
* **Project Name:** Wakwetu Enterprise Landing Zone Automation
* **Lead Authority:** Dan Alwende, PMP | Enterprise Solutions Architect
* **Status:** AUTHORIZED / IN-PROGRESS

## 2. PROJECT OBJECTIVE
To eliminate manual configuration errors and "Configuration Drift" identified during the Project 1 audit. This project will codify the "Liquid" Network and "AIME" Cluster into a repeatable, version-controlled architecture.

## 3. TECHNICAL STRATEGY
* **IaC Engine:** Terraform (Industry Standard for Enterprise Scale).
* **State Management:** Implementation of S3 Remote Backend with DynamoDB State Locking to ensure governance and prevent corruption.
* **Network Topology:** Multi-AZ VPC with tiered Public/Private subnets.
* **Security:** Least-privilege IAM roles codified and attached to Managed EKS Node Groups.

## 4. MILESTONES & PLANNED DELIVERABLES
* **Milestone 1:** Establish Remote State Foundation (S3/DynamoDB).
* **Milestone 2:** Provision Modular VPC with NAT Gateway for Private Subnet egress.
* **Milestone 3:** Deploy IAM Security Guardrails for Cluster Authority.
* **Milestone 4:** Automate EKS Cluster and Worker Node provisioning.

**AUTHORIZATION:** Dan Alwende, PMP
**DATE:** February 26, 2026
