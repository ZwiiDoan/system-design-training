# Robo-Advisor Static Frontend Infra (Terraform)

This Terraform project provisions:
- An S3 bucket for static site hosting (private, with website config)
- Origin Access Control (OAC) for secure CloudFront-to-S3 access
- A CloudFront distribution to serve the static frontend globally

## Usage

1. **Set variables:**
   - `bucket_name`: Unique S3 bucket name (e.g., `robo-advisor-frontend-<your-unique-suffix>`)
   - Optionally override `aws_region` and `tags`

2. **Initialize and apply:**
   ```powershell
   terraform init
   terraform apply -auto-approve -var "bucket_name=robo-advisor-frontend-<your-unique-suffix>"
   ```

3. **Upload your static site:**
   - Build your frontend (`npm run build` in the frontend folder)
   - Upload the contents of `dist/` to the S3 bucket:
     ```powershell
     aws s3 sync ../frontend/dist s3://<your-bucket-name>
     ```

4. **Access your site:**
   - Use the CloudFront domain output (not the S3 website URL)

## Security
- S3 bucket is private; only CloudFront (via OAC) can access it
- Public access is only via CloudFront

---
*Part of the AWS Foundations Month 1 deliverables for the Robo-Advisor project.*
