# E-Commerce Sales & Customer Analytics

*Analyzing e-commerce sales, customer behavior, profitability, and operational performance using Python, SQL, and Power BI.*

---

https://www.kaggle.com/datasets/datascikhan/e-commerce-sales-and-customer-analytics

## 📌 Table of Contents

* [Overview](#overview)
* [Business Problem](#business-problem)
* [Dataset](#dataset)
* [Tools & Technologies](#tools--technologies)
* [Project Structure](#project-structure)
* [Data Cleaning & Preparation](#data-cleaning--preparation)
* [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
* [Business Questions & Key Findings](#business-questions--key-findings)
* [Dashboard](#dashboard)
* [How to Run This Project](#how-to-run-this-project)
* [Final Recommendations](#final-recommendations)
* [Skills Demonstrated](#skills-demonstrated)

---

## Overview

This project analyzes **138,116 e-commerce orders across 46 columns** to understand sales performance, customer behavior, profitability, and operational efficiency.

The project follows an end-to-end analytics workflow using **Python for data cleaning and EDA, MySQL for business analysis, and Power BI for interactive visualization and dashboard development.**

---

## Business Problem

E-commerce businesses need to understand both **what drives sales** and **how customers and operations contribute to overall business performance**.

This project aims to:

* Analyze sales and profit performance
* Understand customer segments and purchasing behavior
* Compare repeat and non-repeat customers
* Evaluate regional and sales-channel performance
* Analyze delivery, shipping, returns, and cancellations
* Examine customer ratings and review sentiment
* Identify high-value customers using customer lifetime value
* Evaluate discounts in relation to sales and profitability

---

## Dataset

* **Records:** 138,116
* **Columns:** 46
* **Domain:** E-Commerce Sales & Customer Analytics

The dataset contains information related to:

* Orders and order status
* Customer demographics
* Customer segments and types
* Sales channels
* Payment methods
* Shipping methods
* Delivery performance
* Sales and discounts
* Taxes and shipping costs
* Product costs and profit
* Customer ratings and review sentiment
* Marketing channels
* Loyalty points
* Customer lifetime value
* Repeat-customer behavior

---

## Tools & Technologies

* **Python** – Data cleaning, preprocessing and exploratory data analysis
* **Pandas** – Data manipulation
* **NumPy** – Numerical analysis
* **Matplotlib & Seaborn** – Data visualization
* **MySQL** – Business-oriented SQL analysis
* **Power BI** – Interactive dashboard development
* **DAX** – KPI and measure calculations
* **Power Query** – Data transformation
* **Jupyter Notebook** – Python analysis environment
* **GitHub** – Project documentation and version control

---

## Project Structure

```text
E-Commerce-Sales-Customer-Analytics/
│
├── README.md
│
├── data/
│   └── ecommerce_sales_customer_analytics_150k.csv
│
├── notebooks/
│   └── Ecommerce_Sales_Customer_Analytics.ipynb
│
├── sql/
│   └── Ecommerce_Sales_Customer_Analytics_SQL.sql
│
├── dashboard/
│   └── Ecommerce_Sales_Customer_Analytics_Dashboard.pbix
│
└── report/
    └── E-Commerce_Sales_Customer_Analytics_Report.pdf
```


---

## Data Cleaning & Preparation

The dataset was examined and prepared before analysis.

Key steps included:

* Checked dataset structure, data types, and missing values
* Checked for duplicate records
* Analyzed unique values and categorical distributions
* Converted `order_date` into datetime format
* Created `order_month` for monthly analysis
* Created `delivery_delay` by comparing actual and estimated delivery days
* Checked for invalid ages, ratings, quantities, and negative sales values
* Identified numerical outliers
* Removed/finalized unnecessary fields
* Prepared the cleaned data for SQL analysis and Power BI

---

## Exploratory Data Analysis (EDA)

EDA was performed to understand major patterns across sales, customers, profitability, and operations.

### Sales Analysis

* Monthly sales and profit trends
* Sales by customer segment
* Sales by region
* Sales by sales channel
* Order-status distribution

### Customer Analysis

* Customer segment performance
* Repeat vs. non-repeat customers
* Customer order behavior
* Customer lifetime value
* Customer ratings

### Profitability Analysis

* Net sales
* Product cost
* Profit
* Profit margin
* Profit contribution by customer segment

### Operational Analysis

* Delivery status
* Delivery delays
* Shipping performance
* Returns
* Cancellations

---

## Business Questions & Key Findings

### 1. Which customer segments generate the most sales?

| Customer Segment | Net Sales |
| ---------------- | --------: |
| Consumer         |   ~97.20M |
| Premium          |   ~44.27M |
| VIP              |   ~17.90M |
| Business         |   ~17.76M |

Consumer customers generated the highest net sales among the analyzed customer segments.

### 2. How do repeat and non-repeat customers compare?

Repeat customers generated approximately:

* **Net Sales:** 176.70M
* **Profit:** 75.95M

Non-repeat customers generated approximately:

* **Net Sales:** 435K
* **Profit:** 193K

### 3. What is the delivery performance?

| Delivery Status | Orders |
| --------------- | -----: |
| On Time         | 86,916 |
| Cancelled       | 24,557 |
| Delayed         | 16,886 |
| Early           |  9,757 |

### 4. What other business areas were analyzed?

The project also examined:

* Regional sales performance
* Sales-channel performance
* Customer ratings
* Customer lifetime value
* Shipping methods
* Delivery delays
* Returns and cancellations
* Discounts and profitability

---

## Dashboard

An interactive **3-page Power BI dashboard** was developed.

### 📊 Executive Overview

Provides a high-level view of business performance through:

* Total Sales
* Total Profit
* Total Orders
* Total Customers
* Average Order Value
* Profit Margin
* Monthly Sales & Profit Trends
* Sales by Customer Segment
* Profit by Customer Segment
* Regional Sales
* Sales Channel Performance
* Order Status

### 👥 Customer & Sales Analysis

Focuses on customer behavior and sales patterns:

* Total Customers
* Repeat Customers
* Average Customer Lifetime Value
* Average Customer Rating
* Customer Rating Distribution
* Sales by Gender
* Sales by Region
* Sales by Customer Segment
* Repeat vs. Non-Repeat Customers

### 🚚 Operational Performance & Fulfillment

Focuses on order fulfillment and operational performance:

* On-Time Delivery %
* Return Rate %
* Average Delivery Days
* Cancellation Rate
* Delivery Status
* Monthly Delivery Performance
* Delivery Delay by Shipping Method
* Shipping Method Performance
* Return Performance

---

## How to Run This Project

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/e-commerce-sales-customer-analytics.git
```

### 2. Python Analysis

* Open the Jupyter Notebook from the `notebooks/` folder.
* Install the required Python libraries.
* Place the dataset in the appropriate `data/` folder.
* Run the notebook sequentially.

### 3. MySQL Analysis

* Create the required MySQL database.
* Load the prepared dataset.
* Open the SQL file from the `sql/` folder.
* Run the business-analysis queries.

### 4. Power BI Dashboard

Open:

```text
dashboard/Ecommerce_Sales_Customer_Analytics_Dashboard.pbix
```

<img width="1334" height="741" alt="image" src="https://github.com/user-attachments/assets/b176579d-c3cc-4f96-8c76-b1e570768cc6" />


<img width="1358" height="747" alt="image" src="https://github.com/user-attachments/assets/81122e9f-da11-4448-b67d-f75a911bcf53" />


<img width="1344" height="752" alt="image" src="https://github.com/user-attachments/assets/abc4ddec-596c-4c7c-930d-ea254fdb007b" />


## Final Recommendations

Based on the analysis:

* Focus retention strategies on repeat customers.
* Identify and target high-value customer segments.
* Monitor regional and sales-channel performance.
* Analyze delayed deliveries and operational bottlenecks.
* Evaluate discount strategies based on their impact on profitability.
* Use customer ratings and review sentiment to identify improvement areas.
* Monitor returns and cancellations to improve fulfillment performance.
* Use customer lifetime value to support customer segmentation and retention strategies.

---

## Skills Demonstrated

### Technical Skills

* Python
* Pandas
* NumPy
* SQL
* MySQL
* Power BI
* DAX
* Power Query
* Data Cleaning
* Exploratory Data Analysis
* Data Visualization
* Data Modeling
* Dashboard Development

### Analytical Skills

* Business Problem Solving
* KPI Analysis
* Customer Segmentation
* Sales Analysis
* Profitability Analysis
* Customer Behavior Analysis
* Operational Analysis
* Trend Analysis
* Business Insights
* Data-Driven Recommendations

