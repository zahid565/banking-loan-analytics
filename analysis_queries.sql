SELECT
    loan_type,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    AVG(loan_amount) AS average_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY total_loan_amount DESC;


SELECT
    loan_status,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;


SELECT
    branch,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    AVG(loan_amount) AS average_loan_amount
FROM loans
GROUP BY branch
ORDER BY total_loan_amount DESC;


SELECT
    branch,
    COUNT(*) AS defaulted_loans,
    SUM(loan_amount) AS defaulted_amount
FROM loans
WHERE loan_status = 'Defaulted'
GROUP BY branch
ORDER BY defaulted_loans DESC;



SELECT
    loan_type,

    COUNT(*) AS total_loans,

    SUM(
        CASE
            WHEN loan_status = 'Defaulted'
            THEN 1
            ELSE 0
        END
    ) AS defaulted_loans,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status = 'Defaulted'
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS default_rate_percentage

FROM loans
GROUP BY loan_type
ORDER BY default_rate_percentage DESC;



SELECT
    DATE_FORMAT(loan_date, '%Y-%m') AS loan_month,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY DATE_FORMAT(loan_date, '%Y-%m')
ORDER BY loan_month;



SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.income,
    COUNT(l.loan_id) AS total_loans,
    SUM(l.loan_amount) AS total_borrowed
FROM customers c
JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city,
    c.income
ORDER BY total_borrowed DESC
LIMIT 10;