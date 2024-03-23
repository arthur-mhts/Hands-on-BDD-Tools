{{ config(materialized='table') }}

SELECT S.sale_date, P.product_id, P.category,
       SUM(S.quantity * P.price) AS daily_revenue 
FROM {{ ref('stg_sales') }} S
JOIN{{ ref ('stg_products')}} P ON P.product_id = S.product_id
GROUP BY S.sale_date, P.product_id, P.category
