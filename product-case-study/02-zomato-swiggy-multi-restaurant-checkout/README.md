# Zomato vs Swiggy: Multi-Restaurant Checkout & Feature Discoverability

**Type:** Independent product teardown  
**Focus:** UX, discoverability, feature comprehension, checkout design, competitive analysis  
**Status:** Concept case study

> This is an independent portfolio exercise based on publicly observable product behavior. It does not use or claim access to Zomato or Swiggy internal data.

## Context

Multi-restaurant checkout lets a customer select items from multiple restaurants and complete the purchase through a single checkout flow.

In the comparison reviewed for this case study, **Zomato already supported the underlying functionality**, but the feature was easy to miss during normal browsing. Swiggy's implementation made the capability more explicit during the cart and checkout journey.

The product question is therefore not:

> **"Who built the feature first?"**

It is:

> **"Can a user understand that the feature exists, understand when it works, and confidently use it?"**

## The user problem

The core friction observed on Zomato was **discoverability, not capability**.

A user could see multiple restaurant carts, but the interaction that enabled a combined checkout was relatively easy to overlook. Saved carts could also show eligibility messaging that did not immediately explain what the user could or could not combine.

This creates a classic product gap:

**Feature available → feature not understood → feature under-discovered**

A feature that users cannot easily discover behaves, from the customer's perspective, almost like a missing feature. Humanity has somehow spent decades inventing increasingly sophisticated software and still struggles to tell people what buttons do.

## Competitive observation

### Zomato

Observed flow:

**Browse restaurants**  
↓  
**Items added to separate carts**  
↓  
**Multiple carts visible**  
↓  
**Small "Checkout all" entry point**  
↓  
**Combined checkout**  
↓  
**Restaurant-level order breakdown + separate coupons**

Key friction:
- The multi-cart state does not strongly teach the user that combined checkout is available.
- "Checkout all" is visually easy to miss.
- Some saved carts show an eligibility message without clearly explaining the rule.
- The value proposition of one checkout is not communicated early enough.
- The final checkout can feel like separate restaurant orders bundled into one payment rather than one coherent multi-restaurant experience.

### Swiggy

Observed flow:

**Items from Restaurant A + Restaurant B**  
↓  
**Both restaurants visibly selected together**  
↓  
**Single checkout surface**  
↓  
**Separate restaurant sections within the same flow**  
↓  
**Restaurant-specific coupons**  
↓  
**Separate delivery fees shown transparently**

Key strength:
- The interface teaches the user what is happening.
- Multi-restaurant participation is explicitly visible.
- Restaurant-level details remain separated while payment stays unified.
- Coupons and delivery fees are explained at the relevant restaurant level.
- The user does not have to infer the product model from a tiny CTA.

## Product diagnosis

### Zomato's real problem

This is best framed as a **feature discoverability problem** rather than a feature parity problem.

The funnel is effectively:

**Feature exists**  
→ **User notices it**  
→ **User understands it**  
→ **User trusts it**  
→ **User uses it**

Zomato appears strongest at the first step and weaker at the middle three.

That means the highest-leverage intervention is not rebuilding checkout. It is making the capability legible.

## If I were the Zomato PM

### Product goal

Increase the percentage of eligible users who discover and successfully use multi-restaurant checkout, without increasing checkout confusion or abandonment.

### Hypothesis

If Zomato makes multi-restaurant checkout visible at the moment users create multiple carts, explains the benefit in plain language, and clearly communicates eligibility rules, more users will recognize and use the feature.

## Proposed UX improvements

### 1. Make the value proposition explicit

Instead of relying on a small **"Checkout all"** CTA, introduce a persistent explanatory message when multiple eligible carts exist.

Example:

> **You can order from multiple restaurants in one checkout**

Then:

> 2 restaurants selected · 1 payment

Primary CTA:

> **Checkout both**

This removes the need for users to decode what "Checkout all" means.

### 2. Teach the feature at the moment of discovery

When the second eligible restaurant is added, show a lightweight contextual education layer:

> **New: Order from multiple restaurants in one checkout**

CTA:

> **See how it works**

This should be triggered only once per user or until dismissed, avoiding notification fatigue.

### 3. Turn the cart into a clear multi-restaurant state

Instead of making the user notice that two carts exist, add a visible state such as:

**2 restaurants · Combined checkout available**

Then show each restaurant as a distinct section.

The important design principle is:

**One payment does not mean one undifferentiated order.**

Restaurant-specific items, coupons, delivery fees and ETAs should remain clearly separated.

