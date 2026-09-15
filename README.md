# Apple Store Sales System (Oracle SQL Project)

A complete database application project developed for **Database Development & Application**, simulating an Apple Store sales, inventory, and human resources management system using Oracle SQL.

---

## Project Structure

* **`ddl/`**: Core table creation and constraint definitions (`customer`, `department`, `staff`, `category`, `product`, `orders`, `orders_list`, `payment`, `inventory`).
* **`data/`**: Initial testing datasets and record insert scripts.
* **`format/`**: SQL*Plus column formatting and layout configuration scripts.
* **`queries/`**: Advanced analytical business reports and interactive views (sales performance, inventory thresholds, payment audits, and customer spending rank).

---

## Database Schema (ERD)

The relational schema models core retail operations:
* **Customers & Orders**: Tracks member/guest details, order history, and line-item totals.
* **Staff & Departments**: Manages employees, roles, and departmental hierarchies.
* **Products & Inventory**: Categorizes Apple items, pricing, stock levels, and last restock tracking.
* **Payments**: Handles transaction statuses and financial verification.

---

## Getting Started

1. Connect to your Oracle database instance via SQL*Plus or SQL Developer.
2. Execute the table cleanup script (`drop_all_table_query.txt`).
3. Run the DDL scripts to set up the relational schema.
4. Import the provided test data (`insert_data_*.txt`).
5. Run formatting scripts and analytical queries for report generation.
