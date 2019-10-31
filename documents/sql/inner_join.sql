SELECT
    A.pka,
    A.c1,
    B.pkb,
    B.c2
    FROM
        A
            INNER JOIN B ON A.pka = B.fka;

SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
    FROM
        customer
            INNER JOIN payment ON payment.customer_id = customer.customer_id;

SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
    FROM
        customer
            INNER JOIN payment ON payment.customer_id = customer.customer_id
    ORDER BY
        customer.customer_id;

SELECT
    customer.customer_id,
    first_name,
    last_name,
    email,
    amount,
    payment_date
    FROM
        customer
            INNER JOIN payment ON payment.customer_id = customer.customer_id
    WHERE
        customer.customer_id = 2;

SELECT
    customer.customer_id,
    customer.first_name customer_first_name,
    customer.last_name  customer_last_name,
    customer.email,
    staff.first_name    staff_first_name,
    staff.last_name     staff_last_name,
    amount,
    payment_date
    FROM
        customer
            INNER JOIN payment ON payment.customer_id = customer.customer_id
            INNER JOIN staff ON payment.staff_id = staff.staff_id;

SELECT
    customer.customer_id,
    customer.first_name customer_first_name,
    customer.last_name  customer_last_name,
    customer.email,
    staff.first_name    staff_first_name,
    staff.last_name     staff_last_name,
    amount,
    payment_date
    FROM
        customer
            JOIN payment ON payment.customer_id = customer.customer_id
            JOIN staff ON payment.staff_id = staff.staff_id;

SELECT
    customer.customer_id,
    customer.first_name customer_first_name,
    customer.last_name  customer_last_name,
    customer.email,
    staff.first_name    staff_first_name,
    staff.last_name     staff_last_name,
    amount,
    payment_date
    FROM
        customer
            JOIN payment USING (customer_id)
            JOIN staff USING (staff_id);

SELECT
    customer.customer_id,
    customer.first_name customer_first_name,
    customer.last_name  customer_last_name,
    customer.email,
    staff.first_name    staff_first_name,
    staff.last_name     staff_last_name,
    amount,
    payment_date
    FROM
        customer,
        payment,
        staff
    WHERE
          payment.customer_id = customer.customer_id
      AND payment.staff_id = staff.staff_id;