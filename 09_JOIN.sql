/*
    # 기본키 (primary key, pk)
    
     - 테이블에서 하나의 행을 유일하게 구분할 수 있는 컬럼
     - 한 테이블 당 하나밖에 설정할 수 없다
     - 기본키가 될수 있는 컬럼이지만 기본키로 설정되지 않는 컬럼은 '후보키 (Candidatekey)'라고 한다
     - 기본키 컬럼에는 중복된 값이 없어야 하고 null(빈값) 도 없어야한다
     
     # 외래키 (Foreign Key, FK)
     
      - 다른 테이블에서는 기본키 또는 후보키이지만 해당테이블에서는 중복되는 값인 컬럼
      ex : employees의 department_id는 departments의 기본키이고, employees에 가져와서 활용되고 있다
      - 외래키가 설정된 테이블 간에는 관계가 형성된다
      - 외래키로 설정된 컬럼은 반드시 참조하는 테이블의 기본키로 존재하는 값만 추가할 수 있다
*/

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM jobs;

SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees;


SELECT * FROM departments;
    
 /*
  * 실생활에서 1:N으로 설정할수 있는 사례를 생각해보세요
  
   팀과 소속선수, 수상생과 담당 상담원, 소대장과 분대원. 제품과 제조회사 
 */
 
 /*
    # 테이블 JOIN
    
     - 기본키와 외래키로 관계가 형성되어 있는 테이블들의 정보를 종합하여 조회하는 것
     
    # CROSS JOIN
    
     - 조인에 사용되는 테이블들의 데이터를 조합하여 나올 수 있는 모든 경우를 출력하는 조인 
     - 그냥 모든 경우를 출력하는 쓸모없는 정보

 */



SELECT employee_id, first_name, department_name FROM employees, departments; 
 
 

SELECT * FROM departments; -- 107 rows
SELECT * FROM employees; -- 27 rows
SELECT * FROM employees, departments; -- 107 * 27 rows
 
/*
    # EQUI JOIN
    
        - 두 테이블 간에 서로 동일한 값을 지닌 컬럼(기본키와 외래키)을 이용하여 
          CROSS JOIN의 결과에서 의미있는 데이터만 걸러내는 JOIN
*/
 
 
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id;
 
 --연습 1 : first_name이 valli 인 사람이 사번/풀네임/부서명
 
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees,
    departments
WHERE
        employees.first_name = 'Valli'
    AND employees.department_id = departments.department_id; 
 
 -- 연습 2 : job_id가 IT_PROG인 사원들의 이름/부서번호/부서명을 조회해보세요
 
SELECT
    first_name,
    last_name,
    employees.department_id,
    department_name
FROM
    employees,
    departments
WHERE
        employees.job_id = 'IT_PROG'
    AND employees.department_id = departments.department_id;
 
 -- 연슨 3 : 시애틀에서 근무하는 모든 사원의 이름과 직책과 급여를 출력해보세요
 -- * 테이블 명을 자주 사용해야 하는 경우 별칭을 사용할 수 있다.
SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees e,
    departments d,
    locations i
WHERE
        city = 'Seattle'
    AND d.location_id = i.location_id
    AND e.department_id = d.department_id;
 
SELECT * FROM departments;
 
SELECT * FROM locations;
  
SELECT * FROM employees;

SELECT * FROM countries;

SELECT * FROM regions;

SELECT * FROM job_history;

SELECT * FROM jobs;


/*
    # SELF JOIN
        - 하나의 테이블 내에서 자기 자신과 JOIN하여 원하는 데이터를 얻어내는 조인 방식
        - 

*/

SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "MANAGER_NAME"
FROM
    employees e1, employees e2 -- SELF JOIN은 테이블 별칭을 사용할 수 밖에 없다
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;
    
-- 연습 1 : 매니저 이름이 Nancy인 사원들의 사번과 이름과 job_title을 조회해보세요

SELECT
    e1.employee_id,
    e1.first_name,
    j.job_title
FROM
    employees e1, employees e2, jobs j
WHERE
     e1.manager_id = e2.employee_id
     AND e1.job_id = j.job_id
     AND e2.first_name = 'Nancy';
     

-- 연습 2번 : Curtis와 동일한 직책을 가진 사원들의 모든 정보를 조회해보세요

SELECT * FROM
    employees e1, employees e2, jobs j
WHERE
     e1.manager_id = e2.employee_id
     AND e1.job_id = j.job_id
     AND e2.first_name = 'Nancy';

SELECT * FROM employees;

SELECT * FROM jobs;