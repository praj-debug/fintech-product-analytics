# Diagnosing High Rejections at Partner Stage

### Improving Approval Accuracy and Partner Conversion in a Digital Lending Marketplace

**Author:** Prajakta Mane  
**Case study type:** Product / Growth / Lending Operations  
**Focus:** Funnel diagnosis, underwriting alignment, partner conversion, and data-led experimentation

> **Note:** This is a portfolio case study based on a lending marketplace scenario. The funnel volumes and expected impact figures are scenario assumptions, not production claims.

## Interactive Dashboard

**[Open the interactive Partner Rejection Analysis Dashboard](./index.html)**

The dashboard provides a visual product-analytics view of the funnel, partner rejection patterns, journey comparison, and sourcing quality. The figures shown are scenario data aligned to this case study, not production results.

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

### Refined problem framing

Feedback from a lending-product stakeholder highlighted an important refinement to the original diagnosis: partner-stage rejection was primarily driven by applicants not clearing the partner's **proprietary internal credit scorecard**, rather than being primarily caused by incorrect data declaration or duplicate applications.

These partner scorecards can combine bureau data, demographics, behavioural signals, risk indicators, and other enriched data points, and can be continuously recalibrated based on portfolio performance and changing risk appetite. Because these proprietary underwriting models were not directly exposed to the platform, the platform AIP was based largely on declared customer information and a soft bureau assessment. This creates a structural gap between **platform-level AIP** and the **partner's final underwriting decision**.

The resulting product question is therefore not simply "How do we eliminate partner rejection?" but:

> **How do we improve the precision of platform AIP and partner routing while recognising the limits of what the platform can observe about proprietary partner underwriting?**

### Business hypothesis

High partner-stage rejection can reflect a combination of:

1. **Partner scorecard mismatch** between platform-level AIP and proprietary partner underwriting
2. Customer-declared data and verified data differences
3. Self-service journey quality
4. Partner-specific underwriting appetite and policy differences
5. Lead and sourcing quality

The analysis should first establish how much rejection is structurally linked to partner underwriting versus addressable through platform-level interventions.

---

## 2. Diagnosis Framework

I would investigate the problem across four dimensions, with proprietary partner underwriting treated as the primary root-cause area.

### A. Partner scorecard & underwriting alignment

- Applicants passing platform AIP but failing the partner's proprietary scorecard
- Differences between platform-visible signals and partner-only/enriched risk signals
- Bureau, demographic, behavioural and other risk signals contributing to partner decisions
- Changes in partner risk appetite and scorecard calibration over time
- Partner-specific approval profiles that are not observable in the platform AIP

### B. Eligibility & data quality

- Declared income versus bureau-based income indicators
- Employer verification gaps or incorrect employment classification
- PAN / KYC inconsistencies
- FOIR and requested-ticket mismatches

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

These secondary dimensions remain valid areas to test, but they should not be treated as the default root cause without evidence.

---

## 3. Hypotheses to Validate

| Hypothesis | Data required | Validation signal |
|---|---|---|
| Partner proprietary scorecard is the largest driver of rejection | Partner decision outcomes + rejection reason / scorecard bands where available + bureau and cohort attributes | High rejection among AIP users despite clean platform-visible inputs, concentrated by partner/cohort |
| AIP logic is broader than some partners' underwriting appetite | Partner approval/rejection cohorts + bureau bands + employment type + partner-level outcomes | Rejection concentrated among specific cohorts that consistently pass AIP |
| Declared customer data contributes to a smaller, addressable share of rejection | Declared income + bureau indicators + employer verification | Rejection concentration among high-variance data cohorts |
| DIY journey creates avoidable failures | DIY vs assisted journey + document completion + process failure events | Higher rejection / incomplete-document rate linked to journey friction |
| Some sourcing channels create lower-quality applications | DSA + source + duplicate rate + rejection outcome | Higher rejection correlation by source / DSA after controlling for relevant cohorts |

The principle is **validate before changing policy**. In particular, avoid assuming that every partner rejection is addressable through broader AIP rules when the final scorecard is proprietary and not directly observable.

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
- Available partner score / score band, where the partner can expose it
- Scorecard or policy version, where available

### Step 2: Segment the funnel

Compare conversion and rejection across:

- Partner
- Bureau score band
- Employment type
- Income band
- Journey type
- Acquisition source
- DSA
- Available scorecard / policy version information

### Step 3: Separate structural vs addressable rejection

Use available partner feedback to classify rejection into:

**Structural / low-observability rejection** → driven by proprietary scorecard signals not visible to the platform  
**Addressable rejection** → linked to data quality, journey friction, routing, sourcing quality, or other factors the platform can influence

