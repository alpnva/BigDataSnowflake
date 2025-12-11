SELECT 'dim_customer', COUNT(*) FROM dim_customer UNION ALL
SELECT 'dim_seller', COUNT(*) FROM dim_seller UNION ALL
SELECT 'dim_product', COUNT(*) FROM dim_product UNION ALL
SELECT 'dim_store', COUNT(*) FROM dim_store UNION ALL
SELECT 'dim_supplier', COUNT(*) FROM dim_supplier UNION ALL
SELECT 'dim_pet', COUNT(*) FROM dim_pet;
