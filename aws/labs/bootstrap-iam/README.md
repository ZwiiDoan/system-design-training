# AWS Bootstrap IAM Admin User

**&#9888;&#65039; WARNING: This project is for one-time use only. Do not use it for regular user management.**

## 1. Purpose

This Terraform project bootstraps a new AWS account by creating a dedicated IAM administrator user. It is designed to be run **once** using your AWS root account credentials.

The primary goal is to establish a secure administrative user for daily operations, allowing you to stop using the root account, which is an AWS security best practice.

## 2. What It Does

-   Creates an IAM user with full `AdministratorAccess`.
-   Generates an access key and secret access key for this user.
-   Stores the new user's credentials securely in **AWS Secrets Manager** instead of displaying them on the console or storing them in the Terraform state.

## 3. Prerequisites

-   **AWS Account:** You must have an AWS account.
-   **Root User Access:** You need to run this with your AWS root user credentials configured for the AWS CLI or environment variables.
-   **Terraform:** Terraform must be installed on your local machine.

## 4. Usage

Follow these steps to bootstrap your account:

1.  **Navigate to the project directory:**
    ```sh
    cd aws/labs/bootstrap-iam
    ```

2.  **Customize Variables (Optional):**
    You can change the default `user_name` (`bootstrap-admin`) and `aws_region`. Create a `terraform.tfvars` file:
    ```hcl
    user_name = "my-admin-user"
    aws_region = "us-east-1"
    ```
    Alternatively, use command-line flags.

3.  **Initialize Terraform:**
    This command downloads the necessary provider plugins.
    ```sh
    terraform init
    ```

4.  **Plan and Apply:**
    Review the plan to see what resources will be created, then apply the changes.
    ```sh
    terraform plan
    terraform apply
    ```

## 5. Post-Execution: Accessing Your Credentials

After the `apply` command completes successfully:

1.  Log in to the AWS Management Console **as the root user**.
2.  Navigate to **AWS Secrets Manager**.
3.  Find the secret named **`<user_name>-credentials`** (e.g., `bootstrap-admin-credentials`).
4.  Retrieve the secret value to get the `access_key_id` and `secret_access_key`.

**Use these new credentials to configure your AWS CLI profile. From this point forward, use this IAM user for all your AWS activities.**

## 6. Security Warning

-   **Do not** commit the `.tfstate` file or any `.tfvars` files containing sensitive information to version control. This project is designed to avoid exposing secrets, but best practices should always be followed.
-   **Immediately stop using the root account** for any operational tasks after this user is created.
