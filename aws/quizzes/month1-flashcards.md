# Flashcards

## AWS Load Balancer

**Question 1:** Which load balancer supports HTTP/3 end-to-end today?
<details>
<summary>Answer</summary>
Neither
</details>

**Question 2:** You must keep the source IP visible to backend services for audit. Which LB?
<details>
<summary>Answer</summary>
NLB only
</details>

**Question 3:** Requirement: terminate TLS and route by Server Name Indication (SNI) at L4. Choose:
<details>
<summary>Answer</summary>
NLB
</details>

**Question 4:** Which metric contributes to both ALB and NLB Load Balancer Capacity Units?
<details>
<summary>Answer</summary>
Processed bytes
</details>

**Question 5:** Need 1 M req/s with sub-10 ms latency spanned across two static EIPs. Pick _____ .
<details>
<summary>Answer</summary>
NLB
</details>

**Question 6:** For WebSocket chat, sticky sessions are undesirable. Which LB & feature combo avoids stickiness?
<details>
<summary>Answer</summary>
ALB with duration-cookie off or NLB
</details>

**Question 7:** Which type can directly integrate with AWS WAF?
<details>
<summary>Answer</summary>
ALB
</details>

**Question 8:** You’ve deployed on Outposts and want minimum 200 LCUs locked in for a flash sale. Supported on?
<details>
<summary>Answer</summary>
Both
</details>

**Question 9:** Which LB now lets you disable an Availability Zone without deletion?
<details>
<summary>Answer</summary>
Both
</details>

**Question 10:** True/False: ALB path-based routing supports gRPC streams.
<details>
<summary>Answer</summary>
True
</details>

## IAM

**Question 1:** Your team needs to allow an application running on an EC2 instance to access objects in a specific S3 bucket. Which is the MOST secure and scalable way to grant this access?
<details>
<summary>Answer</summary>
Create an IAM role with a policy to access the bucket and assign it to the instance
</details>

**Question 2:** Which of the following best describes the difference between IAM users and IAM roles?
<details>
<summary>Answer</summary>
IAM roles are intended for temporary credentials, IAM users for long-term credentials
</details>

**Question 3:** A company wants to allow its employees to access the AWS Management Console using corporate credentials through an identity provider (IdP). What AWS feature enables this?
<details>
<summary>Answer</summary>
SAML-based federated access
</details>

**Question 4:** Which of the following statements about IAM policies is TRUE?
<details>
<summary>Answer</summary>
Managed policies can include trust relationships
</details>

**Question 5:** You want to allow users in Account A to access resources in Account B. What is the recommended approach?
<details>
<summary>Answer</summary>
Create a resource-based policy in Account B and a role with trust policy for Account A
</details>

**Question 6:** A junior engineer created a new IAM user but cannot access any AWS services. What is the MOST likely reason?
<details>
<summary>Answer</summary>
The IAM user has no permissions policy attached
</details>

**Question 7:** You want to ensure that no user in your organization can delete a specific S3 bucket, regardless of other permissions. What should you use?
<details>
<summary>Answer</summary>
SCP with deny statement
</details>

**Question 8:** Which IAM feature helps organizations delegate administrative control without sharing root credentials?
<details>
<summary>Answer</summary>
IAM roles with trust relationships
</details>

**Question 9:** An EC2 instance profile is:
<details>
<summary>Answer</summary>
A wrapper for a role that can be attached to an EC2 instance
</details>

**Question 10:** What is the purpose of a trust policy in AWS IAM?
<details>
<summary>Answer</summary>
It specifies who can assume the IAM role
</details>

## S3 & CloudFront

**Question 1:** A financial advisory firm hosts a static website on Amazon S3 behind a CloudFront distribution. After updating a PDF brochure in the S3 bucket, some users still receive the outdated version. What could be the cause of this behavior?
<details>
<summary>Answer</summary>
- CloudFront has not fetched the updated object due to cache expiration settings.
- CloudFront is configured to ignore origin cache-control headers.
</details>

**Question 2:** A developer wants to ensure that CloudFront always checks with the origin before serving a cached version of a financial report hosted on S3. Which configuration will help achieve this?
<details>
<summary>Answer</summary>
Use the must-revalidate directive in the object's cache-control metadata.
</details>

