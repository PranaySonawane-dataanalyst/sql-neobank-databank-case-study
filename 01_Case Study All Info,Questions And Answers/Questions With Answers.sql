
-- 1.How many different nodes make up the Data Bank network?
select
	count(cn.node_id) as unique_nodes
from
	customer_nodes as cn;
    
-- 2.How many nodes are there in each region?
select
	region_id,
    region_name,
    count(node_id) as nodes_per_region
from
	customer_nodes
inner join
	regions using (region_id)
group by
	region_id,
    region_name
order by
	region_id;

-- 3.How many customers are divided among the regions?
select
	region_id,
    region_name,
    count(distinct customer_id) as customers_per_region
from
	customer_nodes
inner join
	regions using(region_id)
group by
	region_id,
    region_name
order by
    region_id;
    
-- 4.Determine the total amount of transactions for each region name?
select
	r.region_id,
    r.region_name,
    sum(ct.txn_amount) as total_transactions
from
	regions as r,
    customer_nodes as cn,
    customer_transactions as ct
where
	r.region_id = cn.region_id
    and
    cn.customer_id = ct.customer_id
group by
	r.region_id,
    r.region_name
order by
	r.region_id;
    
-- 5.How long does it take on an average to move clients to a new node?
select 
	round(avg(datediff(end_date, start_date)), 2) as avg_days
from 
	customer_nodes
where 
	end_date != '9999-12-31';

-- 6.What is the unique count and total amount for each transaction type?
select
	ct.txn_type,
    count(*) as unique_total_transactions,
    sum(ct.txn_amount) as total_amount
from
	customer_transactions as ct
group by
	ct.txn_type;
    
-- 7.What is the average number and size of past deposits across all customers?
select
	round(
		count(ct.customer_id) * 1.0 /
        (select count(distinct ct.customer_id) from customer_transactions as ct),2
    ) as avg_deposits_count,
	concat('$', avg(round(ct.txn_amount),2)) as avg_deposits_amount
from
	customer_transactions as ct
where
	ct.txn_type = 'deposit';
    
-- 8.For each month - how many Data Bank customers make more than 1 deposit and at least either 1 purchase or 1 withdrawal in a single month?
select
	month(ct.txn_date) as months,
    count(distinct ct.customer_id) as customers_per_month
from
	customer_transactions as ct
where
	ct.customer_id in (
		select
			ct.customer_id
		from
			customer_transactions as ct
		where
			ct.txn_type = 'deposit'
		group by
			customer_id
		having
			count(*) > 1
    )
    
    and 
    
    customer_id in (
		select
			ct.customer_id
		from
			customer_transactions as ct
		where
			ct.txn_type in ('purchase','withdrawal')
		group by
			ct.customer_id
		having
			count(*) >= 1
    )
group by
	months
order by
	months ;
    