DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales (
    id SERIAL PRIMARY KEY,

    sale_date DATE,
    quantity INT,
    total_price NUMERIC,

    customer_id INT REFERENCES dim_customer(customer_id),
    seller_id INT REFERENCES dim_seller(seller_id),
    product_id INT REFERENCES dim_product(product_id),
    store_id INT REFERENCES dim_store(store_id),
    supplier_id INT REFERENCES dim_supplier(supplier_id),
    pet_id INT REFERENCES dim_pet(pet_id)
);