**Question 3:** Your team is designing a secure document portal. Documents are stored in an S3 bucket and accessed only via CloudFront using signed URLs. Which steps should you take to prevent users from bypassing CloudFront and accessing S3 directly?
<details>
<summary>Answer</summary>
- Enable Origin Access Control (OAC) and deny public access to the S3 bucket.
- Create a bucket policy that only allows access from CloudFront's OAC principal.
</details>

**Question 4:** You are optimizing a Robo-Advisor frontend hosted on S3 and delivered via CloudFront. Your goal is to reduce latency and S3 data transfer costs. Which actions will best achieve this goal?
<details>
<summary>Answer</summary>
- Set a long max-age value on frequently accessed static assets.
- Configure CloudFront to compress content automatically.
</details>

**Question 5:** A team is deploying a static frontend using S3 and CloudFront. After deployment, users report seeing old versions of the application even after a new release. Which options can help ensure users receive the updated content without explicitly invalidating the cache?
<details>
<summary>Answer</summary>
- Append a version query string to asset URLs during deployment.
- Configure a low max-age and no-cache on asset metadata.
</details>

**Question 6:** An architect is designing a secure static file delivery system. The files reside in S3 and are accessed globally via CloudFront. The architecture must support: - Granular access control - Logging of access - Blocking direct S3 access Which combination satisfies these requirements?
<details>
<summary>Answer</summary>
- Enable CloudFront logging to an S3 bucket.
- Use OAC and deny all public access to the S3 bucket.
- Enable CloudTrail data events for the S3 bucket.
</details>

**Question 7:** An update to a client dashboard was made and uploaded to an S3 bucket. However, some end users still see stale content through CloudFront. What is the MOST efficient method to propagate the changes immediately?
<details>
<summary>Answer</summary>
Invalidate the specific file paths in the CloudFront distribution.
</details>

**Question 8:** You are tasked with optimizing content delivery for a global investment platform. The platform uses CloudFront backed by S3, and some assets (e.g., charts, PDFs) are updated infrequently but are accessed frequently worldwide. Which strategy provides the best balance of performance and cost-efficiency?
<details>
<summary>Answer</summary>
- Set a high max-age TTL for those assets in CloudFront behaviors.
- Use S3 Intelligent-Tiering for automatic cost optimization.
</details>

**Question 9:** A junior engineer configures a CloudFront distribution for an S3-hosted web application. After deployment, analytics show a low cache hit ratio. Which actions should the Solutions Architect take to improve caching efficiency?
<details>
<summary>Answer</summary>
- Ensure that cacheable assets (JS, CSS, images) use long TTLs and are versioned via file names.
- Review and minimize dynamic query string use in frontend requests.
</details>

**Question 10:** A financial news portal uses S3 to store HTML articles and CloudFront for global delivery. The editorial team frequently updates article content, but users still receive old versions even after refresh. The architecture must maintain performance while ensuring fresh content delivery. Which approach best meets these goals with minimal operational overhead?
<details>
<summary>Answer</summary>
- Enable CloudFront cache invalidation after each article update.
- Configure shorter TTLs in CloudFront behaviors for HTML content only.
</details>


# Why It Matters

### Why do IAM Roles matter for building secure, cloud-native applications?
**Answer:** They provide temporary credentials for services and federated users, eliminating the need to manage long-lived keys. This is critical for FinTech, where preventing credential leakage is a top security priority.

---

### Why does VPC Peering matter in a multi-VPC architecture?
**Answer:** It enables private, secure communication between VPCs without traversing the public internet. For a Robo-Advisor, this means the application VPC can securely access a database in a separate data VPC, isolating critical data while maintaining low-latency access.

---

### Why does CloudFront Origin Access Control (OAC) matter for hosting a secure frontend?
**Answer:** OAC ensures that users can only access the S3 bucket content through the CloudFront distribution, not directly via the S3 URL. This prevents attackers from bypassing CloudFront's security features (like WAF) and directly accessing potentially sensitive static assets.

---

### Why do S3 Lifecycle Policies matter for cost optimization in a FinTech platform?
**Answer:** They automate the process of moving data to cheaper storage tiers (e.g., from S3 Standard to Glacier) as it becomes less frequently accessed. For a Robo-Advisor, this is essential for managing the cost of storing years of historical trade data and customer documents while meeting regulatory retention requirements.
