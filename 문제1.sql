SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    jobs;

-- employees의 직원들이 자신이 받을 수 있는 월급 범위내에서 
-- 몇 퍼센트 수준의 월급을 받고 있는지 조회해 보세요 (커미션 포함)

-- ||을 하면 뒤에 문자를 붙일수 있지만 문자열로 바뀌게 된다.

-- max_salary - min_salary : 더 받을수 있는 최대 금액
-- 아래의 식은 자기가 최소보다 더받을수 있는 금액 / 더받을수있는 최대금액을 나타낸다



SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    TO_CHAR(
    (salary * (1 + NVL(commission_pct, 0)) - min_salary) / (max_salary - min_salary) * 100, 990.99  ) || '%' AS "Salary Percentage"
    
FROM
         employees
    INNER JOIN jobs USING ( job_id )
ORDER BY
    "Salary Percentage" DESC;
    