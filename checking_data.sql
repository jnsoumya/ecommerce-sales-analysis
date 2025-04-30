SELECT * FROM  retail_sales_db.retail_sales;

desc r retail_sales_db.retail_sales;

SELECT 
    unit_price,
    stock_code,
    revenue,
    quantity,
    invoice_no,
    invoice_date,
    description,
    customer_id,
    country,
    COUNT(*)
FROM  retail_sales_db.retail_sales
GROUP BY 
    unit_price,
    stock_code,
    revenue,
    quantity,
    invoice_no,
    invoice_date,
    description,
    customer_id,
    country
HAVING COUNT(*) > 1;


with cte as (
select customer_id,count(*) from retail_sales_db.retail_sales
where customer_id != ''
group by customer_id
)
select count(*) from cte;


with cte as (
	select invoice_no, customer_id,stock_code, count(*) from retail_sales_db.retail_sales
	group by 1,2,3
) 
select count(*) from cte;


select count(*) from retail_sales_db.retail_sales
where customer_id = 'NULL';

select sum(revenue) from retail_sales_db.retail_sales;


