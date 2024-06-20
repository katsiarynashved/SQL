# Data Base of Cafe
Hi! My name is Kate and this is my project I made during the studying of Data Bases. I worked in PostgreSQL (using pgAdmin4).
My task was to create a Data Base for a business, so chose café and then practiced on it.

**Skills I’ve got:**
<br>🔹	create table / delete table
<br>🔹 	full form of SQL query (select, where, group by, having, order by)
<br>🔹 functions (min, max, sum, avg, count)
<br>🔹 	join (inner, left, right, full)
<br>🔹 	subqueries


### Below you can see the scheme of the DB I made. There are several main modules:
**1)**	orders
<br>**2)**	menu + seasonalmenuchanges, historyofprices, orderitems
<br>**3)**	payment + paymenttype
<br>**4)**	tablesinrest + orderstable
<br>**5)**	reservation + orderreservation
<br>**6)**	employee


(1) Table **“orders”** consists of the information about the order, such as who served this order, date of the order and if there is a reservation. (2) This table is connected to the table “menu” through the table **“orderitems”** (like router). Table **“menu”** has data about name of dish, is this dish a temporary or not and is it actual for today. All the prices of our menu are in the table **“historyofprices”**, but action dates of seasonal menu concentrated in the table **“seasonalmenuchanges”** – both connected to the table “menu”. 
<br>(3) So, when the order is made it’s time to pay. Table **“payment”** has information like sum of check. It also refers to the table **“paymenttype”** which stores types of payments. For example, by cash or card and whether there are tips.
<br>(4) Table **“tablesinrest”** has information about all the tables that are in restaurant, for example, name of the table, how many sits it has. This table is also connected with the table “orders” by the table **“orderstable”** (also like router) so we may understand what table people sit at in certain order.
<br>(5) If the order has a reservation, we need to see the table **“reservation”** through the table **“orderreservation”**. “Reservation” has next data: how reserved a table, which one, how many persons are going to be and phone number of the contact person.
<br>(6) Finally, when we want to know who served the order, we refer to the table **“employee”** where we can find full name of the employee, her/his phone number, birthdate, email address and whether she/he is hired right now.

<br>

**Here are links to the scripts for the database:**
<br>✅ [Create DataBase script](DataBase_Cafe_Create.sql)
<br>✅ [Examples of the SQL-requests I do](Scrips.txt)

<br>

**Scheme:**
<div align="center"><img height="700" src="Tables.pgerd.png"  /></div> 
