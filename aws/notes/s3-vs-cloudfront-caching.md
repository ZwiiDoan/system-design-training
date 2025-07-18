# S3 vs CloudFront Caching

## Key Differences
- **Amazon S3** is an object storage service. It does not provide native caching; every request retrieves the latest object directly from the bucket.
- **Amazon CloudFront** is a CDN that caches content at edge locations close to users, reducing latency and offloading requests from S3 or other origins.

## Caching Strategies Summary
- **S3:**
    - No built-in caching for direct access.
    - Use S3 Lifecycle policies for object expiration (TTL), not for caching.
    - For performance, pair S3 with a CDN like CloudFront.
- **CloudFront:**
    - Caches content at edge locations based on TTL and cache-control headers.
    - Supports invalidations to remove cached content before TTL expires.
    - Honors headers like `Cache-Control`, `ETag`, and `Last-Modified` for fine-grained cache control.

## Risks or Gotchas
- **S3 Direct Access:**
    - High latency and cost for repeated requests; no caching.
    - No cache invalidation—always serves the latest object.
- **CloudFront:**
    - Cached content may be stale if TTL is too long or invalidations are missed.
    - Incorrect cache-control headers can lead to unexpected caching behavior (e.g., serving outdated content).
    - Security risk if S3 is not properly restricted—users may bypass CloudFront and access S3 directly.

**Best Practice:** Always use CloudFront (or another CDN) for public/static assets stored in S3, set appropriate cache-control headers, and restrict direct S3 access for security and performance.
