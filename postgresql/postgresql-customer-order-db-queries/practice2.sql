DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS "order";
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS customer;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE customer (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE category (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL
);

CREATE TABLE product (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL,
    quantity_in_stock INTEGER DEFAULT 0,
    category_id UUID REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE "order" (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    customer_id UUID REFERENCES customer(id) ON DELETE CASCADE,
    order_date TIMESTAMP DEFAULT NOW(),
    total_amount DECIMAL DEFAULT 0.0
);

CREATE TABLE order_item (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID REFERENCES "order"(id) ON DELETE CASCADE,
    product_id UUID REFERENCES product(id) ON DELETE SET NULL,
    quantity INTEGER NOT NULL,
    price DECIMAL NOT NULL
);



-- INSERT INTO customer (name, email) VALUES ('John Doe', 'johndoe@example.com');

-- INSERT INTO category (name) VALUES ('Electronics');
-- INSERT INTO category (name) VALUES ('Electric');
-- INSERT INTO category (name) VALUES ('Clothing');


-- INSERT INTO product (name, price, quantity_in_stock, category_id)
-- VALUES ('Smartphone', 299.99, 50, (SELECT id FROM category WHERE name = 'Electronics'));

-- INSERT INTO product (name, price, quantity_in_stock, category_id)
-- VALUES ('Party Suit', 499.99, 50, (SELECT id FROM category WHERE name = 'Clothing'));

-- INSERT INTO "order" (customer_id, total_amount)
-- VALUES ((SELECT id FROM customer WHERE name = 'John Doe'), 299.99);

-- INSERT INTO order_item (order_id, product_id, quantity, price)
-- VALUES (
--     (SELECT id FROM "order" WHERE customer_id = (SELECT id FROM customer WHERE name = 'John Doe')),
--     (SELECT id FROM product WHERE name = 'Smartphone'),
--     1,
--     299.99
-- );

-- UPDATE product
-- SET quantity_in_stock = quantity_in_stock - 1
-- WHERE id = (SELECT id FROM product WHERE name = 'Smartphone');


-- INSERT INTO order_item (order_id, product_id, quantity, price)
-- VALUES (
--     (SELECT id FROM "order" WHERE customer_id = (SELECT id FROM customer WHERE name = 'John Doe')),
--     (SELECT id FROM product WHERE name = 'Party Suit'),
--     1,
--     499.99
-- );

-- UPDATE product
-- SET quantity_in_stock = quantity_in_stock - 1
-- WHERE id = (SELECT id FROM product WHERE name = 'Party Suit');


-- SELECT * FROM customer;
-- SELECT * FROM category;
-- SELECT * FROM product;
-- SELECT * FROM "order";
-- SELECT * FROM order_item;

-- DELETE FROM "order"
-- WHERE customer_id = (SELECT id FROM customer WHERE name = 'John Doe');

-- -- Now order_item must be empty
-- SELECT * FROM order_item;

-- --Joins
-- -- Lets add some more orders

-- INSERT INTO "order" (customer_id, total_amount)
-- VALUES ((SELECT id FROM customer WHERE name = 'John Doe'), 299.99);


-- INSERT INTO order_item(order_id, product_id, quantity, price)
-- VALUES((SELECT id FROM "order" WHERE customer_id = (SELECT id FROM customer WHERE name = 'John Doe')),
--     (SELECT id FROM product WHERE name = 'Party Suit'), 10, 4999.90);
  
-- SELECT * FROM order_item;

-- -- write join query





