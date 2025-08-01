# Event-Driven Services Quiz: EventBridge vs SNS vs SQS

Test your knowledge of AWS event-driven services with these multiple-choice questions based on real-world scenarios.

---

### Instructions
- For each question, select the best answer (A, B, C, or D).
- After completing all questions, check your answers against the provided solutions and reviews.
- Tally your correct answers for a final score.

---

### Question 1
A social media application needs to notify multiple services (e.g., a timeline service, a notification service, and an analytics service) whenever a user posts a new photo. The notification must be sent concurrently to all services. Which service is best suited for this fan-out requirement?

A. SQS FIFO Queue  
B. SNS Topic  
C. SQS Standard Queue  
D. AWS Step Functions

**Answer:** B

**Review:**  
A: SQS is for queuing, not fanning out messages to multiple subscribers.  
B: Correct. SNS is designed for pub/sub and efficiently fanning out messages.  
C: SQS is for queuing, not fanning out messages to multiple subscribers.  
D: Step Functions is for orchestration, not messaging.

---

### Question 2
A financial application processes stock trades and must ensure that trades for a specific stock are processed in the exact order they were received. Which service should be used to guarantee this strict ordering?

A. Amazon EventBridge with a custom event bus  
B. Amazon SQS FIFO Queue  
C. Amazon SNS FIFO Topic  
D. Amazon SQS Standard Queue

**Answer:** B

**Review:**  
A: EventBridge does not guarantee ordering.  
B: Correct. SQS FIFO queues are designed for strict message ordering.  
C: SNS FIFO topics also preserve order, but SQS FIFO is the more direct answer for a queue-based workload.  
D: SQS Standard queues do not guarantee order.

---

### Question 3
An inventory management system receives updates from multiple warehouses. It's critical that every update is processed, but occasional duplicate processing is acceptable and handled by the consumer. The system needs to be highly available and scalable. Which service offers the most appropriate delivery guarantee?

A. SQS Standard Queue (At-Least-Once Delivery)  
B. SQS FIFO Queue (Exactly-Once Processing)  
C. SNS Standard Topic (At-Least-Once Delivery)  
D. Both A and C

**Answer:** D

**Review:**  
A: SQS Standard Queues provide at-least-once delivery.  
B: Exactly-once processing is not required.  
C: SNS Standard Topics also provide at-least-once delivery.  
D: Correct. Both SQS Standard and SNS Standard meet the at-least-once requirement.

---

### Question 4
A large enterprise with many development teams uses a central event bus for communication between microservices. To ensure that event producers and consumers adhere to a common event structure, they need a way to discover, create, and manage schemas for events. Which service provides this capability natively?

A. Amazon SNS  
B. Amazon SQS  
C. Amazon EventBridge  
D. AWS Lambda

**Answer:** C

**Review:**  
A: SNS does not have a schema registry.  
B: SQS does not have a schema registry.  
C: Correct. The EventBridge Schema Registry is designed for this purpose.  
D: Lambda is a compute service, not a schema registry.

---

### Question 5
A service subscribes an SQS queue to an SNS topic. During a deployment issue, the service is down for several hours and cannot process messages from the queue. What is the most critical architectural component to add to prevent message loss in this scenario?

A. An SQS Dead-Letter Queue (DLQ) on the source queue.  
B. An SNS subscription filter policy.  
C. A second SQS queue for redundancy.  
D. Increased message retention period on the SQS queue.

**Answer:** A

**Review:**  
A: Correct. A DLQ will capture messages that fail processing, preventing loss.  
B: A filter policy would not help in this scenario.  
C: A second queue would not solve the processing failure.  
D: While helpful, a DLQ is the more direct and standard solution for handling failed messages.

---

### Question 6
A serverless application has a Lambda function that needs to process messages from a queue. The function should only be invoked when messages are available. To minimize idle time and cost, the application should use a mechanism where the messaging service actively invokes the Lambda function. Which service combination represents a "push" model?

