import pandas as pd
import numpy as np
from faker import Faker

# Create Faker object
fake = Faker()

# Make results reproducible
np.random.seed(42)

# Number of records
number_of_customers = 1000
number_of_loans = 3000
number_of_payments = 15000


# -------------------------
# 1. CUSTOMERS DATA
# -------------------------

customers = []

for i in range(1, number_of_customers + 1):

    customer = {
        "customer_id": f"CUST{i:04d}",
        "customer_name": fake.name(),
        "age": np.random.randint(21, 65),
        "gender": np.random.choice(["Male", "Female"]),
        "income": np.random.randint(30000, 500000),
        "employment_type": np.random.choice(
            ["Salaried", "Self-Employed", "Business Owner"]
        ),
        "city": np.random.choice(
            ["Karachi", "Lahore", "Islamabad", "Hyderabad", "Peshawar"]
        ),
        "branch": np.random.choice(
            ["North Branch", "Central Branch", "South Branch"]
        )
    }

    customers.append(customer)


customers_df = pd.DataFrame(customers)


# -------------------------
# 2. LOANS DATA
# -------------------------

loans = []

for i in range(1, number_of_loans + 1):

    loan = {
        "loan_id": f"LOAN{i:05d}",
        "customer_id": np.random.choice(customers_df["customer_id"]),
        "loan_type": np.random.choice(
            ["Personal Loan", "Home Loan", "Car Loan", "Business Loan"]
        ),
        "loan_amount": np.random.randint(50000, 5000000),
        "interest_rate": round(np.random.uniform(8, 25), 2),
        "loan_date": fake.date_between(
            start_date="-3y",
            end_date="today"
        ),
        "loan_status": np.random.choice(
            ["Active", "Completed", "Defaulted"]
        )
    }

    loans.append(loan)


loans_df = pd.DataFrame(loans)


# -------------------------
# 3. PAYMENTS DATA
# -------------------------

payments = []

for i in range(1, number_of_payments + 1):

    payment = {
        "payment_id": f"PAY{i:06d}",
        "loan_id": np.random.choice(loans_df["loan_id"]),
        "payment_date": fake.date_between(
            start_date="-3y",
            end_date="today"
        ),
        "amount_paid": np.random.randint(5000, 200000),
        "payment_status": np.random.choice(
            ["On Time", "Late", "Missed"]
        )
    }

    payments.append(payment)


payments_df = pd.DataFrame(payments)


# -------------------------
# 4. SAVE DATA
# -------------------------

customers_df.to_csv(
    "data/raw/customers.csv",
    index=False
)

loans_df.to_csv(
    "data/raw/loans.csv",
    index=False
)

payments_df.to_csv(
    "data/raw/payments.csv",
    index=False
)


print("Data created successfully!")

print("\nCustomers:")
print(customers_df.head())

print("\nLoans:")
print(loans_df.head())

print("\nPayments:")
print(payments_df.head())