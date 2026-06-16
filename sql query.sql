CREATE TABLE orders (
    row_id SERIAL PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales NUMERIC(10,2)
);

SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 10;

//Sales by Region//
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

"region"	"total_sales"
"West"	710219.77
"East"	669518.85
"Central"	492646.90
"South"	389151.45

//Top 10 Customers by Sales//
SELECT customer_name, SUM(sales) AS customer_sales
FROM orders
GROUP BY customer_name
ORDER BY customer_sales DESC
LIMIT 10;

"customer_name"	"customer_sales"
"Sean Miller"	25043.07
"Tamara Chand"	19052.22
"Raymond Buch"	15117.35
"Tom Ashbrook"	14595.62
"Adrian Barton"	14473.57
"Ken Lonsdale"	14175.23
"Sanjit Chand"	14142.34
"Hunter Lopez"	12873.30
"Sanjit Engle"	12209.44
"Christopher Conant"	12129.08

//Top 5 Products by Sales//
SELECT product_name, SUM(sales) AS product_sales
FROM orders
GROUP BY product_name
ORDER BY product_sales DESC
LIMIT 5;

"product_name"	                                         "product_sales"
"Canon imageCLASS 2200 Advanced Copier"	                    61599.83
"Fellowes PB500 Electric Punch Plastic Comb Binding Machine with Manual Bind"	27453.38
"Cisco TelePresence System EX90 Videoconferencing Unit" 	22638.48
"HON 5400 Series Task Chairs for Big and Tall"	            21870.57
"GBC DocuBind TL300 Electric Binding System"	            19823.48

//Sales Performance by Ship Mode//
SELECT ship_mode, SUM(sales) AS total_sales
FROM orders
GROUP BY ship_mode
ORDER BY total_sales DESC;

"ship_mode"	          "total_sales"
"Standard Class"	    1340831.64
"Second Class"	         449914.04
"First Class"	         345572.26
"Same Day"	             125219.03




-- Sales in Maharashtra region
SELECT * 
FROM orders
WHERE region = 'Maharashtra';

-- Orders shipped by 'Second Class'
SELECT * 
FROM orders
WHERE ship_mode = 'Second Class';



-- Total sales by region
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Average sales per customer
SELECT customer_name, AVG(sales) AS avg_sales
FROM orders
GROUP BY customer_name
ORDER BY avg_sales DESC;
