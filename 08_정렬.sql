/*
    # ORDER BY절
    
        - 원하는 컬럼 기준으로 정렬하여 조회 할 수 있다
        - ORDER BY 컬럼명 [ASC/DESC]
        - ASC : ASCENDING, 오름차순 (생략가능)
        - DESC: DESCENDING, 내림차순

*/


SELECT * FROM employees; -- 기본적으로는 PK 순서로 조회된다

SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary ASC; 

SELECT * FROM employees ORDER BY salary;

/* 
    해당 컬럼에 null이 포함되어 있는 경우
    오름차순으로 조회하면 가장 나중에 등장하고 
    내림차순으로 조회하면 가장 먼저 등장한다
*/
SELECT * FROM employees ORDER BY commission_pct DESC; 
SELECT * FROM employees ORDER BY commission_pct ASC;

-- 여러개의 정렬 기준을 적용할 수 있다 (먼저 직급순으로 오름차순 정렬 후, 직급이 같다면 이름 내림차순 정렬)
SELECT * FROM employees ORDER BY job_id DESC; 
SELECT * FROM employees ORDER BY job_id ASC, first_name DESC; 

-- 연습 1 : 모든 사원들을 부서번호 기준 오름차순으로 조회해보세요
SELECT * FROM employees ORDER BY department_id ASC; 
-- 연습 2 : 모든 사원들을 최근 입사한 순서대로 조회해보세요 
SELECT * FROM employees ORDER BY hire_date DESC; 
-- 연습 3 : 이름에 i가 포합되어있는 사원들을 돈을 가장 많이 받는 순서대로 조회해보세요
SELECT * FROM employees WHERE first_name LIKE '%i%' ORDER BY salary * (1 + NVL(commission_pct, 0)) DESC; 
-- 연습 4 : 80번 부서와 50번 부서의 사원들을 부서번호 기준 오름차순으로 조회하고. 
--          부서번호가 같다면 가족 이름 기준으로 알파벳 순으로 조회해주세요
SELECT * FROM employees WHERE department_id IN (80, 50) ORDER BY department_id ASC, last_name ASC; 




