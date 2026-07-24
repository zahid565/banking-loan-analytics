# Banking Loan Portfolio & Risk Analytics

An end-to-end data analytics project analyzing customer loans, loan performance, branch lending, payment behavior, and default risk using Python, MySQL, SQL, and Power BI.

---

## Project Overview

This project simulates a real-world banking analytics workflow.

The goal is to transform raw customer, loan, and payment data into meaningful business insights that can help analyze:

* Loan portfolio performance
* Loan product performance
* Branch lending activity
* Customer borrowing behavior
* Loan defaults and credit risk
* Payment performance
* Monthly lending trends

---

## Business Questions

This project answers the following business questions:

* What is the total value of the loan portfolio?
* How many total loans have been issued?
* Which loan types generate the highest lending amount?
* Which branches have the highest loan activity?
* What percentage of loans are defaulted?
* Which branches have the highest number of defaulted loans?
* How has loan activity changed over time?
* Which customers have borrowed the most?
* What is the overall payment performance?

---

## Technology Stack

| Tool       | Purpose                                  |
| ---------- | ---------------------------------------- |
| Python     | Data generation and data loading         |
| Pandas     | Data processing                          |
| MySQL      | Relational database                      |
| SQL        | Data analysis and business queries       |
| Power BI   | Interactive dashboard and visualization  |
| DAX        | KPI calculations and analytical measures |
| Git/GitHub | Version control and project sharing      |

---

## Project Architecture

```text
Raw Data
   │
   ▼
Python + Pandas
   │
   ▼
CSV Files
   │
   ▼
MySQL Database
   │
   ├── Customers Table
   ├── Loans Table
   └── Payments Table
   │
   ▼
SQL Analysis & Views
   │
   ├── Customer Loan Summary
   └── Loan Performance
   │
   ▼
Power BI
   │
   ▼
Interactive Banking Analytics Dashboard
```

---

## Database Structure

### Customers

Contains customer information:

* Customer ID
* Customer Name
* Age
* Gender
* Income
* Employment Type
* City
* Branch

### Loans

Contains loan information:

* Loan ID
* Customer ID
* Loan Type
* Loan Amount
* Interest Rate
* Loan Date
* Loan Status

### Payments

Contains payment information:

* Payment ID
* Loan ID
* Payment Date
* Amount Paid
* Payment Status

---

## Data Analysis Performed

### Loan Type Analysis

Analyzed:

* Total loans by loan type
* Total loan amount by loan type
* Average loan amount by loan type

### Branch Analysis

Analyzed:

* Total loan amount by branch
* Total number of loans by branch
* Defaulted loans by branch

### Risk Analysis

Analyzed:

* Defaulted loans
* Default rate
* Default risk by branch
* Default risk by loan type

### Customer Analysis

Analyzed:

* Total borrowing per customer
* Number of loans per customer
* Top customers by total borrowed amount

### Time-Series Analysis

Analyzed:

* Monthly loan activity
* Monthly loan disbursement trends

---

## Power BI Dashboard

The dashboard contains:

### KPI Cards

* Total Customers
* Total Loans
* Total Loan Amount
* Defaulted Loans
* Default Rate

### Visualizations

* Total Loan Amount by Loan Type
* Loan Portfolio by Status
* Total Loan Amount by Branch
* Monthly Loan Disbursement Trend
* Defaulted Loans by Branch

---

## Key Insights

The dashboard can be used to identify:

* The highest-performing loan products
* Branches with the highest lending activity
* Branches with higher default risk
* Changes in lending activity over time
* High-value customers
* Overall loan portfolio health

> The specific numerical insights depend on the data generated and analyzed in the project.

---

## Project Structure

```text
Banking-Loan-Analytics/
│
├── data/
│   └── raw/
│       ├── customers.csv
│       ├── loans.csv
│       └── payments.csv
│
├── python/
│   ├── create_data.py
│   └── load_data_to_mysql.py
│
├── sql/
│   ├── analysis_queries.sql
│   └── create_views.sql
│
├── powerbi/
│   └── Banking_Loan_Analytics.pbix
│
├── screenshots/
│   └── dashboard.png
│
└── README.md
```

---

## How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/banking-loan-analytics.git
```

### 2. Navigate to the Project

```bash
cd banking-loan-analytics
```

### 3. Generate the Data

```bash
python python/create_data.py
```

This generates the raw CSV files inside:

```text
data/raw/
```

### 4. Load Data into MySQL

```bash
python python/load_data_to_mysql.py
```

This loads the data into the MySQL database.

### 5. Run SQL Analysis

Open the SQL files inside:

```text
sql/
```

and execute the queries in MySQL.

### 6. Open the Power BI Dashboard

Open:

```text
powerbi/Banking_Loan_Analytics.pbix
```

and refresh the data connection if required.

---

## Skills Demonstrated

This project demonstrates practical experience in:

* Data generation
* Data cleaning
* Data transformation
* Relational database design
* MySQL
* SQL joins
* Aggregations
* `GROUP BY`
* `CASE WHEN`
* SQL views
* Business analysis
* DAX measures
* KPI development
* Power BI dashboard development
* Data visualization
* Business intelligence

---

## Author

**Zahid Hussain**

Aspiring Data Analyst with skills in:

* Python
* SQL
* MySQL
* Pandas
* Power BI
* Data Visualization
* Data Cleaning
* ETL

---

## Project Purpose

This project was developed as a portfolio project to demonstrate an end-to-end data analytics workflow, from raw data generation and database management to SQL analysis and interactive business intelligence dashboards.
