SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    jobs;

-- employees�� �������� �ڽ��� ���� �� �ִ� ���� ���������� 
-- �� �ۼ�Ʈ ������ ������ �ް� �ִ��� ��ȸ�� ������ (Ŀ�̼� ����)

-- ||�� �ϸ� �ڿ� ���ڸ� ���ϼ� ������ ���ڿ��� �ٲ�� �ȴ�.

-- max_salary - min_salary : �� ������ �ִ� �ִ� �ݾ�
-- �Ʒ��� ���� �ڱⰡ �ּҺ��� �������� �ִ� �ݾ� / ���������ִ� �ִ�ݾ��� ��Ÿ����



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
    