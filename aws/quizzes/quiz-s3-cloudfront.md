# AWS S3 & CloudFront Quiz

Test your knowledge of Amazon S3 and CloudFront caching, security, and optimization strategies with these scenario-based multiple-choice questions.

---

### Instructions
- For each question, select the best answer(s) (A, B, C, D, or E) as indicated.
- After completing all questions, check your answers against the provided solutions and reviews.
- Tally your correct answers for a final score.

---

### Question 1
A financial advisory firm hosts a static website on Amazon S3 behind a CloudFront distribution. After updating a PDF brochure in the S3 bucket, some users still receive the outdated version.
What could be the cause of this behavior?
(Select TWO.)

A. CloudFront has not fetched the updated object due to cache expiration settings.  
B. S3 bucket versioning is disabled.  
C. The S3 object's storage class was changed to Glacier Deep Archive.  
D. CloudFront is configured to ignore origin cache-control headers.  
E. S3 is serving from a different region than CloudFront’s origin region.

**Answer:** A, D

**Review:**
A: CloudFront caches objects based on TTL; if the cache hasn't expired, users may get the old version.
B: S3 versioning helps with object recovery but does not affect CloudFront cache refresh.
C: Glacier Deep Archive objects are not immediately accessible, but this would cause errors, not stale content.
D: If CloudFront ignores origin cache-control headers, it may not update the cache promptly after changes.
E: Region mismatch can cause latency, not outdated content.
**Correct Answers:** A, D

---

### Question 2
A developer wants to ensure that CloudFront always checks with the origin before serving a cached version of a financial report hosted on S3.
Which configuration will help achieve this?
(Select ONE.)

A. Set the S3 bucket policy to public-read.  
B. Use the must-revalidate directive in the object's cache-control metadata.  
C. Enable Transfer Acceleration on the S3 bucket.  
D. Configure S3 event notifications to trigger CloudFront invalidations.

**Answer:** B

**Review:**
A: Public-read does not affect cache validation.
B: The must-revalidate directive forces CloudFront to check with the origin before serving cached content.
C: Transfer Acceleration speeds uploads/downloads, not cache behavior.
D: S3 event notifications do not directly trigger CloudFront cache checks.
**Correct Answer:** B

---

### Question 3
Your team is designing a secure document portal. Documents are stored in an S3 bucket and accessed only via CloudFront using signed URLs.
Which steps should you take to prevent users from bypassing CloudFront and accessing S3 directly?
(Select TWO.)

A. Enable Origin Access Control (OAC) and deny public access to the S3 bucket.  
B. Configure CloudFront to forward query strings and cookies to the origin.  
C. Use Lambda@Edge to rewrite URLs before forwarding to S3.  
D. Create a bucket policy that only allows access from CloudFront's OAC principal.  
E. Enable versioning on the S3 bucket.

**Answer:** A, D

**Review:**
A: OAC restricts direct S3 access, ensuring only CloudFront can serve content.
B: Forwarding query strings/cookies does not prevent direct S3 access.
C: Lambda@Edge can rewrite URLs but does not block direct S3 access.
D: Bucket policy scoped to CloudFront's OAC principal blocks direct access.
E: Versioning is for object recovery, not access control.
**Correct Answers:** A, D

---

### Question 4
You are optimizing a Robo-Advisor frontend hosted on S3 and delivered via CloudFront. Your goal is to reduce latency and S3 data transfer costs.
Which actions will best achieve this goal?
(Select TWO.)

A. Set a long max-age value on frequently accessed static assets.  
B. Enable CloudFront logging and analyze cache hit ratios.  
C. Use multipart uploads to split assets across regions.  
D. Disable cache behaviors for JavaScript files.  
E. Configure CloudFront to compress content automatically.

**Answer:** A, E

**Review:**
A: Long max-age keeps assets cached at edge locations, reducing S3 requests and latency.
B: Logging helps analyze but does not directly reduce latency/costs.
C: Multipart uploads are for large object uploads, not delivery optimization.
D: Disabling cache for JS increases S3 load and latency.
E: Compression reduces transfer size, improving performance and lowering costs.
**Correct Answers:** A, E

---

### Question 5
A team is deploying a static frontend using S3 and CloudFront. After deployment, users report seeing old versions of the application even after a new release.
Which options can help ensure users receive the updated content without explicitly invalidating the cache?
(Select TWO.)

A. Append a version query string to asset URLs during deployment.  
B. Enable static website hosting on the S3 bucket.  
C. Use signed cookies instead of signed URLs.  
D. Configure a low max-age and no-cache on asset metadata.  
E. Enable S3 Transfer Acceleration.

**Answer:** A, D