A. SQS queue with a Lambda function configured with a short-polling policy.  
B. SQS queue with a Lambda function that is manually triggered.  
C. SNS topic with a Lambda function as a subscriber.  
D. A Lambda function that periodically polls an SQS queue.

**Answer:** C

**Review:**  
A: This is a pull model.  
B: This is a manual process.  
C: Correct. SNS pushes messages to Lambda subscribers.  
D: This is a pull model.

---

### Question 7
An IoT application publishes sensor data to a central hub. Different downstream services are interested in different types of data (e.g., only temperature readings above a certain threshold, or only humidity data). Which service allows for powerful, content-based filtering of messages so that subscribers only receive the messages they are interested in?

A. SQS with message attributes.  
B. EventBridge with rules that match event patterns.  
C. SNS with subscription filter policies.  
D. Both B and C

**Answer:** B

**Review:**  
A: SQS does not filter messages; the consumer pulls all messages and must inspect them.  
B: Correct. EventBridge rules filter on the event body (content), which is the most powerful and flexible option.  
C: SNS filter policies operate on message attributes, not the message body itself, which is less powerful than EventBridge's content-based filtering.  
D: Because EventBridge's filtering is significantly more powerful and matches the question's wording better, B is the best answer.

---

### Question 8
A company wants to build a system that reacts to changes in its AWS environment. For example, when a new EC2 instance is launched, a notification should be sent to a security team. Which service is the most direct and integrated way to capture these AWS service events and route them accordingly?

A. A custom application polling the AWS API.  
B. Amazon SNS.  
C. Amazon EventBridge, using the default event bus.  
D. Amazon SQS.

**Answer:** C

**Review:**  
A: Polling is inefficient.  
B: While possible, EventBridge is the more direct and intended service for this.  
C: Correct. The EventBridge default event bus automatically receives AWS service events.  
D: SQS is a queue, not an event bus.

---

### Question 9
A monolithic application is being broken down into microservices. The goal is to allow services to communicate asynchronously without having direct knowledge of each other. One service needs to publish an "OrderCreated" event, and multiple other services (billing, shipping, inventory) need to react to it independently. Which service is the best choice to act as the central event router for this many-to-many communication?

A. A shared database table.  
B. A direct HTTP call from the order service to the other services.  
C. Amazon EventBridge.  
D. An SQS queue that all services poll.

**Answer:** C

**Review:**  
A: A database is not a suitable event bus.  
B: Direct calls create tight coupling.  
C: Correct. EventBridge is an ideal event router for decoupled microservices.  
D: An SQS queue is not designed for many-to-many event routing.

---

### Question 10
An application processes a massive volume of clickstream data, generating millions of events per minute. The events need to be delivered to multiple downstream analytics and archival systems with very low latency. The system must be able to scale automatically to handle unpredictable traffic spikes. Which service is designed for this level of massive-scale, low-latency event ingestion and delivery?

A. SQS FIFO Queue  
B. AWS Step Functions  
C. Amazon SNS  
D. EventBridge

**Answer:** C

**Review:**  
A: SQS FIFO queues have strict throughput limits and cannot handle this scale.  
B: Step Functions is an orchestration service, not designed for high-throughput data ingestion.  
C: Correct. SNS Standard Topics are designed for "nearly unlimited" throughput, making them the ideal choice for massive, low-latency event ingestion and fan-out at the scale of millions of events per minute.  
D: While EventBridge is highly scalable, its default quotas are lower than SNS Standard's capacity. For this extreme level of throughput, SNS is the more direct and appropriate architectural choice.

---

## Final Score

You scored: **10/10**

- 9-10: Excellent! You have a strong grasp of AWS event-driven concepts.
- 7-8: Good job! Review the explanations for any missed questions.
- 5-6: Fair. Consider revisiting AWS documentation and best practices for these services.
- 0-4: Review the fundamentals and try again. Consider hands-on labs and official AWS whitepapers.