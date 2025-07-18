# Amazon S3 Overview

## Table of Contents
- [What is Amazon S3?](#what-is-amazon-s3)
- [When to Use Amazon S3](#when-to-use-amazon-s3)
- [S3 Storage Classes Overview](#s3-storage-classes-overview)
- [When to Use Each Class](#when-to-use-each-class)
- [Key Concepts](#key-concepts)
- [Further Reading](#further-reading)

---

## What is Amazon S3?

Amazon Simple Storage Service (S3) is a scalable, high-speed, low-cost object storage service designed for online backup and archiving of data and applications on Amazon Web Services (AWS). S3 is designed for 99.999999999% (11 nines) of durability, providing a highly reliable storage infrastructure.

Data is stored as objects within resources called "buckets," and an object is identified by a unique, user-assigned key.

---

## When to Use Amazon S3

| Use Case | Description |
|---|---|
| **Backup and Archiving** | Durable, low-cost storage for critical data backups and long-term archives. |
| **Content Hosting & Distribution** | Host static websites and distribute static content like images, videos, and documents globally with low latency when combined with Amazon CloudFront. |
| **Data Lakes & Big Data Analytics** | Store large amounts of structured and unstructured data in its native format. Integrates with AWS analytics services to run big data analytics. |
| **Disaster Recovery** | Replicate data across AWS regions to ensure business continuity in case of a regional outage. |
| **Cloud-Native Applications** | Primary data store for user-generated content, logs, and other application data. |
| **Software Distribution** | Reliably distribute software and application updates to users at scale. |

---

## S3 Storage Classes Overview

| Storage Class | Use Case | Access Pattern | Retrieval Time |
|---|---|---|---|
| **S3 Standard** | Frequently accessed data | Active | Milliseconds |
| **S3 Intelligent-Tiering** | Data with unknown or changing access patterns | Automatic | Milliseconds |
| **S3 Glacier Instant Retrieval** | Long-term archival with immediate access needs | Infrequent | Milliseconds |
| **S3 Glacier Flexible Retrieval** | Long-term archival, retrieval in minutes or hours | Archival | Minutes to Hours |
| **S3 Glacier Deep Archive** | Lowest-cost storage for long-term retention | Archival | Hours |

---

## When to Use Each Class

### S3 Standard
- **Best for:** General-purpose storage of frequently accessed data.
- **Examples:** Websites, content distribution, mobile and gaming applications, and big data analytics.

### S3 Intelligent-Tiering
- **Best for:** Data with unknown, changing, or unpredictable access patterns.
- **How it works:** Automatically moves data to the most cost-effective access tier based on usage patterns, without performance impact or operational overhead.

### S3 Glacier (Instant, Flexible, Deep Archive)
- **Best for:** Long-term data archiving at the lowest costs.
- **Key Trade-off:** As storage cost decreases, retrieval time increases.
    - **Instant Retrieval:** For archives that need immediate, millisecond access.
    - **Flexible Retrieval:** For archives where a retrieval time of minutes to hours is acceptable.
    - **Deep Archive:** For long-term data that is rarely accessed and can tolerate retrieval times of 12 hours or more.

---

## Key Concepts

| Term | Definition |
|---|---|
| **Storage Class** | A category of storage in Amazon S3 that is designed for a specific data access pattern and cost model. |
| **Access Tier** | Within S3 Intelligent-Tiering, refers to the different tiers (Frequent Access, Infrequent Access, Archive Access) that data is automatically moved between. |
| **Retrieval** | The process of accessing data from a storage class. For Glacier classes, this may involve a "restore" operation before the data is accessible. |

## Object Versioning and Expiration (TTL)

### Object Versioning
- **Purpose:** Protects against accidental deletion or overwrites by keeping multiple versions of an object in a bucket.
- **How it works:** When versioning is enabled, every update or delete creates a new version. You can restore previous versions or permanently delete specific ones.
- **Use cases:** Data protection, audit trails, recovery from accidental changes.
- **Considerations:** Versioning increases storage costs since all versions are retained until deleted.

### Expiration Rules (Time-to-Live, TTL)
- **Purpose:** Automatically delete objects after a specified period to manage storage lifecycle and costs.
- **How it works:** S3 Lifecycle policies can be set to expire objects based on age, version, or other criteria.
- **Use cases:** Temporary files, compliance with data retention policies, cost management.
- **Example:** Automatically delete logs older than 30 days or previous versions after 7 days.


## S3 Access Patterns: No Native Caching

- **Direct Access:** Clients (browsers, apps, services) access objects directly from S3 buckets via HTTPS endpoints.
- **No Native Caching:** S3 does not provide built-in caching. Every request fetches the latest object from the bucket.
- **Implications:**
    - For static content, use Amazon CloudFront or another CDN to cache and accelerate delivery globally.
    - Without a CDN, repeated requests for the same object always go to S3, which may increase latency and cost.
- **Best Practice:** Always use a CDN for public/static assets to improve performance and reduce S3 request costs.
---

## Real-World Use Case: Financial Dashboard Frontend

When designing a financial dashboard, the choice of S3 storage class depends entirely on the data's access patterns and performance requirements. Here’s a breakdown of the trade-offs:

| Storage Class | Use Case in Dashboard | Trade-Offs |
|---|---|---|
| **S3 Standard** | **Hosting the frontend application files** (HTML, CSS, JavaScript, images). | **Pro:** Highest performance, low latency, ideal for frequently accessed assets that need to load quickly for a good user experience.<br>**Con:** Highest storage cost. |
| **S3 Standard-IA** | Storing **monthly or quarterly financial reports** that are accessible from the dashboard but not loaded on every page view. | **Pro:** Lower storage cost than Standard, suitable for data that is not accessed every day.<br>**Con:** Retrieval fees apply. If users start accessing these reports frequently, the costs could exceed S3 Standard. |
| **S3 Glacier (Flexible or Deep Archive)** | **Archiving historical financial data** for compliance or long-term analysis (e.g., raw transaction data older than 7 years). | **Pro:** Extremely low storage cost.<br>**Con:** Not suitable for direct use in the dashboard. Data must be restored before it can be accessed, which can take minutes to hours. This makes it inappropriate for any data that a user would expect to see immediately. |

**Conclusion:**

-   For the **live, interactive part of the dashboard**, **S3 Standard** is the only appropriate choice to ensure a responsive user experience.
-   For **less-frequently accessed, on-demand resources** like downloadable reports, **S3 Standard-IA** offers a good balance between cost and accessibility.
-   **S3 Glacier** should only be used for **offline, long-term archival** of data that does not need to be available to the dashboard in real-time.

---

## Further Reading

- [Amazon S3 Storage Classes - Official Documentation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html)
