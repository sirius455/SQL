/*
    # DECODE
    
     - Ư�� �÷��� ���� ���ؼ� �ڵ尪�� ���� �����͸� ã�´�
     - switch case ���� ��Ȱ�� �Ѵ�

*/

SELECT
    *
FROM
    employees;

SELECT
    last_name,
    department_id,
    DECODE(department_id,
    90, 'Executive',
    100, 'Finance',
    60, '�ٺ�',   
    30, 3 + 5
    ) AS department_name
FROM
    employees;
    
    
SELECT
    *
FROM
    employees;
    
/*    
 
  ����1 : ���޿� ���� �޿��� �ٸ��� �λ��Ͽ� ����غ�����    
  IT_PROG : 15% �λ�
  FI_ACCOUNT : 10�ۼ�Ʈ �λ�
  ��� ������ CLERK : 5�ۼ�Ʈ�� �λ�
  
  ������ �޿��� before_slary�� �λ�� �޿��� after_salary�� �̸����Բ� ���
*/   

SELECT
    last_name AS �̸�,
    salary As before_slary,
     DECODE(job_id,
    'IT_PROG', salary * 1.15, 
    'FI_ACCOUNT', salary * 1.1,
    'SH_CLERK', salary * 1.05,
    'ST_CLERK', salary * 1.05, 
    'PU_CLERK', salary * 1.05
    ) AS after_salary
FROM
  employees 
WHERE  
    job_id = 'IT_PROG' 
    OR job_id = 'FI_ACCOUNT' 
    OR job_id LIKE '%_CLERK'; 
    
-- Ǯ��

SELECT
    last_name AS �̸�,
    job_id AS ����,
    salary AS before_slary,
    NVL(
     DECODE(
        job_id,
        'IT_PROG', salary * 1.15, 
        'FI_ACCOUNT', salary * 1.1,
        'SH_CLERK', salary * 1.05,
        'ST_CLERK', salary * 1.05, 
        'PU_CLERK', salary * 1.05
    ), 
     salary
    ) AS after_salary
FROM
  employees;

SELECT
    last_name AS �̸�,
    job_id AS ����,
    salary AS before_slary,
    NVL(
     DECODE(
        job_id,
        'IT_PROG', salary * 1.15, 
        'FI_ACCOUNT', salary * 1.1
    ), salary 
    ) AS after_salary
FROM
  employees 
WHERE
    job_id NOT LIKE '%CLERK%'
UNION
SELECT
    last_name,
    job_id,
    salary    AS before_salary,
    salary * 1.05 AS after_salary
FROM 
    employees
WHERE
    job_id LIKE '%CLERK%';
   
 /*
    DECODE�� �ش� �÷��� ���� ��Ȯ�ϰ� ��ġ�ϴ� ���� �̿��� �� ������
    CASE���� ������ ����� �� �ִ�
 */
 
SELECT
    last_name,
    job_id,
    salary AS before_salary,
    CASE
        WHEN job_id = 'IT_PROG' THEN
            salary * 1.15
        WHEN job_id = 'FI_ACCOUNT' THEN
            salary * 1.1
        WHEN job_id LIKE '%CLERK%' THEN
            salary * 1.05
        ELSE
            salary
    END     AS after_salary      
FROM
    employees;
 
 
 
 
 
 
 
 
 
 
    

