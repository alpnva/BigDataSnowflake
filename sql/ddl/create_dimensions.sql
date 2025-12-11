-- CUSTOMER DIMENSION
DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);

-- SELLER DIMENSION
DROP TABLE IF EXISTS dim_seller;
CREATE TABLE dim_seller (
    seller_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);

-- PRODUCT DIMENSION
DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    weight TEXT,
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    description TEXT,
    rating INT,
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

-- STORE DIMENSION
DROP TABLE IF EXISTS dim_store;
CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name TEXT,
    location TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    phone TEXT,
    email TEXT
);

-- SUPPLIER DIMENSION
DROP TABLE IF EXISTS dim_supplier;
CREATE TABLE dim_supplier (
    supplier_id SERIAL PRIMARY KEY,
    name TEXT,
    contact TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    city TEXT,
    country TEXT
);

-- PET DIMENSION
DROP TABLE IF EXISTS dim_pet;
CREATE TABLE dim_pet (
    pet_id SERIAL PRIMARY KEY,
    pet_type TEXT,
    pet_name TEXT,
    pet_breed TEXT,
    pet_category TEXT
);
