SELECT CEIL(
    AVG(salary) - AVG(CAST(REPLACE(salary, '0', '') AS UNSIGNED))
) AS error_amount
from employees
