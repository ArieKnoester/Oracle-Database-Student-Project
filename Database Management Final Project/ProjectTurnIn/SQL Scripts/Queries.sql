
/*
*  Arie Knoester
*  CS315 Spring 2015
*  Project Queries
*/

/* #1. What is the current inventory for each product? */
SELECT p_name AS product_name,
       p_id AS product_id, 
       (total_received - total_shipped) AS current_inventory
FROM
      (SELECT p_id, SUM( p_qty) AS total_received
      FROM inventory i JOIN shipments sh
        ON i.ship_id = sh.ship_id
      WHERE sh.m_id IS NOT NULL
      GROUP BY p_id)
  JOIN
      (SELECT p_id, SUM( p_qty)AS total_shipped
      FROM inventory i JOIN shipments sh
        ON i.ship_id = sh.ship_id
      WHERE sh.s_id IS NOT NULL
      GROUP BY p_id)
    USING( p_id)
  JOIN products p
    USING( p_id)
ORDER BY p_name;
/*
PRODUCT_NAME	  PRODUCT_ID	 CURRENT_INVENTORY
Doodad	        D4372	                     256
Doohickey	      D2541	                     232
Gizmo	          GZ11H	                     116
*/


/* #2. What is the average amount of products shipped to and 
       from the warehouse in the first week of operation. What 
       is the total amount of products moved through the warehouse 
       during the same week?*/
SELECT DISTINCT
  (SELECT ROUND( AVG( p_qty), 2)
      FROM inventory i JOIN shipments sh
        ON i.ship_id = sh.ship_id
      WHERE m_id IS NOT NULL AND
      ship_date BETWEEN '01-FEB-2015' AND '07-FEB-2015') 
      AS avg_products_received,
  (SELECT  ROUND( AVG( p_qty), 2)
      FROM inventory i JOIN shipments sh
        ON i.ship_id = sh.ship_id
      WHERE s_id IS NOT NULL AND 
            ship_date BETWEEN '01-FEB-2015' AND '07-FEB-2015')
            AS avg_products_shippped,
  (SELECT SUM( p_qty)
      FROM inventory i JOIN shipments sh
        ON i.ship_id = sh.ship_id
      WHERE s_id IS NOT NULL AND 
            ship_date BETWEEN '01-FEB-2015' AND '07-FEB-2015') 
            AS total_products_shipped
FROM inventory i JOIN shipments sh
  USING( ship_id);
/*
AVG_PRODUCTS_RECEIVED	  AVG_PRODUCTS_SHIPPPED	  TOTAL_PRODUCTS_SHIPPED
               235.56	                   34.3	                     343
*/
   

/* #3. Which store receives the most variety of products 
       (the most number of different product ID's per store)
       and what is the store's location? */
SELECT s_id, num_products, address
FROM
(
    SELECT s_id, COUNT( p_id) AS num_products, 
           s_street || ' ' || s_city || ', '||
           s_state || ' ' || s_zip AS address
    FROM inventory JOIN shipments 
      USING( ship_id)
    JOIN  stores 
      USING( s_id)
    WHERE s_id IS NOT NULL
    GROUP BY s_id, s_street, s_city, s_state, s_zip
    ORDER BY num_products DESC
)
WHERE ROWNUM <= 1;
/*
S_ID	  NUM_PRODUCTS	  ADDRESS
   2	             5	  2037 N. Lincoln Ave. Chicago, IL 60614
*/


/* #4 Which manufacturers produce more than 1 product in inventory?*/
SELECT m_name, COUNT( p_id) AS num_products
FROM manufacturers m JOIN products p
  ON m.m_id = p.m_id
GROUP BY m_name
HAVING COUNT( p_id) > 1
ORDER BY m_name;
/*
M_NAME	          NUM_PRODUCTS
Doo-Daddy	                   2
Things LLC	                 2
World Wide Whats	           3
*/


/* #5 How many shipments went to the two Chicago stores?*/
SELECT COUNT( sh.ship_id) AS num_shipments_chicago
FROM shipments sh JOIN stores s
    ON sh.s_id = s.s_id
WHERE s.s_city = 'Chicago';
/*
NUM_SHIPMENTS_CHICAGO
                    9
*/


