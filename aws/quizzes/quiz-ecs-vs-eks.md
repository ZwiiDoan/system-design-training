# AWS Container Orchestration Quiz: ECS vs. EKS

Test your knowledge of the trade-offs between Amazon ECS (on Fargate) and Amazon EKS for various deployment scenarios within the Robo-Advisor context.

---

### Instructions
- For each question, select the best answer (A, B, C, or D).
- After completing all questions, check your answers against the provided solutions and reviews.
- Tally your correct answers for a final score.

---

### Question 1
A startup is building the initial version of the Robo-Advisor's public API. They need to deploy quickly and minimize operational overhead. Which service is the better choice?

A. EKS, because it offers more control for future growth.
B. ECS on Fargate, because it abstracts away server management.
C. EKS with managed node groups, as it simplifies worker node provisioning.
D. ECS on EC2, as it provides the most cost-effective solution for small workloads.

**Answer:** B

**Review:**
A: Incorrect. While EKS offers more control, it comes with higher operational overhead, which is not ideal for a startup prioritizing speed.
B: Correct. ECS on Fargate is the best choice for minimizing operational overhead as it manages the underlying infrastructure.
C: Incorrect. Managed node groups simplify EKS, but it's still more complex than ECS on Fargate.
D: Incorrect. ECS on EC2 requires managing EC2 instances, adding to the operational overhead.

---

### Question 2
The Robo-Advisor's portfolio simulation service requires a complex, stateful workload with custom networking rules and specific instance types for performance. The team has deep Kubernetes expertise. Which platform is more suitable?

A. ECS on Fargate, as it automatically handles scaling and networking.
B. EKS, as it provides the required flexibility and control over the underlying infrastructure.
C. ECS on EC2, because it allows custom AMIs.
D. AWS Batch, as it is designed for stateful workloads.

**Answer:** B

**Review:**
A: Incorrect. ECS on Fargate is less suitable for complex, stateful workloads with custom networking needs.
B: Correct. EKS is the ideal choice for teams with Kubernetes expertise who need maximum control and flexibility.
C: Incorrect. While ECS on EC2 allows custom AMIs, EKS provides a more robust and feature-rich environment for complex applications.
D: Incorrect. AWS Batch is a batch computing service, not a general-purpose container orchestrator.

---

### Question 3
A cost-conscious organization wants to run the Robo-Advisor's back-testing engine, which has spiky, unpredictable traffic. They want to avoid paying for idle resources. Which option is the most cost-effective?

A. EKS with Cluster Autoscaler, as it can scale nodes to zero.
B. ECS on Fargate, as it charges per-task vCPU and memory per second.
C. A dedicated fleet of EC2 instances running a custom orchestration script.
D. EKS with Karpenter, as it provisions right-sized nodes on demand.

**Answer:** B

**Review:**
A: Incorrect. While the Cluster Autoscaler can scale nodes, it may not be as cost-effective as Fargate for spiky workloads.
B: Correct. ECS on Fargate's serverless nature makes it highly cost-effective for unpredictable traffic, as you only pay for what you use.
C: Incorrect. A dedicated fleet of EC2 instances would lead to paying for idle resources.
D: Incorrect. Karpenter is a powerful tool, but Fargate's pricing model is simpler and often more cost-effective for spiky workloads.

---

### Question 4
The Robo-Advisor's data-ingestion pipeline needs to integrate with a wide range of open-source monitoring and logging tools from the CNCF ecosystem, such as Prometheus and Fluentd. Which platform offers the most seamless integration?

A. ECS, because of its deep integration with CloudWatch.
B. EKS, because it is based on upstream Kubernetes and supports the CNCF ecosystem natively.
C. Both ECS and EKS have equal support for CNCF tools.
D. AWS Lambda, as it can be triggered by various data sources.

**Answer:** B

**Review:**
A: Incorrect. While ECS integrates well with CloudWatch, EKS offers broader and more native support for the CNCF ecosystem.
B: Correct. EKS's conformance with upstream Kubernetes makes it the natural choice for integrating with CNCF projects.
C: Incorrect. EKS has a distinct advantage in CNCF tool integration.
D: Incorrect. AWS Lambda is a serverless compute service, not a container orchestration platform.

---

### Question 5
A security team mandates that the Robo-Advisor's containerized services must use fine-grained IAM permissions to access other AWS services (e.g., S3, DynamoDB). Which feature is specific to EKS for achieving this at the pod level?

A. IAM Roles for Tasks.
B. IAM Roles for Service Accounts (IRSA).
C. Security Groups for Pods.
D. Network Access Control Lists (NACLs).

**Answer:** B

