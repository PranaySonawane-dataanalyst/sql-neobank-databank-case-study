# ✍🏻 SQL Neo Bank's Data Bank Case Study

## 📄 Description

This case study is based on **neo banks**, which have recently emerged in the financial sector. These banks operate **solely online**, and each customer is allocated free **cloud data storage**, called a *Data Bank*, which is directly linked to their account balance.  

The Data Bank team needs analytical support, as this business model comes with some intriguing challenges.  
To address this, I focused on **metrics calculations, business growth analysis, and smart data insights** to help the company estimate trends and plan for the future more accurately.

---

## 🧱 Database Schema

The schema is based on the following tables:

### 1. `customer_nodes`

- `customer_id` → int  
- `region_id` → int  
- `node_id` → int  
- `start_date` → date  
- `end_date` → date  

📌 *500 rows of data*

---

### 2. `customer_transactions`

- `customer_id` → int  
- `txn_date` → date  
- `txn_type` → varchar  
- `txn_amount` → int  

📌 *5,869 rows of data*

---

### 3. `regions`

- `region_id` → int  
- `region_name` → varchar  

📌 *5 rows of data*

---

### DDL Commands

**1. `customer_nodes`**

```sql
CREATE TABLE customer_nodes (
   customer_id INTEGER  NOT NULL,
   region_id   INTEGER  NOT NULL,
   node_id     INTEGER  NOT NULL,
   start_date  VARCHAR(24) NOT NULL,
   end_date    VARCHAR(24) NOT NULL
);
```

**2. `customer_transactions`**

```sql
CREATE TABLE customer_transactions (
   customer_id INTEGER  NOT NULL,
   txn_date    VARCHAR(24) NOT NULL,
   txn_type    VARCHAR(10) NOT NULL,
   txn_amount  INTEGER  NOT NULL
);
```

**3. `regions`**

```sql
CREATE TABLE regions (
   region_id   INTEGER  NOT NULL,
   region_name VARCHAR(9) NOT NULL
);
```

---

## 📌 How to Use the Folders
1. After creating a database, copy all the DDL commands mentioned above (or use the SQL files provided in the repository).  
2. In the same folder, you will also find the **DML commands** to insert sample datasets for practice.  
3. I have also uploaded a PDF file containing all the **questions (without answers)**, so you don’t need to create a separate file. Just download the file named:  
   **`01_Case Study All Info, Questions And Answers`**

---

## ❓ Key Analysis Questions

1. How many different nodes make up the Data Bank network?  
2. How many nodes are there in each region?  
3. How many customers are divided among the regions?  
4. What is the total transaction amount for each region?  
5. How long does it take on average to move clients to a new node?  
6. What is the unique count and total amount for each transaction type?  
7. What is the average number and size of past deposits across all customers?  
8. For each month, how many Data Bank customers make more than one deposit and at least either one purchase or one withdrawal?

---

## 📊 Insights

**1. Total Unique Nodes**  
- The Data Bank network has a total of **3,500 unique nodes**.

---

**2. Total Nodes per Region**  

| Region     | Nodes |
|------------|-------|
| Australia  | 770   |
| America    | 735   |
| Africa     | 714   |
| Asia       | 665   |
| Europe     | 616   |

---

**3. Total Customers per Region**  

| Region     | Customers |
|------------|-----------|
| Australia  | 110       |
| America    | 105       |
| Africa     | 102       |
| Asia       | 95        |
| Europe     | 88        |

📌 *Insight:* We observe that the number of **nodes is significantly higher than the number of customers**. This indicates underutilization of infrastructure. To improve efficiency, the bank should consider running marketing campaigns, promotions, or customer acquisition strategies to increase adoption.

---

**4. Total Transaction Amount per Region**

| Region     | Total Transactions |
|------------|---------------------|
| Australia  | 4,611,768           |
| America    | 4,406,276           |
| Africa     | 4,233,481           |
| Asia       | 4,057,879           |
| Europe     | 3,401,552           |

---

**5. Average Time Taken to Move to Another Node**  
- **14.63 days**  

📌 *Insight:* Customers tend to switch nodes relatively quickly. This suggests the bank should optimize or upgrade node services to encourage longer customer retention.

---

**6. Average Number and Size of Past Deposits Across All Customers**  

- **Average Deposits per Customer:** 5.34  
- **Average Deposit Amount:** $508.86  

📌 *Insight:* The deposit activity shows steady engagement, but there’s potential to increase deposit frequency through loyalty programs or higher-interest savings incentives.

---

## 📎 Author
**Pranay Sonawane** 
Data Analyst

📫 Connect on LinkedIn :- www.linkedin.com/in/sonawane-pranay
