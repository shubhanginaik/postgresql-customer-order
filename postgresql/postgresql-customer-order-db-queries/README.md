Database Setup:
Install PostgreSQL and use the psql for interacting with the DB
Use `CREATE EXTENSION IF NOT EXISTS "uuid-ossp";` to enable UUID generation. UUIDs will be used as primary keys for unique identification across tables.
Schema Design: Create the following tables
customer: Stores information about customers.
category: Defines different product categories.
product: Contains product details, with each product assigned to a category.
order: Represents orders placed by customers.
order_item: Associates products with specific orders.
Queries and Mutations:
Insert a New Product
Place an Order
Retrieve Orders
Update Product Quantity when order is placed
Handle it manually OR
Automating with a Trigger (Check how you write Functions)
Delete an Order
Delete a specific order from the `order` table. Ensure that deleting an order also deletes the associated items in the `order_item` table.
