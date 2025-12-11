INSERT INTO dim_customer(first_name, last_name, age, email, country, postal_code)
SELECT DISTINCT customer_first_name, customer_last_name, customer_age,
       customer_email, customer_country, customer_postal_code
FROM mock_raw;

INSERT INTO dim_seller(first_name, last_name, email, country, postal_code)
SELECT DISTINCT seller_first_name, seller_last_name, seller_email,
       seller_country, seller_postal_code
FROM mock_raw;

INSERT INTO dim_product(name, category, weight, color, size, brand, material,
                        description, rating, reviews, release_date, expiry_date)
SELECT DISTINCT product_name, product_category, product_weight, product_color,
       product_size, product_brand, product_material,
       product_description, product_rating, product_reviews,
       product_release_date, product_expiry_date
FROM mock_raw;

INSERT INTO dim_store(store_name, location, city, state, country, phone, email)
SELECT DISTINCT store_name, store_location, store_city, store_state,
       store_country, store_phone, store_email
FROM mock_raw;

INSERT INTO dim_supplier(name, contact, email, phone, address, city, country)
SELECT DISTINCT supplier_name, supplier_contact, supplier_email,
       supplier_phone, supplier_address, supplier_city, supplier_country
FROM mock_raw;

INSERT INTO dim_pet(pet_type, pet_name, pet_breed, pet_category)
SELECT DISTINCT customer_pet_type, customer_pet_name,
       customer_pet_breed, pet_category
FROM mock_raw;
