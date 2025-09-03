# Task 2 — Online Store Database

## Overview
Relational database for a small e-commerce store.  
Includes tables for Customers, Products, Orders, OrderDetails, and Payments, with sample data and stored procedures.

## Files
- `create_tables.sql` — schema creation (DROP + CREATE)
- `insert_data.sql` — sample data
- `queries.sql` — common queries and reports
- `stored_procs_and_triggers.sql` — procedures (PlaceOrderSingle) and triggers
- `ER-diagram.png` — ER diagram (visual)

## How to run
1. Import `create_tables.sql` into MySQL.
2. Run `insert_data.sql`.
3. Load `stored_procs_and_triggers.sql`.
4. Run queries in `queries.sql` or test stored procedures:
   - `CALL PlaceOrderSingle(1, 2, 2, 'Credit Card');`

## Notes
- `PlaceOrderSingle` is transactional: it checks stock, creates order/order detail, updates stock, and records payment.
- Trigger `trg_orderdetails_before_insert` prevents accidental inserts that would create negative stock.
