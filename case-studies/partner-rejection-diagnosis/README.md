# Diagnosing High Rejections at Partner Stage

### Improving Approval Accuracy and Partner Conversion in a Digital Lending Marketplace

**Author:** Prajakta Mane  
**Case study type:** Product / Growth / Lending Operations  
**Focus:** Funnel diagnosis, underwriting alignment, partner conversion, and data-led experimentation

> **Note:** This is a portfolio case study based on a lending marketplace scenario. The funnel volumes and expected impact figures are scenario assumptions, not production claims.

---

## 1. Problem

The marketplace showed strong early engagement, but a significant portion of users were lost between application completion, platform approval-in-principle (AIP), and partner underwriting.

### Funnel snapshot

| Funnel stage | Users | Conversion from previous stage |
|---|---:|---:|
| Leads | 10,00,000 | — |
| Completed applications | 5,00,000 | 50% |
| AIP users | 1,00,000 | 20% |
| Pushed to partners | 50,000 | 50% |

The key product problem was not simply low conversion. It was **approval accuracy**: users passing the platform's AIP logic were subsequently rejected by lending partners.

### Business hypothesis

High partner-stage rejection indicates a potential mismatch between:

1. Platform eligibility rules
2. Customer-declared data and verified data
3. Self-service journey quality
4. Partner underwriting appetite
5. Lead and sourcing quality

A 10% reduction in partner rejection was estimated in the scenario to improve PSA by approximately 5–7%, without increasing acquisition spend.

---

## 2. Diagnosis Framework

I would investigate the problem across four dimensions rather than immediately changing the AIP rules.

### A. Eligibility & data mismatch

- Declared income versus bureau-based income indicators
- Employer verification gaps or incorrect employment classification
- PAN / KYC inconsistencies
- FOIR and requested-ticket mismatches

### B. Risk & policy misalignment

- AIP thresholds broader than individual partner credit appetite
- Thin-bureau / New-to-Credit users passing early filters
- Partner-specific risk policies not reflected in routing

### C. User journey quality

- Mandate failures
- Incomplete documentation
- Errors during partner redirection
- Missing validation checkpoints in DIY journeys

### D. Sourcing & intent quality

- DSA-wise rejection patterns
- Duplicate or recycled applications
- Channel-level lead quality differences
- Incentives optimised for lead volume rather than downstream disbursal quality

---

## 3. Hypotheses to Validate

| Hypothesis | Data required | Validation signal |
|---|---|---|
| AIP logic is too broad for some partners | Partner rejection codes + bureau bands + employment type | Rejection concentration among cohorts that pass AIP |
| Declared customer data is unreliable | Declared income + bureau indicators + employer verification | High income variance among rejected users |
| DIY journey creates avoidable failures | DIY vs assisted journey + document completion | Higher rejection / incomplete-document rate in DIY |
| Some sourcing channels create lower-quality applications | DSA + source + duplicate rate + rejection outcome | Higher rejection correlation by source / DSA |

The principle is **validate before changing policy**. A rejection pattern should be supported by measurable evidence before introducing new eligibility rules.

---

## 4. Product Analytics Approach

### Step 1: Build a rejection MIS

Create a partner-level dataset containing:

- Application ID
- Partner
- AIP status
- Partner decision
- Rejection reason code
- Bureau score band
- Employment classification
- Declared income
- Bureau income indicator
- Journey type
- Lead source / DSA
- Duplicate indicator
- Requested ticket size

### Step 2: Segment the funnel

Compare conversion and rejection across:

- Partner
- Bureau score band
- Employment type
- Income band
- Journey type
- Acquisition source
- DSA

### Step 3: Identify concentrated failure points

Look for rejection clusters rather than relying on the overall rejection rate. For example:

> Partner A may have an average rejection rate that looks acceptable, while a specific employment + bureau-score cohort could account for a disproportionate share of its rejected applications.

### Step 4: Validate with stakeholders

Use the identified rejection clusters in calibration discussions with Risk, Product, Operations, and lending partners to distinguish:

**true policy mismatch** vs **data quality issue** vs **journey friction** vs **poor sourcing**.

---

## 5. Corrective Actions

### Short term: 0–30 days

- Introduce pre-push validation for income consistency.
- Add duplicate detection before partner submission.
- Route borderline users to assisted journeys where documentation support is valuable.
- Suppress repeat / low-intent cohorts identified through rejection analysis.
- Pull partner-wise rejection MIS and identify top rejection clusters.
- Establish a weekly Product + Risk + Partner review cadence.

### Medium term: 30–90 days

- Implement partner-specific BRE routing aligned with underwriting appetite.
- Move from a single AIP threshold toward bureau-based segmentation.
- Develop employer whitelisting / geo-risk suppression logic where supported by evidence.
- Launch partner performance scorecards covering PSA, login-to-disbursal, and rejection reasons.
- Conduct recurring underwriting calibration workshops with partners.

---

## 6. Success Metrics

The goal is not simply to increase AIP approvals. It is to increase the proportion of **accurate approvals that convert downstream**.

### Primary metrics

- Partner rejection rate
- PSA / partner submission-to-approval conversion
- Login-to-disbursal conversion
- Cost per disbursal

### Quality metrics

- DSA-wise quality score
- Duplicate application rate
- Income discrepancy rate
- DIY documentation completion rate
- Partner rejection reason concentration

### Operating metric

- Weekly partner underwriting feedback-loop adoption

---

## 7. Product Principle

### Precision over volume

| Lever | Principle |
|---|---|
| Sourcing quality | Genuine intent over volume-driven acquisition |
| Eligibility logic | Smart filtering over broad thresholds |
| Partner routing | Underwriting alignment over generic routing |

The objective is not to increase approvals blindly. It is to improve **approval accuracy** by aligning sourcing quality, eligibility logic, customer journey quality, and partner underwriting expectations.

---

## 8. Expected Scenario Outcome

The case study scenario targets:

- **10–15% reduction** in partner rejection rates
- Improved PSA through better eligibility precision
- Higher disbursal conversion without increasing sourcing spend
- Lower CAC leakage caused by partner-stage rejection and repeated sourcing cycles
- Better partner capacity utilisation and reduced underwriting rework

These are **target outcomes for the scenario**, not measured production results.

---

## What this demonstrates

This case study demonstrates a product-operations approach to a lending funnel problem:

**Funnel diagnosis → segmentation → hypothesis → data validation → cross-functional calibration → product intervention → measurement**

It combines product analytics, lending-domain understanding, partner management, and operational execution rather than treating conversion as a single top-line metric.
