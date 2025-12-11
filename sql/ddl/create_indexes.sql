CREATE INDEX IF NOT EXISTS idx_customer_name_email
ON dim_customer(first_name, last_name, email);

CREATE INDEX IF NOT EXISTS idx_seller_name_email
ON dim_seller(first_name, last_name, email);

CREATE INDEX IF NOT EXISTS idx_product_name
ON dim_product(name);

CREATE INDEX IF NOT EXISTS idx_store_name
ON dim_store(store_name);

CREATE INDEX IF NOT EXISTS idx_supplier_name
ON dim_supplier(name);

CREATE INDEX IF NOT EXISTS idx_pet_name
ON dim_pet(pet_name);