# ADR-001: Subnetting and Routing Decisions

## Status
Accepted

## Context
To support multi-tier architecture and ensure secure and scalable network design, two VPCs are configured:
- **VPC-A** (e.g., app network)
- **VPC-B** (e.g., data network)

Each VPC contains:
- Public subnets (for NAT, ALB)
- Private subnets (for EC2, RDS)

Routing decisions affect reachability, internet access, and inter-VPC communication.

## Decision
- **CIDR Blocks**:  
  - VPC-A: `10.0.0.0/16`  
  - VPC-B: `10.1.0.0/16`

- **Subnet Layout**:  
  - Public subnets: `/24` per AZ  
  - Private subnets: `/22` per AZ

- **Routing Rules**:
  - Public subnets route `0.0.0.0/0` via **Internet Gateway**
  - Private subnets route `0.0.0.0/0` via **NAT Gateway**
  - VPC Peering routes added for cross-VPC traffic

- **Peering Configuration**:  
  - VPC-A ↔ VPC-B peering established  
  - Route tables updated on both sides

## Network Diagram
```mermaid
graph TD
  subgraph VPC_A
    direction TB
    IGW_A["Internet Gateway"]
    NAT_A["NAT Gateway"]
    PUB_A1["Public Subnet 1<br/>(10.0.1.0/24)"]
    PUB_A2["Public Subnet 2<br/>(10.0.2.0/24)"]
    PRIV_A1["Private Subnet 1<br/>(10.0.4.0/22)"]
    PRIV_A2["Private Subnet 2<br/>(10.0.8.0/22)"]
    IGW_A-->|"0.0.0.0/0"|PUB_A1
    IGW_A-->|"0.0.0.0/0"|PUB_A2
    PUB_A1-->|"EIP"|NAT_A
    PUB_A2-->|"EIP"|NAT_A
    NAT_A-->|"0.0.0.0/0"|PRIV_A1
    NAT_A-->|"0.0.0.0/0"|PRIV_A2
  end
  subgraph VPC_B
    direction TB
    IGW_B["Internet Gateway"]
    NAT_B["NAT Gateway"]
    PUB_B1["Public Subnet 1<br/>(10.1.1.0/24)"]
    PUB_B2["Public Subnet 2<br/>(10.1.2.0/24)"]
    PRIV_B1["Private Subnet 1<br/>(10.1.4.0/22)"]
    PRIV_B2["Private Subnet 2<br/>(10.1.8.0/22)"]
    IGW_B-->|"0.0.0.0/0"|PUB_B1
    IGW_B-->|"0.0.0.0/0"|PUB_B2
    PUB_B1-->|"EIP"|NAT_B
    PUB_B2-->|"EIP"|NAT_B
    NAT_B-->|"0.0.0.0/0"|PRIV_B1
    NAT_B-->|"0.0.0.0/0"|PRIV_B2
  end
  PRIV_A1-->|"Peering"|PRIV_B1
  PRIV_A2-->|"Peering"|PRIV_B2
  PRIV_B1-->|"Peering"|PRIV_A1
  PRIV_B2-->|"Peering"|PRIV_A2
```

## Rationale
- Enables public web access and private service isolation
- Peering allows communication without exposing resources to internet
- NAT provides secure outbound access for private subnets

## Consequences
- Slight cost increase due to NAT Gateway
- Requires route table hygiene and ACL checks
- Scalability maintained through modular subnetting

## Alternatives Considered
- Centralized Transit Gateway (too early-stage for this setup)
- Flat single VPC (less separation of concerns)