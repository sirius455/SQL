/*
    # DECODE
    
     - 특정 컬럼의 값을 정해서 코드값을 통해 데이터를 찾는다
     - switch case 같은 역활을 한다

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
    60, '바보',   
    30, 3 + 5
    ) AS department_name
FROM
    employees;
    
    
SELECT
    *
FROM
    employees;
    
/*    
 
  연습1 : 직급에 따라 급여를 다르게 인상하여 출력해보세요    
  IT_PROG : 15% 인상
  FI_ACCOUNT : 10퍼센트 인상
  모든 종류의 CLERK : 5퍼센트의 인상
  
  원래의 급여는 before_slary로 인상된 급여는 after_salary로 이름과함께 출력
*/   

SELECT
    last_name AS 이름,
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
    
-- 풀이

SELECT
    last_name AS 이름,
    job_id AS 직업,
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
    last_name AS 이름,
    job_id AS 직업,
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
    DECODE는 해당 컬럼의 값과 정확하게 일치하는 값만 이용할 수 있지만
    CASE문은 조건을 사용할 수 있다
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
 
 
 
 
 
 
 
 
 
 
    

