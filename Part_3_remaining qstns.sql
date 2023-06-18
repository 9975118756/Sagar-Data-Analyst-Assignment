# SET 3

## 3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

-- if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
-- if amount > 50000 Platinum
use assignment;
CREATE FUNCTION getpurchasestatus ( cust_number INT )
    RETURNS VARCHAR(10)
    AS
    BEGIN
    DECLARE  
    @total_purchase_amount
    DECIMAL(10,2);
    DECLARE 
    @purchase_status
    varchar(10);
    select @total_purchase_amount
    = sum(amount)
    from payments
    where customer_number = cust_no;
    if @total_purchase_amount<25000 
    set @purchase_status ='silver';
    else if @total_purchase_amount between 25000 and 50000
    set  @purchase_status ='gold';
    else if @total_purchase_amount>50000
    set
     @purchase_status = ' platunum';
    
    return @purchase_status;
    end;
    
    select 
    getpurchasestaus(103)
    as @purchase_status;
    
    

CALL customer_status( 103 );

-- b. Write a query that displays customerNumber, customername and purchase_status from customers table.

select c.customerNumber,
	   c.customerName,
       o.status
	from customers c
		LEFT JOIN orders o
		USING (customerNumber);

