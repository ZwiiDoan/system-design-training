# IAM Practice Quiz – SAP-C02 Style

Test your knowledge of AWS IAM concepts with these multiple-choice questions based on real-world scenarios.

---

### Instructions
- For each question, select the best answer (A, B, C, or D).
- After completing all questions, check your answers against the provided solutions and reviews.
- Tally your correct answers for a final score.

---

### Question 1
Your team needs to allow an application running on an EC2 instance to access objects in a specific S3 bucket. Which is the MOST secure and scalable way to grant this access?

A. Create an IAM user with programmatic access and store the credentials on the instance  
B. Attach a bucket policy granting access to all EC2 instances  
C. Create an IAM role with a policy to access the bucket and assign it to the instance  
D. Manually copy access keys into the EC2 user data at launch time  

**Answer:** C

**Review:**  
A: Storing long-term credentials on an instance is insecure and not scalable.  
B: This is overly broad and not secure; it grants access to all EC2 instances, not just the intended one.  
C: Correct. Using an IAM role with a policy is secure, scalable, and follows AWS best practices.  
D: Manually copying access keys is insecure and hard to manage at scale.

---

### Question 2
Which of the following best describes the difference between IAM users and IAM roles?

A. IAM users are for applications, while IAM roles are for human users  
B. IAM users can assume IAM roles, but not vice versa  
C. IAM roles are intended for temporary credentials, IAM users for long-term credentials  
D. IAM users require trust policies; IAM roles do not  

**Answer:** C

**Review:**  
A: Both users and roles can be used by applications or humans.  
B: IAM users can assume roles, but roles can also be assumed by other roles or AWS services.  
C: Correct. IAM users have long-term credentials; roles provide temporary credentials.  
D: Trust policies are required for roles, not users.

---

### Question 3
A company wants to allow its employees to access the AWS Management Console using corporate credentials through an identity provider (IdP). What AWS feature enables this?

A. IAM roles with EC2 trust relationships  
B. Cross-account IAM roles  
C. SAML-based federated access  
D. IAM group with MFA enforced  

**Answer:** C

**Review:**  
A: EC2 trust relationships are for service roles, not SSO.  
B: Cross-account roles are for AWS account-to-account access, not SSO.  
C: Correct. SAML-based federation enables SSO with external IdPs.  
D: MFA is for extra security, not SSO.

---

### Question 4
Which of the following statements about IAM policies is TRUE?

A. Explicit deny overrides any allow  
B. Managed policies can include trust relationships  
C. IAM users can be attached to instance profiles  
D. IAM roles cannot use inline policies  

**Answer:** B

**Review:**  
A: This is true, but the question asks about policies, not policy evaluation.  
B: Correct. Managed policies are standalone and can be attached to multiple identities, but trust relationships are defined in trust policies, not managed policies.  
C: Only roles can be attached to instance profiles.  
D: IAM roles can have inline policies.

---

### Question 5
You want to allow users in Account A to access resources in Account B. What is the recommended approach?

A. Create IAM users in Account B for each user in Account A  
B. Use a VPC peering connection between the two accounts  
C. Create a resource-based policy in Account B and a role with trust policy for Account A  
D. Share resources using S3 Transfer Acceleration  

**Answer:** C

**Review:**  
A: This is not scalable or secure.  
B: VPC peering is for network connectivity, not IAM access.  
C: Correct. Cross-account access is best handled with a role and trust policy.  
D: S3 Transfer Acceleration is for speeding up S3 uploads/downloads, not access control.

---

### Question 6
A junior engineer created a new IAM user but cannot access any AWS services. What is the MOST likely reason?

A. The IAM user does not belong to a group  
B. The IAM user was created without a role  
C. The IAM user has no permissions policy attached  
D. The IAM user has no trust policy  

**Answer:** C

**Review:**  
A: Group membership is not required if the user has policies attached directly.  
B: IAM users do not require roles.  
C: Correct. By default, new IAM users have no permissions until a policy is attached.  
D: Trust policies are for roles, not users.

---

### Question 7
You want to ensure that no user in your organization can delete a specific S3 bucket, regardless of other permissions. What should you use?

A. Inline IAM policy  
B. SCP with deny statement  
C. Resource-based bucket policy  
D. IAM role with condition block  

**Answer:** B

**Review:**  
A: Inline policies only affect the identity they're attached to.  
B: Correct. An SCP with a deny statement at the organization level overrides all other permissions.  
C: Resource-based policies can be overridden by other permissions.  
D: Condition blocks can help, but are not organization-wide.

---

### Question 8
Which IAM feature helps organizations delegate administrative control without sharing root credentials?

A. IAM access analyzer  
B. IAM policies with admin access  
C. IAM groups  
D. IAM roles with trust relationships  

**Answer:** D

**Review:**  
A: Access analyzer is for policy validation, not delegation.  
B: Policies grant permissions, but roles with trust relationships are the best way to delegate.  
C: Groups help manage permissions, but do not delegate admin control.  
D: Correct. IAM roles with trust relationships allow secure delegation.

---

### Question 9
An EC2 instance profile is:

A. An IAM user with temporary credentials for EC2  
B. A container for IAM policies assigned to Lambda functions  
C. A wrapper for a role that can be attached to an EC2 instance  
D. A group of IAM roles and policies for AWS accounts  

**Answer:** C

**Review:**  
A: Instance profiles use roles, not users.  
B: Lambda uses execution roles, not instance profiles.  
C: Correct. An instance profile is a container for a role that EC2 can assume.  
D: There is no such grouping in IAM.

---

### Question 10
What is the purpose of a trust policy in AWS IAM?

A. It grants access to S3 objects  
B. It specifies who can assume the IAM role  
C. It determines if MFA is required for login  
D. It enforces logging for API activity  

**Answer:** B

**Review:**  
A: Trust policies do not grant access to S3 objects.  
B: Correct. Trust policies define which principals can assume a role.  
C: MFA requirements are set in permissions policies or account settings.  
D: Logging is managed by CloudTrail and other services.

---

## Final Score

You scored: **10/10**

- 9-10: Excellent! You have a strong grasp of AWS IAM concepts.
- 7-8: Good job! Review the explanations for any missed questions.
- 5-6: Fair. Consider revisiting IAM documentation and best practices.
- 0-4: Review the IAM fundamentals and try again.