**Review:**
A: Appending a version query string (or using versioned file names) ensures CloudFront treats each release as a new object, forcing cache refresh.
D: Low max-age and no-cache ensure CloudFront frequently checks for updates, reducing the chance of serving stale content.
B: Static website hosting does not affect cache refresh for CloudFront.
C: Signed cookies are for access control, not cache refresh.
E: Transfer Acceleration is for upload/download speed, not cache refresh.
**Correct Answers:** A, D

---

### Question 6
An architect is designing a secure static file delivery system. The files reside in S3 and are accessed globally via CloudFront. The architecture must support:
- Granular access control
- Logging of access
- Blocking direct S3 access
Which combination satisfies these requirements?
(Select THREE.)

A. Enable CloudFront logging to an S3 bucket.  
B. Attach a bucket policy allowing s3:GetObject to everyone.  
C. Use OAC and deny all public access to the S3 bucket.  
D. Enable CloudTrail data events for the S3 bucket.  
E. Use a CloudFront origin group with S3 as the failover.

**Answer:** A, C, D

---

### Question 7
An update to a client dashboard was made and uploaded to an S3 bucket. However, some end users still see stale content through CloudFront.
What is the MOST efficient method to propagate the changes immediately?
(Select ONE.)

A. Enable versioning on the S3 bucket and update the metadata.  
B. Configure CloudFront to always forward If-Modified-Since headers.  
C. Invalidate the specific file paths in the CloudFront distribution.  
D. Redeploy the CloudFront distribution with new TTL settings.

**Answer:** C

---

### Question 8
You are tasked with optimizing content delivery for a global investment platform. The platform uses CloudFront backed by S3, and some assets (e.g., charts, PDFs) are updated infrequently but are accessed frequently worldwide.
Which strategy provides the best balance of performance and cost-efficiency?
(Select TWO.)

A. Set a high max-age TTL for those assets in CloudFront behaviors.  
B. Enable CloudFront Origin Shield for centralized caching.  
C. Move all assets to Glacier to reduce storage costs.  
D. Use S3 Intelligent-Tiering for automatic cost optimization.  
E. Enable S3 Select to retrieve object subsets efficiently.

**Answer:** A, D

**Review:**
A: High max-age keeps assets cached globally, reducing origin fetches and cost.
B: Origin Shield helps with cache efficiency but may add cost.
C: Glacier is for archival, not frequent access.
D: S3 Intelligent-Tiering automatically moves objects to cost-effective storage tiers.
E: S3 Select is for querying object subsets, not caching.
**Correct Answers:** A, D

---

### Question 9
A junior engineer configures a CloudFront distribution for an S3-hosted web application. After deployment, analytics show a low cache hit ratio.
Which actions should the Solutions Architect take to improve caching efficiency?
(Select TWO.)

A. Ensure that cacheable assets (JS, CSS, images) use long TTLs and are versioned via file names.  
B. Set CloudFront to forward all headers, cookies, and query strings.  
C. Use S3 pre-signed URLs for all static content.  
D. Review and minimize dynamic query string use in frontend requests.  
E. Disable CloudFront field-level encryption.

**Answer:** A, D

**Review:**
A: Long TTLs and versioned file names improve cache hit ratios and ensure users get updated assets.
B: Forwarding all headers, cookies, and query strings reduces cache efficiency by fragmenting the cache.
C: Pre-signed URLs are for access control, not cache efficiency.
D: Minimizing dynamic query strings increases cache efficiency, as CloudFront treats each unique query string as a separate cache entry.
E: Field-level encryption is for security, not caching.
**Correct Answers:** A, D

---

### Question 10
A financial news portal uses S3 to store HTML articles and CloudFront for global delivery. The editorial team frequently updates article content, but users still receive old versions even after refresh.
The architecture must maintain performance while ensuring fresh content delivery.
Which approach best meets these goals with minimal operational overhead?
(Select TWO.)

A. Enable CloudFront cache invalidation after each article update.  
B. Use object versioning in S3 and serve versioned URLs in the frontend.  
C. Set Cache-Control: no-store on all article objects.  
D. Use a Lambda@Edge function to bypass the cache based on a custom header.  
E. Configure shorter TTLs in CloudFront behaviors for HTML content only.

**Answer:** A, E

**Review:**
A: Cache invalidation ensures CloudFront fetches the latest content after updates.
B: Versioned URLs help, but require frontend changes and may add complexity.
C: no-store disables caching, hurting performance.
D: Lambda@Edge can bypass cache, but adds operational overhead.
E: Shorter TTLs for HTML content ensure frequent cache refreshes for updated articles.
**Correct Answers:** A, E

---

## Final Score

You scored: **10/10**

- 9-10: Excellent! You have a strong grasp of S3 and CloudFront caching and delivery concepts.
- 7-8: Good job! Review the explanations for any missed questions.
- 4-6: Fair. Consider revisiting AWS documentation and best practices for S3 and CloudFront.
- 0-3: Review the fundamentals and try again. Consider hands-on labs and official AWS whitepapers.