/* #6 How many products have been shipped to each store 
      and what is the grand total of products shipped?*/
SELECT s.s_id AS store_id,
       SUM( i.p_qty) AS total_products_shipped
FROM inventory i JOIN shipments sh
    ON i.ship_id = sh.ship_id
  JOIN stores s
    ON sh.s_id = s.s_id
WHERE sh.s_id IS NOT NULL
GROUP BY ROLLUP( s.s_id)
ORDER BY s.s_id;
/*
STORE_ID	  TOTAL_PRODUCTS_SHIPPED
       1	                     134
       2	                     198
       3	                      49
*/


/* #7 How many days has the warehouse been sending/receiving products? 
      Using the number of days in operation, what is the average number
      of shipments handled per day?*/
  
SELECT days_operating, total_shipments,
       total_shipments / days_operating AS avg_shipments_per_day
FROM
(
  SELECT MAX( ship_date) - MIN( ship_date) + 1 AS days_operating,
        COUNT( ship_id) AS total_shipments
  FROM shipments
);
/*
DAYS_OPERATING	TOTAL_SHIPMENTS	  AVG_SHIPMENTS_PER_DAY
            10	             25	                    2.5
*/


/* #8 How many products does each manufacturer have in inventory? */
SELECT m_name AS manufacturer,
       SUM( current_inventory) AS product_inventory_total
FROM
(
  SELECT m_name, p_name AS product_name,
         p_id AS product_id, 
         (total_received - total_shipped) AS current_inventory
  FROM
    (
        SELECT p_id, SUM( p_qty) AS total_received
        FROM inventory i JOIN shipments sh
          ON i.ship_id = sh.ship_id
        WHERE sh.m_id IS NOT NULL
        GROUP BY p_id
    )
    JOIN
    (
        SELECT p_id, SUM( p_qty)AS total_shipped
        FROM inventory i JOIN shipments sh
          ON i.ship_id = sh.ship_id
        WHERE sh.s_id IS NOT NULL
        GROUP BY p_id
    )
      USING( p_id)
    JOIN products p
      USING( p_id)
    JOIN manufacturers m
      USING( m_id)
)
GROUP BY m_name
ORDER BY m_name;
/*
MANUFACTURER	  PRODUCT_INVENTORY_TOTAL
Doo-Daddy	                          488
Gadgetec	                          116
Gaffs America	                      186
*/


/* #9. Which products, if any, are running low (less than 120)
       and who is the manufacturer? */
SELECT manufacturer, product_name, product_id, current_inventory
FROM
(
  SELECT m_name AS manufacturer,
         p_name AS product_name,
         p_id AS product_id, 
         (total_received - total_shipped) AS current_inventory
  FROM
    (
        SELECT p_id, SUM( p_qty) AS total_received
        FROM inventory i JOIN shipments sh
          ON i.ship_id = sh.ship_id
        WHERE sh.m_id IS NOT NULL
        GROUP BY p_id
    )
    JOIN
    (
        SELECT p_id, SUM( p_qty) AS total_shipped
        FROM inventory i JOIN shipments sh
          ON i.ship_id = sh.ship_id
        WHERE sh.s_id IS NOT NULL
        GROUP BY p_id
    )
      USING( p_id)
    JOIN products p
      USING( p_id)
    JOIN manufacturers m
      USING( m_id)
)
WHERE current_inventory < 120;
/*
MANUFACTURER	    PRODUCT_NAME	    PRODUCT_ID	  CURRENT_INVENTORY
World Wide Whats	Whatchamacallit	  WH017C	                    109
Gadgetec	        Gizmo	            GZ11H	                      116
World Wide Whats	Whatsis	          WH017S	                     70
*/


/* #10. Which manufacturer has the most entries in the inventory table? */
SELECT m_name AS manufacturer,
       inventory_entries
FROM
(
  SELECT m_name, COUNT( inv_ctrl_id) AS inventory_entries
  FROM inventory i JOIN products p
      ON i.p_id = p.p_id
    JOIN manufacturers m
      ON p.m_id = m.m_id
  GROUP BY m_name
  ORDER BY inventory_entries DESC
)
WHERE ROWNUM <= 1;
/*
MANUFACTURER	    INVENTORY_ENTRIES
World Wide Whats	                8
*/