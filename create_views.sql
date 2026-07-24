CREATE VIEW customer_loan_summary AS

SELECT
    c.customer_id,
    c.customer_name,
    c.age,
    c.gender,
    c.income,
    c.employment_type,
    c.city,
    c.branch,

    COUNT(l.loan_id) AS total_loans,

    SUM(l.loan_amount) AS total_borrowed,

    AVG(l.loan_amount) AS average_loan_amount,

    MAX(l.loan_amount) AS largest_loan,

    SUM(
        CASE
            WHEN l.loan_status = 'Defaulted'
            THEN 1
            ELSE 0
        END
    ) AS defaulted_loans

FROM customers c

LEFT JOIN loans l
    ON c.customer_id = l.customer_id

GROUP BY
    c.customer_id,
    c.customer_name,
    c.age,
    c.gender,
    c.income,
    c.employment_type,
    c.city,
    c.branch;

       CREATE VIEW loan_performance AS

SELECT
    l.loan_id,
    l.customer_id,
    c.customer_name,
    c.city,
    c.branch,

    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_date,
    l.loan_status,

    COUNT(p.payment_id) AS total_payments,

    COALESCE(
        SUM(p.amount_paid),
        0
    ) AS total_paid,

    SUM(
        CASE
            WHEN p.payment_status = 'On Time'
            THEN 1
            ELSE 0
        END
    ) AS on_time_payments,

    SUM(
        CASE
            WHEN p.payment_status = 'Late'
            THEN 1
            ELSE 0
        END
    ) AS late_payments,

    SUM(
        CASE
            WHEN p.payment_status = 'Missed'
            THEN 1
            ELSE 0
        END
    ) AS missed_payments

FROM loans l

JOIN customers c
    ON l.customer_id = c.customer_id

LEFT JOIN payments p
    ON l.loan_id = p.loan_id

GROUP BY
    l.loan_id,
    l.customer_id,
    c.customer_name,
    c.city,
    c.branch,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_date,
    l.loan_status;