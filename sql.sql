# Finding total items in the dataset
SELECT count(itemDescription)
FROM onlineretail.groceries_dataset;

#Finding all distinct items
SELECT COUNT(DISTINCT itemDescription)
from onlineretail.groceries_dataset;

# Listing all distinct items
SELECT DISTINCT itemDescription
from onlineretail.groceries_dataset
order by itemDescription;

# Identifying how many times each item appears
SELECT itemDescription,count(itemDescription)
FROM onlineretail.groceries_dataset
group by itemDescription
order by count(itemDescription) desc;

# Creating transaction by grouping items by member_number and date
SELECT Member_number, Date, GROUP_CONCAT(itemDescription ORDER BY itemDescription SEPARATOR ', ') AS items_bought
FROM onlineretail.groceries_dataset
GROUP BY Member_number, Date
ORDER BY Member_number, Date;

SELECT 
    A.itemDescription AS item_1, 
    B.itemDescription AS item_2, 
    COUNT(*) AS frequency
FROM onlineretail.groceries_dataset A
JOIN onlineretail.groceries_dataset B
ON A.Member_number = B.Member_number 
AND A.Date = B.Date
AND A.itemDescription < B.itemDescription
GROUP BY item_1, item_2
ORDER BY frequency DESC;

# Calculating Support
SELECT 
    A.itemDescription AS item_1, 
    B.itemDescription AS item_2, 
    COUNT(*) / (SELECT COUNT(DISTINCT Member_number, Date) FROM onlineretail.groceries_dataset) AS support
FROM onlineretail.groceries_dataset A
JOIN onlineretail.groceries_dataset B
ON A.Member_number = B.Member_number AND A.Date = B.Date AND A.itemDescription < B.itemDescription
GROUP BY item_1, item_2
ORDER BY support DESC;

# Easier way to calculate support by finding no of transactions containg the 2 items/Total Transactions
# Calculating confidence
# 1 st rule other vegrtable --> whole milk
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%other vegetable%' 
  AND items_bought LIKE '%whole milk%';

SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%other vegetables%';


# rule 2
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%rolls/buns%' 
  AND items_bought LIKE '%whole milk%';
  
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%rolls/buns%';
  
# rule 3
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%soda%' 
  AND items_bought LIKE '%whole milk%';

SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%soda%';

# rule 4  
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%whole milk%' 
  AND items_bought LIKE '%yogurt%';

SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%whole milk%';

# rule 5
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%other vegetables%' 
  AND items_bought LIKE '%rolls/buns%';


SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%other vegetables%';

# rule 6
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE items_bought LIKE '%other vegetables%' 
  AND items_bought LIKE '%soda%';
  
SELECT COUNT(*) 
FROM onlineretail.purchase
WHERE  items_bought LIKE '%other vegetables%';







