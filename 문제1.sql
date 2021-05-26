SELECT * FROM employees;

SELECT * FROM jobs;

-- employees의 직원들이 자신이 받을 수 있는 월급 범위내에서 
-- 몇 퍼센트 수준의 월급을 받고 있는지 조회해 보세요 (커미션 포함)
COMMIT;
ALTER TABLE employees ADD (salary_percent VARCHAR2(20));

