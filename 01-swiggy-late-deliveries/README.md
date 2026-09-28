# Reducing Late-Delivery Friction: A Product Teardown of Swiggy

**Type:** Independent product teardown  
**Focus:** PRD, metrics, experimentation, UX  
**Status:** Concept case study

> This is an independent portfolio exercise based on publicly observable product behavior. It does not use or claim access to Swiggy internal data or systems.

## Problem

A late food delivery creates more than a logistics issue. When the expected delivery time changes unexpectedly, the customer loses confidence in the promise.

The opportunity is not simply to make every delivery faster. It is to improve **ETA reliability** and reduce friction when an order is at risk of being late.

## Product goal

Improve delivery-promise reliability and give customers earlier, clearer information when an order is at risk of missing its communicated ETA.

## Hypothesis

If the system can identify meaningful delay risk early enough, proactive communication plus a clear recovery path will reduce surprise, avoidable cancellations, and support contacts.

## Proposed solution

### 1. Detect delay risk early

Use operational signals such as:

- Restaurant preparation-time variance
- Rider assignment and availability
- Distance and travel conditions
- Historical restaurant performance
- Current order backlog / demand intensity

### 2. Communicate before the promise is breached

Trigger a concise message when the risk score crosses a confidence threshold.

Example:

> Your order may arrive about 15 minutes later than planned because the restaurant is taking longer than expected.

Show a revised ETA only when confidence is high enough to avoid repeated changes.

### 3. Give users a recovery path

Depending on order stage and applicable policy:

- Continue waiting
- View updated ETA
- Contact support
- Cancel / follow the applicable recovery path

## MVP

**Delay-risk signal → proactive notification → revised ETA → recovery path**

The first iteration should not attempt to rebuild the full delivery stack.

## Metrics

### North Star

**% of orders delivered within the communicated ETA**

### Supporting metrics

- ETA prediction accuracy
- Late-delivery rate
- Cancellation rate after ETA breach
- Support contacts per 1,000 delayed orders
- Post-delay satisfaction
- Repeat-order rate

### Guardrails

- False-positive delay alerts
- Notification complaints / opt-outs
- Refund or compensation cost per order
- Operational workload

## Experiment plan

**Control:** existing ETA and delay communication.

**Treatment:** high-confidence proactive delay notification + revised ETA when appropriate + recovery path.

### Primary success signals

- Reduction in cancellations after ETA breach
- Reduction in support contacts for delayed orders

### Secondary signals

- Within-ETA delivery rate
- ETA accuracy
- Post-delay satisfaction
- Repeat ordering

### Trade-off

Too many alerts can create notification fatigue. Too few alerts fail to restore trust.

## Product flow

**Order placed**  
↓  
**Order in progress**  
↓  
**Risk check**  
↓  
**Low risk → normal ETA**  
**Elevated risk → proactive communication**  
↓  
**Revised ETA / recovery path**  
↓  
**Delivery completed**

## Data I would investigate

- Restaurant
- Time of day
- Geography
- Distance
- Preparation-time variance
- Rider assignment delay
- Demand / backlog intensity
- Root-cause category

The goal is to identify where ETA misses cluster and whether the causes are predictable early enough to act.

## Trade-offs

A better ETA is not necessarily a faster ETA.

An honest 45-minute promise that arrives in 43 minutes may create more trust than a 30-minute promise that becomes 50 minutes later.

The product decision is therefore about **promise reliability**, not just average delivery speed.

## Next iteration

After validating the MVP:

- Restaurant-level preparation-time calibration
- ETA confidence intervals
- Dynamic recovery policies
- Operational interventions for high-risk orders

## Portfolio takeaway

This case demonstrates product framing, hypothesis formation, metrics definition, experimentation, and cross-functional thinking.

**Detect early. Communicate clearly. Give the user control.**
