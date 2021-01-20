-- Data Analysis 

--Part 1:

--Query to find # of card holders
select count(id) from card_holder

--Query to count the # of transactions with amount equal to or less than $2.00
select count(transaction.id)from transaction
where amount <= 2.00

-- Query to sum the total amount where each transaction is $2.00 or below
select SUM(transaction.amount)from transaction
where amount <= 2.00

-- Query to sum the total amount of across all transactions in the given data 
select SUM(transaction.amount)from transaction

-- Grouping transactions by card 
Create view TransactionsCountByCard as
select count(transaction.id), transaction.card from transaction
group by transaction.card

-- Grouping transactions less than or equal to $2.00 by card 
Create view TransactionsCountByCardLessThan2 as
select count(transaction.id), transaction.card from transaction
where amount <= 2.00
group by transaction.card

-- Top 100 transactions made between 700am-900am
Create view Top1007to9 as
select transaction.id, transaction.date, transaction.amount, merchant.name as MerchantName, merchant_category.name as CategoryName from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where (extract(hour from transaction.date) >='7' and extract(hour from transaction.date) <='9')
order by amount desc
limit 100;

-- Number of  Transactions made between 700am-900am is 419
select transaction.id, transaction.date, transaction.amount, merchant.name as MerchantName, merchant_category.name as CategoryName from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where (extract(hour from transaction.date) >='7' and extract(hour from transaction.date) <='9')
order by amount desc


-- Top 100 transactions made between 200am-459am
Create view Top1002to459 as
select transaction.id, transaction.date, transaction.amount, merchant.name as MerchantName, merchant_category.name as CategoryName from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where (extract(hour from transaction.date) >='2' and extract(hour from transaction.date) <='4')
order by amount desc
limit 100;


-- Bottom 100 transactions made as sorted by time
Create view Bottom100 as
select transaction.id, transaction.date, transaction.amount, merchant.name as MerchantName, merchant_category.name as CategoryName from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where amount<=2.00
order by amount asc
limit 353;

-- Top 100 transactions made between 100am-800am ( at night when most places should be close)
select transaction.id, transaction.date, transaction.amount, merchant.name, merchant_category.name from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where extract(hour from transaction.date) >='1' and extract(hour from transaction.date) <='7'
order by amount desc
limit 100;


--Top 5 merchants prome to being hacked by small transactions
Create view Top5MerchantsPronetoHacking as 
select count(transaction.id), transaction.id_merchant, merchant.name from transaction
INNER JOIN merchant ON transaction.id_merchant=merchant.id
where amount <= 2.00
group by transaction.id_merchant, merchant.name
order by count(transaction.id) desc 
Limit 5;

elect count(transaction.id)from transaction
where amount <= 2.00

select * from transaction
where amount >= 500

CREATE VIEW  view1 as
select * from transaction
where amount <= 2.00

 -- Query to see transactions between 700am-900am and 1000pm-1200am and midnight to 600am
select * from transaction
where ((extract(hour from transaction.date) >='7' and extract(hour from transaction.date) <='8') or 
		(extract(hour from transaction.date) >='22' and extract(hour from transaction.date) <='23') or 
		(extract(hour from transaction.date) >='0' and extract(hour from transaction.date) <='6'))

--Total amount charged between midnight to 900am ( it is 55800.32)
select sum(amount) from transaction
where ((extract(hour from transaction.date) >='7' and extract(hour from transaction.date) <='8') or 
		(extract(hour from transaction.date) >='0' and extract(hour from transaction.date) <='6'))

-- Query to see highest amounts charged betweeen 600am-900am and to identify which merchants ( and which cateogry) are charged.
select transaction.id, transaction.date, transaction.amount, merchant.name, merchant_category.name from transaction
JOIN merchant ON transaction.id_merchant = merchant.id
JOIN merchant_category on merchant_category.id = merchant.id_merchant_category
where extract(hour from transaction.date) >='6' and extract(hour from transaction.date) <='8'
order by amount desc
limit 100;


--- Query for cardholder 25 for Jan-June transactions
select transaction.id, transaction.date, transaction.amount, transaction.card, credit_card.cardholder_id from transaction
JOIN credit_card ON transaction.card = credit_card.card
where credit_card.cardholder_id=25 and extract(month from transaction.date) <'7'
order by transaction.date asc

