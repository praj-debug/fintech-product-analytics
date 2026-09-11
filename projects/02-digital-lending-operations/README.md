# Project 2: Digital Lending Operations Optimization

## Project Overview

This project focuses on improving operational efficiency in a digital lending journey by identifying bottlenecks, turnaround-time issues, drop-offs, and opportunities for process automation.

The analysis uses a synthetic lending dataset designed to simulate a real-world digital lending operation.

---

## Objective

Identify operational bottlenecks across the lending journey and recommend product and process improvements that can reduce turnaround time, improve conversion, and create a better customer experience.

---

## Business Problem

Digital lending journeys often involve multiple stages:

1. Lead generation
2. Application
3. Document collection
4. Verification
5. Credit assessment
6. Sanction
7. Disbursement

Delays or drop-offs at any stage can negatively impact customer experience and business performance.

The goal of this project is to identify where these problems occur and determine which improvements should be prioritized.

---

## Key Business Questions

- Which stage has the highest customer drop-off?
- Which stage has the longest turnaround time?
- What percentage of applications reach sanction?
- What percentage of sanctioned applications are disbursed?
- Which customer segments experience higher delays?
- Which operational bottlenecks can be automated?
- Where should product teams prioritize improvements?

---

## Key Metrics

| Metric | Definition |
|---|---|
| Application Conversion | Applications progressing successfully through the journey |
| Approval Rate | Approved applications / total applications |
| Disbursement Rate | Disbursed applications / total applications |
| Turnaround Time | Time taken between important process stages |
| Drop-off Rate | Applications lost at a particular stage |
| Processing Time | Time taken by operations to process an application |

---

## Analysis Approach

### 1. Funnel Analysis

Analyze the movement of applications through each stage.

### 2. Turnaround Time Analysis

Measure the time taken between:

- Application → Verification
- Verification → Credit Decision
- Credit Decision → Sanction
- Sanction → Disbursement

### 3. Segment Analysis

Compare operational performance across:

- Customer segment
- Partner
- Loan amount
- Application source
- Geography

### 4. Bottleneck Identification

Identify stages where:

- Processing time is high
- Drop-off is high
- Manual intervention is high
- Customer experience may be negatively affected

---

## Product Recommendations

### Recommendation 1: Document Collection Automation

Introduce automated document reminders and real-time document validation.

**Expected impact:**

- Lower operational workload
- Faster verification
- Reduced customer drop-off

---

### Recommendation 2: SLA Monitoring

Create an operations dashboard that highlights applications approaching or exceeding SLA limits.

**Expected impact:**

- Faster intervention
- Better turnaround time
- Improved SLA adherence

---

### Recommendation 3: Application Status Visibility

Provide customers with clear real-time application status updates.

Example:

```text
Application Submitted
        ↓
Documents Under Review
        ↓
Credit Assessment
        ↓
Sanctioned
        ↓
Ready for Disbursement