**Review:**
A: Incorrect. IAM Roles for Tasks is an ECS feature.
B: Correct. IRSA is the EKS-specific feature for assigning IAM roles to pods.
C: Incorrect. Security Groups for Pods is a feature for controlling network traffic, not IAM permissions.
D: Incorrect. NACLs are a VPC-level security feature.

---

### Question 6
A development team is new to containers. Their priority is the fastest possible "code-to-cloud" experience for a simple, stateless API for the Robo-Advisor. Which platform has the lowest learning curve and fastest setup time?

A. EKS, because `eksctl` simplifies cluster creation.
B. ECS on Fargate, due to its simpler API and managed nature.
C. Kubernetes on bare metal for ultimate control.
D. EKS Distro on-premises.

**Answer:** B

**Review:**
A: Incorrect. `eksctl` simplifies EKS, but ECS on Fargate is still significantly easier to learn and use.
B: Correct. ECS on Fargate offers the lowest barrier to entry for teams new to containers.
C: Incorrect. Bare metal Kubernetes is the most complex option.
D: Incorrect. EKS Distro is for on-premises deployments and adds complexity.

---

### Question 7
The Robo-Advisor's machine learning inference service requires GPU instances. The team wants to manage the container orchestration but not the underlying Kubernetes control plane. Which setup is appropriate?

A. ECS on Fargate with GPU support.
B. EKS with managed node groups using GPU instance types.
C. ECS on EC2 using GPU-optimized AMIs.
D. Both B and C are valid options.

**Answer:** B (Wrong)

**Review:**
A: Incorrect. ECS on Fargate does not currently support GPU instances.
B: Correct. EKS with managed node groups is a great option for running GPU workloads.
C: Correct. ECS on EC2 also supports GPU instances and is a valid choice.
D: Correct. Both B and C are valid and appropriate setups for this use case.

---

### Question 8
An architect is designing the Robo-Advisor for a large enterprise. They need to enforce consistent networking and security policies across multiple development teams and applications. Which platform provides a more powerful and extensible policy engine (e.g., using Calico or Cilium)?

A. ECS, using Security Groups and NACLs.
B. EKS, by leveraging Kubernetes Network Policies and CNI plugins.
C. AWS App Mesh for both ECS and EKS.
D. Fargate, as it handles all networking policies automatically.

**Answer:** B

**Review:**
A: Incorrect. ECS's networking and security features are less extensible than EKS's.
B: Correct. EKS's support for Network Policies and custom CNI plugins provides a powerful and flexible policy engine.
C: Incorrect. While App Mesh can be used with both, EKS's native capabilities are more powerful for this use case.
D: Incorrect. Fargate's managed networking is not as customizable as what's possible with EKS.

---

### Question 9
The Robo-Advisor's core trading engine requires high availability and must withstand the failure of an entire Availability Zone. When using EKS, how is control plane resilience achieved?

A. The user must manually provision control plane instances across multiple AZs.
B. The EKS control plane is automatically replicated across at least three AZs by AWS.
C. The control plane runs in a single AZ, and users must implement a custom disaster recovery plan.
D. Resilience is achieved by deploying multiple EKS clusters in different regions.

**Answer:** B

**Review:**
A: Incorrect. AWS manages the EKS control plane's availability.
B: Correct. The EKS control plane is designed for high availability and is automatically spread across multiple AZs.
C: Incorrect. The control plane is not a single point of failure.
D: Incorrect. While multi-region deployments can enhance resilience, the control plane itself is already highly available within a region.

---

### Question 10
A FinTech company is migrating its existing Kubernetes-based applications for the Robo-Advisor to AWS. They want to maintain their existing YAML deployment manifests and Helm charts with minimal changes. Which service is the most direct migration path?

A. ECS on Fargate, by converting manifests to Task Definitions.
B. EKS, as it is a conformant Kubernetes service.
C. AWS App2Container to refactor the application for ECS.
D. Elastic Beanstalk with a Docker platform.

**Answer:** B

**Review:**
A: Incorrect. Converting Kubernetes manifests to ECS Task Definitions would require significant effort.
B: Correct. EKS provides a conformant Kubernetes environment, making it the easiest migration path for existing Kubernetes applications.
C: Incorrect. App2Container is a tool for containerizing applications, not for migrating between orchestrators.
D: Incorrect. Elastic Beanstalk is a PaaS offering and is not a direct replacement for Kubernetes.

---

## Final Score

You scored: **9/10**

- 9-10: Excellent! You have a strong grasp of AWS Container Orchestration concepts.
- 7-8: Good job! Review the explanations for any missed questions.
- 5-6: Fair. Consider revisiting AWS documentation and best practices for ECS and EKS.
- 0-4: Review the fundamentals and try again. Consider hands-on labs and official AWS whitepapers.
