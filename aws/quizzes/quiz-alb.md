# AWS Load Balancer Quiz – ALB & NLB

Test your knowledge of AWS Application Load Balancer (ALB) and Network Load Balancer (NLB) concepts with these multiple-choice questions based on real-world scenarios.

---

### Instructions
- For each question, select the best answer (A, B, C, or D).
- After completing all questions, check your answers against the provided solutions and reviews.
- Tally your correct answers for a final score.

---

### Question 1
Which load balancer supports HTTP/3 end-to-end today?

A. ALB  
B. NLB  
C. Both  
D. Neither

**Answer:** D

**Review:**  
A: ALB does not yet support HTTP/3 end-to-end.  
B: NLB does not support HTTP/3.  
C: Neither supports HTTP/3 end-to-end as of now.  
D: Correct. Neither ALB nor NLB supports HTTP/3 end-to-end today.

---

### Question 2
You must keep the source IP visible to backend services for audit. Which LB?

A. ALB only  
B. NLB only  
C. Both  
D. Neither

**Answer:** B

**Review:**  
A: ALB does not preserve the client source IP by default.  
B: Correct. NLB preserves the client source IP for targets.  
C: Only NLB does this natively.  
D: At least one LB does preserve source IP.

---

### Question 3
Requirement: terminate TLS and route by Server Name Indication (SNI) at L4. Choose:

A. ALB  
B. NLB  
C. Classic LB  
D. Gateway LB

**Answer:** B

**Review:**  
A: ALB terminates TLS and routes by SNI, but at L7.  
B: Correct. NLB can terminate TLS and route by SNI at L4.  
C: Classic LB does not support SNI at L4.  
D: Gateway LB does not support this use case.

---

### Question 4
Which metric contributes to both ALB and NLB Load Balancer Capacity Units?

A. Active connections  
B. New connections/sec  
C. Processed bytes  
D. Rule evaluations

**Answer:** C

**Review:**  
A: Only NLB uses active connections for capacity.  
B: Only NLB uses new connections/sec for capacity.  
C: Correct. Processed bytes are counted for both ALB and NLB capacity units.  
D: Rule evaluations are only for ALB.

---

### Question 5
Need 1 M req/s with sub-10 ms latency spanned across two static EIPs. Pick _____ .

**Answer:** NLB

**Review:**  
NLB is designed for extreme performance and can be assigned static EIPs, making it suitable for this scenario.

---

### Question 6
For WebSocket chat, sticky sessions are undesirable. Which LB & feature combo avoids stickiness?

A. ALB with duration-cookie off  
B. NLB  
C. ALB with application-cookie  
D. Either A or B

**Answer:** D

**Review:**  
A: Disabling duration-based stickiness on ALB avoids sticky sessions.  
B: NLB does not support stickiness.  
C: Application-cookie stickiness would enable stickiness.  
D: Correct. Either A or B avoids stickiness.

---

### Question 7
Which type can directly integrate with AWS WAF?

A. ALB  
B. NLB  
C. Both  
D. Neither

**Answer:** A

**Review:**  
A: Correct. Only ALB can directly integrate with AWS WAF.  
B: NLB cannot integrate with WAF.  
C: Only ALB supports this.  
D: At least one LB does support WAF.

---

### Question 8
You’ve deployed on Outposts and want minimum 200 LCUs locked in for a flash sale. Supported on?

A. ALB only  
B. NLB only  
C. Both  
D. Neither

**Answer:** C

**Review:**  
A: ALB supports LCU reservation on Outposts.  
B: NLB supports LCU reservation on Outposts.  
C: Correct. Both support this feature.  
D: Both support it, so this is incorrect.

---

### Question 9
Which LB now lets you disable an Availability Zone without deletion?

A. ALB  
B. NLB  
C. Both  
D. Classic LB

**Answer:** C

**Review:**  
A: ALB supports disabling AZs.  
B: NLB supports disabling AZs.  
C: Correct. Both now support disabling AZs without deletion.  
D: Classic LB does not support this.

---

### Question 10
True/False: ALB path-based routing supports gRPC streams.

**Answer:** True

**Review:**  
True. ALB supports HTTP/2 and gRPC, including path-based routing for gRPC streams.

---

## Final Score

You scored: **10/10**

- 9-10: Excellent! You have a strong grasp of AWS Load Balancer concepts.
- 7-8: Good job! Review the explanations for any missed questions.
- 5-6: Fair. Consider revisiting AWS documentation and best practices for ALB and NLB.
- 0-4: Review the fundamentals and try again. Consider hands-on labs and official AWS whitepapers.
