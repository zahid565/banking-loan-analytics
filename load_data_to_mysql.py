import pandas as pd
from sqlalchemy import create_engine

# -------------------------
# MySQL CONNECTION
# -------------------------

username = "root"
password = "Zahid56"
host = "localhost"
database = "banking_analytics"

engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}/{database}"
)


# -------------------------
# READ CSV FILES
# -------------------------

customers = pd.read_csv(
    "data/raw/customers.csv"
)

loans = pd.read_csv(
    "data/raw/loans.csv"
)

payments = pd.read_csv(
    "data/raw/payments.csv"
)


# -------------------------
# CONVERT DATE COLUMNS
# -------------------------

loans["loan_date"] = pd.to_datetime(
    loans["loan_date"]
).dt.date

payments["payment_date"] = pd.to_datetime(
    payments["payment_date"]
).dt.date


# -------------------------
# LOAD DATA INTO MYSQL
# -------------------------

customers.to_sql(
    "customers",
    con=engine,
    if_exists="append",
    index=False
)

loans.to_sql(
    "loans",
    con=engine,
    if_exists="append",
    index=False
)

payments.to_sql(
    "payments",
    con=engine,
    if_exists="append",
    index=False
)


print("Data loaded successfully into MySQL!")