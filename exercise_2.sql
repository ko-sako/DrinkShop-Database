select order_id, order_date, total_gbp
FROM placed_orders
ORDER BY order_id LIMIT 10;
