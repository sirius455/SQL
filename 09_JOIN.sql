/*
    # �⺻Ű (primary key, pk)
    
     - ���̺��� �ϳ��� ���� �����ϰ� ������ �� �ִ� �÷�
     - �� ���̺� �� �ϳ��ۿ� ������ �� ����
     - �⺻Ű�� �ɼ� �ִ� �÷������� �⺻Ű�� �������� �ʴ� �÷��� '�ĺ�Ű (Candidatekey)'��� �Ѵ�
     - �⺻Ű �÷����� �ߺ��� ���� ����� �ϰ� null(��) �� ������Ѵ�
     
     # �ܷ�Ű (Foreign Key, FK)
     
      - �ٸ� ���̺����� �⺻Ű �Ǵ� �ĺ�Ű������ �ش����̺����� �ߺ��Ǵ� ���� �÷�
      ex : employees�� department_id�� departments�� �⺻Ű�̰�, employees�� �����ͼ� Ȱ��ǰ� �ִ�
      - �ܷ�Ű�� ������ ���̺� ������ ���谡 �����ȴ�
      - �ܷ�Ű�� ������ �÷��� �ݵ�� �����ϴ� ���̺��� �⺻Ű�� �����ϴ� ���� �߰��� �� �ִ�
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
  * �ǻ�Ȱ���� 1:N���� �����Ҽ� �ִ� ��ʸ� �����غ�����
  
   ���� �ҼӼ���, ������� ��� ����, �Ҵ���� �д��. ��ǰ�� ����ȸ�� 
 */
 
 /*
    # ���̺� JOIN
    
     - �⺻Ű�� �ܷ�Ű�� ���谡 �����Ǿ� �ִ� ���̺���� ������ �����Ͽ� ��ȸ�ϴ� ��
     
    # CROSS JOIN
    
     - ���ο� ���Ǵ� ���̺���� �����͸� �����Ͽ� ���� �� �ִ� ��� ��츦 ����ϴ� ���� 
     - �׳� ��� ��츦 ����ϴ� ������� ����

 */



SELECT employee_id, first_name, department_name FROM employees, departments; 
 
 

SELECT * FROM departments; -- 107 rows
SELECT * FROM employees; -- 27 rows
SELECT * FROM employees, departments; -- 107 * 27 rows
 
/*
    # EQUI JOIN
    
        - �� ���̺� ���� ���� ������ ���� ���� �÷�(�⺻Ű�� �ܷ�Ű)�� �̿��Ͽ� 
          CROSS JOIN�� ������� �ǹ��ִ� �����͸� �ɷ����� JOIN
*/
 
 
SELECT * FROM employees, departments WHERE employees.department_id = departments.department_id;
 
 --���� 1 : first_name�� valli �� ����� ���/Ǯ����/�μ���
 
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
 
 -- ���� 2 : job_id�� IT_PROG�� ������� �̸�/�μ���ȣ/�μ����� ��ȸ�غ�����
 
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
 
 -- ���� 3 : �þ�Ʋ���� �ٹ��ϴ� ��� ����� �̸��� ��å�� �޿��� ����غ�����
 -- * ���̺� ���� ���� ����ؾ� �ϴ� ��� ��Ī�� ����� �� �ִ�.
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
        - �ϳ��� ���̺� ������ �ڱ� �ڽŰ� JOIN�Ͽ� ���ϴ� �����͸� ���� ���� ���
        - 

*/

SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "MANAGER_NAME"
FROM
    employees e1, employees e2 -- SELF JOIN�� ���̺� ��Ī�� ����� �� �ۿ� ����
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;
    
-- ���� 1 : �Ŵ��� �̸��� Nancy�� ������� ����� �̸��� job_title�� ��ȸ�غ�����

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
     

-- ���� 2�� : Curtis�� ������ ��å�� ���� ������� ��� ������ ��ȸ�غ�����

SELECT e1.* FROM
    employees e1, employees e2
WHERE
         e2.first_name = 'Curtis'
     AND e2.job_id = e1.job_id;



SELECT * FROM jobs;

/*

    # OUTER JOIN
    
        - JOIN ������ �������� ���ؼ� �������� ���ߴ� ����� Ȯ���� �� ����ϴ� JOIN
        - (+)�� �������� �÷��� null�� �߰��ؼ�, �������� ���ߴ� ����� Ȯ���� �� �ִ�
*/

SELECT
    employee_id,
    first_name,
    e.department_id,
    d.department_id
FROM
    employees    e,
    departments  d
WHERE
    e.department_id = d.department_id(+);

-- ������ ���� �������� ������ (+)�� ���ʿ� ���̴� ��� ��ȸ�Ǵ� �������� �ǹ̿�
-- (+)�� �����ʿ� ���̴� ��� ��ȸ�Ǵ� �������� �ǹ̸� ���� �����Ͻÿ�

SELECT
    e1.manager_id,
    e2.first_name,
    e2.employee_id
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id = e2.employee_id(+);

/*

    ������ (+) :  e1.manager_id�� ������. e2���� ��ġ�ϴ°� ��� ��µ��� ���� ���� ���
      
        = > manager_id�� �߸��� ���. null, �Ŵ����� �������� ���� ���

    ���� (+) : e2.employee_id�� ������. e1���� ��ġ�ϴ°� ��� ��µ��� ���� ���� ���
      
        = > ���������� ���������� ���� ��찡 ��µ�         
        

*/

-- ����1 : �����/�μ���ȣ/�μ��̸��� ����ϵ� ����� �Ѹ� ������ ���� �μ��� ��ȸ�غ�����

SELECT
    first_name,
    e.department_id,
    department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id(+) = d.department_id;

-- ����2 : �����/��åID/��å�� ����ϵ� ����� �Ѹ� ������ ���� ��å�� ��ȸ�غ�����

SELECT
    first_name,
    e.job_id,
    j.job_title
FROM
    employees   e,
    jobs j
WHERE
    e.job_id(+) = j.job_id;

--����3 : �μ���/�ּ�/���ø��� ����ϵ� �Ҽӵ� �μ��� ���� ���õ� �Բ� ��ȸ�غ�����

SELECT
   department_name,
   street_address,
   city
FROM
    departments d,
    locations l
WHERE
   d.location_id(+) = l.location_id
ORDER BY
    department_name DESC;

SELECT * FROM jobs;

SELECT * FROM employees;

SELECT * FROM locations;

SELECT * FROM departments;

SELECT * FROM employees WHERE job_id IS NOT NULL;











