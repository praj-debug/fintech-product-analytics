# BookNest — Online Bookstore

BookNest is a full-stack learning project: a modern online bookstore with a customer storefront, shopping cart, checkout flow, customer accounts, and an admin inventory/order workspace.

> Status: Planning and foundation. The first implementation milestone is a responsive catalogue storefront using seeded book data.

## Product goals
- Help readers discover books by title, author, and category.
- Make book details and availability easy to understand.
- Support a straightforward cart and checkout journey.
- Give administrators tools to manage catalogue, inventory, and orders.

## Planned stack

| Layer | Technology |
|---|---|
| Frontend | React + Vite |
| Backend | Node.js + Express |
| Database | MongoDB |
| API testing | Postman |
| Version control | Git + GitHub |

## Core features

### Storefront
- Homepage with featured books
- Catalogue and book detail pages
- Search by title or author
- Category filters
- Responsive layout

### Customer
- Registration, login, and logout
- Cart quantity controls and item removal
- Checkout and order confirmation
- Order history and profile

### Admin
- Create, update, and delete books
- Inventory management
- Order listing and status updates

## Milestones
- [ ] M1: React/Vite setup and responsive storefront
- [ ] M2: Catalogue search, category filters, and book details
- [ ] M3: Express API and MongoDB models
- [ ] M4: Cart and checkout
- [ ] M5: Authentication and authorization
- [ ] M6: Admin catalogue, inventory, and order management
- [ ] M7: Tests, deployment, and documentation

## Proposed data model

**Book**
- `title`, `author`, `description`
- `price`, `category`, `coverImage`
- `stock`, `rating`

**User**
- `name`, `email`, `passwordHash`, `role`

**Cart**
- `userId`, `items[]` (book ID and quantity)

**Order**
- `userId`, `items[]`, `totalAmount`, `status`, timestamps

## API outline

| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/books` | List and filter books |
| GET | `/api/books/:id` | Get book details |
| POST | `/api/auth/register` | Register |
| POST | `/api/auth/login` | Login |
| GET | `/api/cart` | Get current cart |
| POST | `/api/cart/items` | Add/update cart item |
| POST | `/api/orders` | Place an order |
| GET | `/api/orders` | Current user's orders |
| POST | `/api/admin/books` | Create a book (admin) |
| PATCH | `/api/admin/books/:id` | Update a book (admin) |
| DELETE | `/api/admin/books/:id` | Delete a book (admin) |

## Design direction
- Warm cream background
- Forest-green primary colour
- Burnt-orange accents
- Editorial serif headlines and clean sans-serif body text
- Accessible contrast, responsive layouts, clear focus states

## Local development (planned)
The client and server will live in separate folders. Setup instructions and environment variables will be documented here as those pieces are implemented. Never commit real credentials; use a local `.env` file and provide an `.env.example`.

## Learning outcomes
React components and state, JavaScript async workflows, REST APIs, Express middleware, MongoDB CRUD, password hashing, JWT-based sessions, authorization, API testing, Git workflow, and deployment.
