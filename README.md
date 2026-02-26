# WAKWETU CLOUD FACTORY: Automated Enterprise Landing Zone

## PROJECT OVERVIEW
This project transitions the **Wakwetu Cloud Infrastructure** from manual, console-driven deployments to a fully automated **Infrastructure-as-Code (IaC)** model using **Terraform**. 

By codifying the environment, we eliminate configuration drift, enhance security via modular guardrails, and ensure 100% repeatability across regions.

## ARCHITECTURAL STANDARDS (The PMP Bar)
- **Immutability:** Zero manual changes in the AWS Console. 
- **Governance:** Remote State Management using **Amazon S3** and **DynamoDB** (State Locking).
- **Security-by-Design:** Private-tier EKS nodes with outbound-only internet access via **NAT Gateway**.
- **Modularity:** Reusable VPC, Security, and EKS modules.



## REPOSITORY STRUCTURE
- `bootstrap/`: Sets up the S3/DynamoDB Backend (The Foundation).
- `modules/`: Reusable architectural blueprints (VPC, Security, EKS).
- `environments/prod/`: The live implementation "wiring" and remote state config.

## KEY ACHIEVEMENTS
1. **Resolved Node Handshake Failure:** Diagnosed and remediated EKS Node Group registration issues by architecting a NAT Gateway solution within the VPC module.
2. **Brownfield Integration:** Successfully imported existing IAM roles into Terraform management without service interruption.

## TECHNICAL VERIFICATION
Verification of worker nodes successfully joining the Control Plane from Private Subnets:
```bash
$ kubectl get nodes
NAME                         STATUS   ROLES    AGE     VERSION
ip-10-0-3-77.ec2.internal    Ready    <none>   3m55s   v1.35.0-eks-70ce843
ip-10-0-4-138.ec2.internal   Ready    <none>   3m55s   v1.35.0-eks-70ce843
```

**LEAD ARCHITECT:** Dan Alwende, PMP

## ARCHITECTURAL DESIGN (HLD)
The following diagram represents the automated Wakwetu Landing Zone.

```mermaid
graph TD
    subgraph "AWS Cloud (us-east-1)"
        subgraph "Management Plane (IaC Foundation)"
            S3[(S3: Terraform State)]
            DB[(DynamoDB: State Lock)]
        end

        subgraph "Network Plane (Liquid VPC)"
            VPC[VPC: 10.0.0.0/16]
            IGW[Internet Gateway]
            NAT[NAT Gateway]
            
            subgraph "Public Subnets (AZ-A/B)"
                Pub1[Public Subnet 1]
                Pub2[Public Subnet 2]
            end
            
            subgraph "Private Subnets (AZ-A/B)"
                Priv1[Private Subnet 1]
                Priv2[Private Subnet 2]
            end
        end

        subgraph "Compute Plane (EKS Factory)"
            EKS[EKS Control Plane]
            Node1[Worker Node 1]
            Node2[Worker Node 2]
        end

        subgraph "Security Guardrails"
            IAM[IAM Roles: Cluster & Node]
            SG[Security Groups]
        end
    end

    %% Connectivity
    IGW --> Pub1
    NAT --> Priv1
    NAT --> Priv2
    EKS --- Node1
    EKS --- Node2
    Node1 --- Priv1
    Node2 --- Priv2
    S3 --- DB
```

## PROJECT EVIDENCE (THE PROOF)
### 1. Networking & VPC Topology
![VPC Topology](assets/screenshots/vpc_topology.png)

### 2. Managed EKS Cluster Status
![EKS Active](assets/screenshots/eks_active.png)

### 3. Kubernetes Node Readiness
![Node Verification](assets/screenshots/kubectl_nodes.png)

### 4. Remote State Governance (S3)
![S3 Backend](assets/screenshots/s3_backend.png)
