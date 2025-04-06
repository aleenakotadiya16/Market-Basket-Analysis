**1.	Introduction**
Association Rule Mining (ARM) is a key data mining technique used to identify relationships between frequently co-occurring items in large datasets. It is widely used in market basket analysis, recommendation systems, fraud detection, and healthcare analytics.
**2.**	**Data set information**
The dataset is from a retail store and contains transaction records for grocery items, comprising a total of 38,765 entries.
**3.**	**Data Dictionary**
1.	Member_numer : Unique number assign to each customer
2.	Date : The date of purchase
3.	ItemDescription : Item bought by the customer

**4.**	**Key Concepts**
1.	Support: Measures how frequently an itemset appears in the dataset.
 Support(A⇒B)= Transactions containing A and B / Total transactions

2.	Confidence: Indicates the likelihood of item B being purchased when item A is purchased.
Confidence(A⇒B)=  Support(A∪B)/ Support(A) 
**3.**	**Lift**: Measures how much more likely A and B co-occur than if they were independent.
                        Lift(A⇒B) = Confidence(A⇒B) / Support(B)

o	If Lift > 1: A and B are positively correlated.
o	If Lift = 1: A and B are independent.
o	If Lift < 1: A and B are negatively correlated.
4.	**Leverage**: Measures the difference between the observed frequency of co-occurrence and expected frequency if A and B were independent.
                   Leverage(A⇒B)=Support(A∪B)−Support(A)×Support(B)

**5.**	**Data Discovery**
1.	No of Items present : There are 167 Unique items in the dataset
2.	Most frequent items: Whole milk is the most frequent item appearing 2502 times followed by other vegetables appearing 1898 times.
3.	What are we going to do?
We are going to find out association rules. Association rules are what items are frequently bought together. Identifying this can help us make better suggestions to the consumer, hence improving the revenue.

**6.**	**Calculating support**
Top 10 rules:
Item A	Item B	Support
other vegetables --> whole milk	0.0162
rolls/buns --> whole milk	0.0152
soda --> whole milk	0.0133
whole --> milk	yogurt	0.0122
other --> vegetables	rolls/buns	0.0122
other vegetables	--> soda	0.0107
sausage -->	whole milk	0.0098
tropical fruit--> whole milk	0.0091
other vegetables	--> yogurt	0.0088
rolls/buns--> soda	0.0087

Here our dataset has 38,765 transactions so the above rules are interpreted as  
Other vegetables and whole milk appear 1.62% of the total transactions which is 627 times. 
We are going to try to focus on finding 5 strong rules therefore we are choosing the top 6 pairs that have the highest support.
**7.	Rule Calculations**

a.	Most Bought Item: Whole Milk
Whole milk is the most frequently purchased item, meaning it has high support. Many strong association rules include whole milk, making it a central product for marketing strategies.
Rule			Confidence	Lift
other vegetables → whole milk	0.1215		1.99
rolls/buns → whole milk	0.1263	2.07
soda → whole milk	0.1197	1.96

yogurt → whole milk	0.1299	2.13

soda → other vegetables		0.0997		2.12

b.	Interpreting Confidence and lift:
other vegetables → whole milk = confidence =0.1215 
It means that 12.15% of the time when other vegetables are bought, whole milk is also bought.
c.	Limitations 
In our case no rule is on par with the threshold 0.5 some reasons could be :
Dataset Size Limitation:
•	The dataset may not be large enough to capture stronger associations between items.
•	More transactions would provide better support for frequent itemsets, leading to higher confidence values.
Sparse Co-occurrence:
•	Items may be frequently purchased individually but not necessarily together often enough to form strong association rules.
•	This causes confidence to be low since the fraction of transactions containing both items remains small.
Whole Milk as the Dominant Item:
•	Since whole milk is the most frequently bought item, it appears in many transactions.
•	This can dilute the strength of specific item associations, leading to lower confidence values.
Even though the rules seem weak because of low confidence, it may not always be true.

d.	Lift
Lift is a key metric in association rule mining because it measures the strength of a relationship between two items beyond what would be expected by chance. Unlike confidence, which only tells how often B appears when A is present, lift accounts for the overall frequency of both items in the dataset
other vegetables → whole milk =lift =1.99 
Since the lift is greater than 1, it shows a positive association between "other vegetables" and "whole milk."
→ Specifically, customers who buy "other vegetables" are 1.99 times more likely to also buy "whole milk" compared to random chance

**8.	Best Rules and Insights**

a.	Strong Rules (High Lift & Confidence):
•	yogurt → whole milk (Lift = 2.13, Confidence = 0.1299)
•	rolls/buns → whole milk (Lift = 2.07, Confidence = 0.1263)
•	soda → other vegetables (Lift = 2.12, Confidence = 0.0997)

b.	Key Insights:
•	Whole milk has the highest support, making it a crucial item in purchasing patterns.
•	Customers who buy other vegetables are more likely to buy whole milk (Lift = 1.99).
•	Soda and whole milk are frequently purchased together (Lift = 1.96), suggesting an opportunity for bundled discounts.
•	Cross-promotions involving whole milk and other high-lift items can increase sales and customer retention.

**9.	Implementation **

1.	Product Placement: Place frequently bought-together items near each other (e.g., yogurt and whole milk).
2.	Bundling & Discounts: Offer discounts on items often purchased together, like soda and whole milk.
3.	Stock Optimization: Ensure high-lift item pairs are well-stocked to prevent loss of potential sales.
4.	Strategic Promotions: Since whole milk is the most purchased item, offering discounts or promotional pricing on complementary items can increase basket size.