This distinction prevents the product team from treating a partner's final underwriting decision as if it were fully reproducible from the platform's AIP inputs.

### Step 4: Identify concentrated failure points

Look for rejection clusters rather than relying on the overall rejection rate. For example:

> Partner A may have an average rejection rate that looks acceptable, while a specific bureau-score + employment cohort could account for a disproportionate share of rejected AIP users.

### Step 5: Validate with stakeholders

Use the identified rejection clusters in calibration discussions with Risk, Product, Operations, and lending partners to distinguish:

**proprietary scorecard failure** vs **true policy mismatch** vs **data quality issue** vs **journey friction** vs **poor sourcing**.

---

## 5. Corrective Actions

### Short term: 0–30 days

- Pull partner-wise rejection MIS and identify the largest scorecard/cohort-driven rejection clusters.
- Request structured partner feedback on rejection reason groups and available score bands / policy versions.
- Introduce pre-push validation for addressable data-quality issues such as income consistency.
- Add duplicate detection before partner submission.
- Route borderline users to assisted journeys where documentation support is valuable.
- Establish a weekly Product + Risk + Partner review cadence.

### Medium term: 30–90 days

- Implement partner-specific BRE routing where sufficient partner feedback is available.
- Move from a single AIP threshold toward bureau/cohort-based segmentation where evidence supports it.
- Build partner scorecards that compare platform-visible characteristics with downstream approval outcomes.
- Develop employer whitelisting / geo-risk suppression logic only where supported by evidence.
- Conduct recurring underwriting calibration workshops with partners.
- Where partners permit it, incorporate additional observable risk/enriched signals into pre-screening.

The objective is not to recreate a partner's proprietary scorecard, which may not be possible. It is to improve **AIP precision and routing quality using signals the platform can legitimately observe and learn from**.

---

## 6. Success Metrics

The goal is not simply to increase AIP approvals. It is to increase the proportion of **accurate approvals that convert downstream**.

### Primary metrics

- Partner rejection rate
- PSA / partner submission-to-approval conversion
- Login-to-disbursal conversion
- Cost per disbursal

### Quality metrics

- Partner-level approval precision among AIP users
- DSA-wise quality score
- Duplicate application rate
- Income discrepancy rate
- DIY documentation completion rate
- Partner rejection reason / scorecard-band concentration

### Operating metric

- Weekly partner underwriting feedback-loop adoption

---

## 7. Product Principle

### Precision over volume

| Lever | Principle |
|---|---|
| AIP logic | Maximise approval precision using observable signals, without pretending proprietary underwriting is fully visible |
| Partner routing | Underwriting alignment over generic routing |
| Sourcing quality | Genuine intent over volume-driven acquisition |
| Experimentation | Improve addressable rejection while measuring the structurally unavoidable approval gap |

The objective is not to increase approvals blindly. It is to improve **approval accuracy** by aligning platform-visible eligibility signals, customer journey quality, sourcing quality, and partner underwriting expectations.

---

## 8. Expected Scenario Outcome

The case study scenario targets:

- **10–15% reduction** in addressable partner rejection through better platform precision and routing
- Improved PSA through better eligibility precision
- Higher disbursal conversion without increasing sourcing spend
- Lower CAC leakage caused by avoidable partner-stage rejection and repeated sourcing cycles
- Better partner capacity utilisation and reduced operational rework

These are **target outcomes for the scenario**, not measured production results. Structural rejection driven by proprietary partner scorecards should not be assumed to be fully eliminable.

---

## 9. Expert Feedback & Iteration

Feedback from a lending-product stakeholder who reviewed the case study highlighted that the largest contributor to partner-stage rejection was typically applicants not clearing the partner's internal credit scorecard. The feedback also clarified that proprietary scorecards may combine bureau, demographic, behavioural, risk, and enriched signals and are continuously recalibrated based on portfolio performance and risk appetite.

This feedback refined the case study from an initial emphasis on data declaration and duplicate applications toward **AIP-to-partner underwriting alignment and the limits of platform observability**.

The key learning is that a strong product analysis should not only ask, "What can we change?" It should also ask, **"What can we actually observe, infer, and control?"**

---

## What this demonstrates

This case study demonstrates a product-operations approach to a lending funnel problem:

**Funnel diagnosis → segmentation → hypothesis → data validation → underwriting calibration → product intervention → measurement**

It combines product analytics, lending-domain understanding, partner management, and operational execution while explicitly recognising the boundary between platform-level decisioning and proprietary partner underwriting.