### 4. Explain eligibility instead of merely reporting it

Current-style messaging such as:

> Some of your saved carts aren't eligible for a single checkout.

is technically informative but weak as UX.

A better pattern:

> **1 cart can't be combined**
>
> This restaurant is not eligible for multi-restaurant checkout.
>
> **Why?** Delivery area / restaurant eligibility / order constraints.

Then give the next best action:

> **Checkout eligible carts**

The user should not need to perform forensic analysis on a sentence written by a product manager having a difficult afternoon.

### 5. Surface the feature before checkout

Add a discoverability surface on the home/cart experience:

> **Ordering from multiple places?**
>
> Add items from another restaurant and check out together.

This creates awareness before the user reaches a potentially confusing cart state.

### 6. Make checkout semantics obvious

At checkout, lead with:

> **1 checkout · 2 restaurant orders**

Then show:

**Restaurant A**  
Items · coupon · delivery fee · ETA

**Restaurant B**  
Items · coupon · delivery fee · ETA

**Total payable**

This makes the transaction model easy to understand while retaining operational separation.

## Proposed user flow

**User adds item from Restaurant A**  
↓  
**User adds item from Restaurant B**  
↓  
**System detects eligible multi-restaurant state**  
↓  
**"2 restaurants · Combined checkout available"**  
↓  
**User taps "Checkout both"**  
↓  
**Checkout explains: 1 payment + 2 restaurant orders**  
↓  
**Restaurant-level coupons and fees shown separately**  
↓  
**User pays once**  
↓  
**Orders tracked separately after checkout**

## MVP

The MVP should avoid a major backend or checkout rebuild.

### MVP scope

1. Persistent multi-restaurant eligibility label
2. Stronger combined-checkout CTA
3. Contextual education when the second eligible restaurant is added
4. Clear explanation for ineligible carts
5. Checkout header showing:
   - number of restaurants
   - number of orders
   - single-payment model
6. Restaurant-level breakdown for items, coupons, delivery fees and ETAs

## Success metrics

### North Star

**Multi-restaurant checkout adoption rate among eligible users**

### Funnel metrics

- % of users adding items from 2+ eligible restaurants
- % who notice / interact with the combined-checkout CTA
- % who start combined checkout
- % who complete payment
- Multi-restaurant checkout conversion rate

### UX metrics

- CTA interaction rate
- Eligibility-message comprehension
- Checkout abandonment
- Post-checkout support contacts
- User-reported confusion

### Guardrails

- Payment failure rate
- Order cancellation rate
- Refund rate
- Delivery complaint rate
- Support contacts per multi-restaurant order
- Incremental delivery cost / subsidy

## Experiment plan

### Experiment A: CTA discoverability

**Control:** Existing "Checkout all" treatment.

**Treatment:** High-visibility CTA with explicit value proposition:

> **Checkout 2 restaurants together**

Measure:
- Combined-checkout initiation
- Completion rate
- Abandonment

### Experiment B: Contextual education

**Control:** No education.

**Treatment:** One-time tooltip/banner when the second eligible restaurant is added.

Measure:
- Multi-restaurant adoption
- Dismissal rate
- Repeat usage

### Experiment C: Eligibility explanation

**Control:** Generic eligibility message.

**Treatment:** Specific reason + next best action.

Measure:
- Checkout continuation
- Abandonment
- Support contacts

## Product principles

### 1. Discoverability is part of product functionality

A feature does not create value merely because the backend supports it.

### 2. Explain the mental model

Users should understand:

**One checkout ≠ one restaurant order**

### 3. Show information at the moment it becomes useful

Teach the feature when the user creates the multi-restaurant state, not only after they stumble into the cart.

### 4. Preserve separation where the business model requires it

A unified payment experience can still expose separate restaurant-level:
- Items
- Coupons
- Delivery fees
- ETAs

## Key insight

The competitive lesson is not simply:

> **"Swiggy has a better feature."**

It is:

> **"Swiggy makes the feature easier to discover and understand."**

That distinction matters because **feature parity and experience parity are not the same thing**.

Zomato's opportunity is therefore less about copying Swiggy's interface and more about reducing the cognitive work required to understand its own capability.

## Portfolio takeaway

This teardown demonstrates how I would approach a real product problem:

**Observe → identify the user friction → separate capability from discoverability → define a measurable product goal → design targeted UX changes → test with experiments → measure adoption and guardrails**

The central PM question is:

> **"What does the user have to understand, notice, or believe before this feature can create value?"**
