create database assignment_db;
use assignment_db;
SELECT * FROM assignment_db.ele_store1;
-- 1) What is total number of orders placed? 
# =====number of orders=================
select count(OrderID) as tot_num_orders
 from assignment_db.ele_store1;             # 15000
-- 2) What are the unique channels present and how many are there? 
 # ===========unique channels ========================
select distinct channel  from assignment_db.ele_store1;  # Store, Online, Reseller,Catalog
# ======= how channels are there ==============
select count(distinct Channel) no_of_channels from assignment_db.ele_store1; # 4
-- 3) How many cities are there? 
# ============ no. of cities =========
select count(distinct city) as no_of_cities
 from assignment_db.ele_store1;                           #263
-- 4) Query the total cities count by Country 
# ===== total cities by country ================
select country,count(distinct city) from assignment_db.ele_store1
group by country
order by  country;      
--- 5) How many products are there? 
#============== no of products ==============#
select count(distinct productName) 
from assignment_db.ele_store1; #1638
-- 6) Query the total sales and total profit? 
# ================ the total sales and total profit ==================
select sum(sales) as total_sales,sum(profit) as total_profit 
from assignment_db.ele_store1;                                 # Total_sales --> 55391759.78809967, total_profit ----> 31587437.287211794
-- 7) Query the total sales by region and country?
 # ======= total of sales by region and country =========
  select region,country,sum(sales)as total_Sales 
  from assignment_db.ele_store1
 group by region,country;
--- 8) Query the total order qty by promotion name? 
## ====================== total order quantity by promotion name =================
select PromotionName,sum(OrderQty) as total_order_quantity 
from assignment_db.ele_store1
group by PromotionName;
--- 9) How much the total sales happened in Asia region? 
## ================= total sales in asia ===========================
select region,sum(sales) as total_Sales from assignment_db.ele_store1
where region='ASia'
group by region;   #12412345.056500021
-- 10)  How much profit got in Asia region and India? 
# =================== profit of indida ==============================
select region,country,sum(profit) as total_Profit from assignment_db.ele_store1
where region='ASia' and country= 'India'
group by region,country;  #357657.327792167
-- 11)  Query the total order qty by Manufacturer and Product Name? 
# =============== total order qty by Manufacturer and Product Name ====================
select Manufacturer,ProductName,sum(OrderQty) as total_quantiy 
from assignment_db.ele_store1
group by Manufacturer,ProductName;
--- 12)  Query the total order quantity greater than 27 by city? 
# ===== order quantiy by city ======================
select city,sum(OrderQty) order_quantity 
from assignment_db.ele_store1
group by city
having sum(OrderQty)>27;
-- 13)  How much total sales happened in China and Beijing? 
# ================ total sales in china and beijing ================
select Country,city,sum(sales) from assignment_db.ele_store1
where country='China' and city='beijing'
group by country,city; #6596953.095500005
--- 14)  How much total sales happened in Asian Holiday Promotion? 
# =============== the total sales happened in Asian Holiday Promotion ===========
select  PromotionName, sum(sales) as total_Sales from assignment_db.ele_store1
where PromotionName='Asian Holiday Promotion'
group by promotionName; #3615193.9904999994
-- 15)  How much total profit value by Contoso, Ltd Manufacturer? 
# ======================= the total profit  by Contoso, Ltd Manufacturer ===============
select Manufacturer,sum(profit)  from assignment_db.ele_store1
where Manufacturer='Contoso, Ltd'
group by manufacturer; #5670159.660158279
-- 16)  Query the total sales and total order qty by productcategory? 
#=========================== he total sales and total order qty by productcategory ============ 
select ProductCategory,sum(sales) total_Sales,sum(OrderQty) order_qty from assignment_db.ele_store1
group by ProductCategory;
-- 17)  Query the total sales value in between 1057 and 26700 by Region? 
# ======= the total sales value in between 1057 and 26700 by Region======================
select region,sum(sales) total_Sales
From assignment_db.ele_store1
where sales between 1057 and 26700
group by region;   #  Europe	9331408.230400007, Asia	10767755.592000011,North America	29290519.844500035
--- 18)  How many orders placed in Pittsfield city? 
# ========================= orders in Pittsfield city =============================================
select city,count(OrderID) no_of_orders  
from assignment_db.ele_store1
where city='Pittsfield'
group by city; # 31
-- 19)  Query the total sales and total profit by region, country and city? 
#=========================the total sales and total profit by region, country and city=======================
select region,country,city,sum(sales) total_sales,sum(profit) total_profit
from assignment_db.ele_store1
group by region,country,city;
-- 20)  Query the total unit cost and total price by productcategory, productsubcategory and Manufacturer? 
#================ the total unit cost and total price by productcategory, productsubcategory and Manufacturer ================
 select productcategory, productsubcategory,Manufacturer,sum(UnitCost) total_unit_Cost,sum(price) total_price
 from assignment_db.ele_store1
 group by productcategory, productsubcategory,Manufacturer;

