# PROJECT 4: EXECUTION EVIDENCE

## 1. KUBERNETES NODE HANDSHAKE
Verification of worker nodes joining the Control Plane from Private Subnets via NAT Gateway.

```bash
$ kubectl get nodes
NAME                         STATUS   ROLES    AGE     VERSION
ip-10-0-3-77.ec2.internal    Ready    <none>   3m55s   v1.35.0-eks-70ce843
ip-10-0-4-138.ec2.internal   Ready    <none>   3m55s   v1.35.0-eks-70ce843
```

## 2. TERRAFORM STATE AUDIT
Infrastructure managed via Remote S3 Backend with DynamoDB Locking.
- S3 Bucket: wakwetu-terraform-state-dan-alwende
- DynamoDB Table: wakwetu-terraform-locks
