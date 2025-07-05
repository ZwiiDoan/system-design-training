# AWS Organizations & IAM Org Setup Summary

## Components Created
- **AWS Organization** with Service Control Policies (SCPs) enabled
- **Organizational Units (OUs):**
  - `dev`
  - `test`
- **Service Control Policy (SCP):**
  - Denies S3 public access (attached to both OUs)
- **Example cross-account IAM trust policy** (for reference)

## Challenges Encountered
- **SCP Propagation Delay:**
  - After enabling SCPs, there was a delay before policies could be attached to OUs. This is a common AWS Organizations behavior and can cause Terraform to fail with `PolicyTypeNotEnabledException` if retried too quickly.
- **Root vs Member Account Roles:**
  - Some operations (like creating the organization) must be performed from the management/root account, not a member account. Using the correct IAM user/profile is essential.
- **Terraform Provider Changes:**
  - The method for enabling SCPs has changed over time. The current best practice is to use `enabled_policy_types` in the `aws_organizations_organization` resource.

## Recommendation: Org-wide Policies in Startups/Scaleups
- **Pros:**
  - Centralized governance and security controls
  - Prevents accidental exposure (e.g., S3 public access)
  - Scales well as the organization grows
- **Cons:**
  - Adds complexity and can slow down development if not managed carefully
  - Propagation delays and policy misconfigurations can cause confusion
- **Summary:**
  - For startups/scaleups, org-wide policies are recommended once you have multiple accounts or teams, but start simple. Use a minimal set of guardrails (like blocking public S3) and add more controls as you mature. Always test changes in a sandbox first.
