# AMAN FASHION

Initial project scaffolding for AMAN FASHION.

## Project Structure

```
aman-fashion/
├── mobile/     # Mobile client application
├── backend/    # Node.js + TypeScript Express backend with Prisma ORM
├── admin/      # Admin dashboard application
└── README.md   # Project documentation
```

## Backend Getting Started

1. Navigate to backend:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Setup environment variables:
   ```bash
   cp .env.example .env
   # Update DATABASE_URL with your Neon PostgreSQL connection string
   ```

4. Run development server:
   ```bash
   npm run dev
   ```

5. Health check:
   ```bash
   curl http://localhost:5000/health
   ```
