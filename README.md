# Apple Store Sales System (Oracle SQL Project)

A complete database application project developed for **Database Development & Application**, simulating an Apple Store sales, inventory, and human resources management system using Oracle SQL.

---

## Project Structure

- **`ddl/`**: Table creation scripts (`customer`, `department`, `staff`, `category`, `product`, `orders`, `orders_list`, `payment`, `inventory`) and a script to drop all tables.
- **`insert_data/`**: Sample data insert scripts.
- **`format/`**: SQL*Plus column formatting and layout scripts.
- **`queries/`**: Analytical report scripts (category performance, inventory thresholds, payment status, top-spending customers, staff performance).

---

## Database Schema (ERD)

The relational schema models core retail operations:
* **Customers & Orders**: Tracks member/guest details, order history, and line-item totals.
* **Staff & Departments**: Manages employees, roles, and departmental hierarchies.
* **Products & Inventory**: Categorizes Apple items, pricing, stock levels, and last restock tracking.
* **Payments**: Handles transaction statuses and financial verification.

---

## Getting Started Steps

1. Open SQL*Plus or SQL Developer, connect to Oracle instance, and start from the repository root.
2. Drop existing tables: `@ddl/drop_all_table_query.sql`
3. Create tables (parent tables before child tables, e.g. `orders` before `orders_list`): `@ddl/create_table_ui_*.sql`
4. Load sample data: `@insert_data/insert_data_*.sql`
5. Apply formatting and run reports: `@format/...` then `@queries/demo_*.sql`
