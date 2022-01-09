SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.phone1,
    a.city,
    a.state
FROM
    customer
        JOIN
    address a ON c.customer_id = a.customer_id;


SELECT 
    c.first_name,
    a.street,
    o.payment_method,
    o.order_date,
    o.status
FROM
    (customer c
    JOIN address a ON c.customer_id = a.customer_id)
        JOIN
    orders o ON o.address_id = a.address_id
WHERE
    o.status = 'not delivered';



SELECT 
    CONCAT(de.first_name, ' ', de.last_name) AS Fullname,
    de.email,
    de.worktime,
    d.order_id,
    o.order_date
FROM
    (delivery d
    JOIN orders o ON d.order_id = o.order_id)
        JOIN
    deliveryexecutive de ON de.id = d.id;


SELECT 
    c.first_name AS customer_name,
    o.order_date,
    o.status,
    d.order_id,
    de.first_name AS executive_name
FROM
    ((customer c
    JOIN orders o ON o.customer_id = c.customer_id)
    JOIN delivery d ON o.order_id = d.order_id)
        JOIN
    deliveryexecutive de ON de.id = d.id
WHERE
    o.status = 'delivered';


SELECT 
    ca.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS Customer_name,
    CONCAT(p1.name, ' ') AS Products_in_cart
FROM
    (customer c
    JOIN cart ca ON c.customer_id = ca.customer_id)
        JOIN
    product p1 ON p1.product_id = ca.prod_id1;  