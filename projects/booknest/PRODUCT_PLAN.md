# BookNest — Product Plan

## Problem statement
Readers need a simple way to discover books, compare essential details, and complete a purchase without a cluttered shopping experience. Store operators need a reliable way to maintain catalogue information, stock, and order status.

## Target users
1. **Reader:** browses, searches, filters, adds items to a cart, and places an order.
2. **Store administrator:** maintains books and stock, and processes orders.

## MVP scope

### In scope
- Browse book catalogue
- Search by title/author
- Filter by category
- View book detail
- Add/remove/update cart items
- Place an order
- View own order history
- Admin book and order management

### Out of scope for the first MVP
- Real payment gateway
- Reviews and ratings submitted by customers
- Wishlists and recommendations
- Multi-vendor marketplace
- Coupons, loyalty, and subscriptions

For the first checkout milestone, use a clearly labelled demo checkout. Do not collect or store real payment-card details.

## Success measures

| Metric | Definition |
|---|---|
| Search success | Searches resulting in a book-detail view / total searches |
| Product discovery | Catalogue sessions with at least one detail-page view / catalogue sessions |
| Add-to-cart rate | Sessions with an add-to-cart event / catalogue sessions |
| Checkout completion | Orders placed / checkout starts |
| Stock accuracy | Order line items accepted without stock mismatch / total order line items |

These are proposed product metrics, not measured results.

## Key user journeys

### Discover a book
Home → catalogue → search/filter → book detail → add to cart.

### Complete an order
Cart → review quantities → demo checkout → order confirmation → order history.

### Maintain catalogue
Admin login → book list → create/edit book → update stock → save.

### Process an order
Admin order list → inspect order → update fulfilment status.

## Functional requirements
- Search should be case-insensitive and match title or author.
- Category filters should be combinable with search.
- Cart quantity must be a positive integer.
- A user can only view their own cart and orders.
- Admin-only APIs must enforce authorization on the server, not just hide UI controls.
- Order creation must validate stock and calculate totals on the server.
- Stock must not become negative.
- Passwords must be hashed; plaintext passwords must never be stored.
- Errors should be actionable and should not expose secrets or stack traces to customers.

## Acceptance criteria for M1
- Homepage renders at desktop and mobile widths.
- Book cards use consistent image sizing and display title, author, category, and price.
- Search filters the visible seed catalogue by title or author.
- Category filter narrows the catalogue and can be cleared.
- Empty search/filter results show a helpful empty state.
- Navigation links work and there are no console errors.
