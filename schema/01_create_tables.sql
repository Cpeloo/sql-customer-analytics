-- 1. Müşteriler
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    signup_date DATE,
    city VARCHAR(50)
);

-- 2. Ürün Kategorileri & Ürünler
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- 3. Sipariş Üst Bilgisi
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20) -- Completed, Cancelled, Returned
);

-- 4. Sipariş Detayları
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2)
);
