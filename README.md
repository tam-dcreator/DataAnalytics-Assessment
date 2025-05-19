# Data Analytics Assessment

This project contains a set of data analytics solutions using SQL.

## Explanations

### Question 1.
**Approach:**  
To identify customers with both a funded savings plan and a funded investment plan, I joined the relevant tables ('users_customuser', 'savings_savingsaccount', and 'plans_plan'). I counted unique rows where the plan was a regular savings plan and an investment with confirmed deposits for the savings count and investment count respectively. These values were grouped by user id and firstname and the total deposit for each user was calculated and adequately formatted. The results were then sorted by total deposits.

## Challenges
The main challenge was understanding what each column represented and their corresponding units of measures as there was no data dictionary attached to the file.
To resolve this I loaded each table into a python pandas dataframe and examined the values in the rows and deduced their meaning from prior knowledge, hints provided in the question and some google searches.

### Question 2.
**Approach:**  
I used a common table expression to get the transaction statistics per customers. 
This gave the total number of transactions, number of distinct months atleast one transaction was made and the average transaction per active month per customer. The results in the table expression were then grouped into frequency categories from High to Low. THis was then displayed alongside the number of customers in each category and the average transactions per month.

## Challenges
The task required clarity as i was unsure if the classification should only include customers who have made transactions for the month.


### Question 3.
**Approach:**
I joined the savings table with the plan table and then categorised each account based on their plan type. I then calculated the difference between the users last transaction and the current date. Users whose last transaction date exceeded the 365 days limit were returned along with their account type and inactive duration.


### Question 4.
**Approach:**
I started out by joining the users and savings table. I then calculated the tenure using the number of months since the user has been on the platform. Transactions with confirmed amounts greater than zero were counted since that shows activity on the user accounts. I then applied the clv formula and ordered the results accordingly. 
