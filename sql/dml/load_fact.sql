INSERT INTO fact_sales(
    sale_date, quantity, total_price,
    customer_id, seller_id, product_id, store_id, supplier_id, pet_id
)
SELECT 
    sale_date, sale_quantity, sale_total_price,

    c.customer_id,
    s.seller_id,
    p.product_id,
    st.store_id,
    sp.supplier_id,
    pt.pet_id

FROM mock_raw mr
LEFT JOIN dim_customer c 
    ON c.first_name = mr.customer_first_name
   AND c.last_name = mr.customer_last_name
   AND c.email = mr.customer_email

LEFT JOIN dim_seller s
    ON s.first_name = mr.seller_first_name
   AND s.last_name = mr.seller_last_name
   AND s.email = mr.seller_email

LEFT JOIN dim_product p
    ON p.name = mr.product_name

LEFT JOIN dim_store st
    ON st.store_name = mr.store_name

LEFT JOIN dim_supplier sp
    ON sp.name = mr.supplier_name

LEFT JOIN dim_pet pt
    ON pt.pet_name = mr.customer_pet_name;
