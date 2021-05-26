/*
    # ANSI JOIN
    
        - ANSI (American National Standards Institute) : �������� ǥ���� �����ϴ� �ΰ� ��ü
        - �̱� ���� ǥ�� ��ȸ���� ���� ǥ���� ������ JOIN����
        - �ٸ� RDBMS���� �� ������ �����Ѵ�
*/

-- ANSI CROSS JOIN
SELECT
    *
FROM
         employees
    CROSS JOIN departments;
    
-- ANSI INNER JOIN - ���ǿ� �´� �ุ �����ϴ� ����
SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id; 

-- ANSI OUTER JOIN - ���ǿ� ���� �ʴ� �൵ �����ϴ� JOIN, LEFT/RIGHT/FULL�� �����ؾ� �Ѵ�

SELECT
    e1.employee_id,
    e1.first_name,
    e1.manager_id,
    e2.first_name
FROM
    employees  e1
    FULL OUTER JOIN employees  e2 ON e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;
-- LEFT OUTER JOIN : ������ ������ �ƿ��� ����, �� �����ʿ� (+)�� ���ΰͰ� ����
-- RIGHT OUTER JOIN : ���������� ������ �ƿ��� ����, �� ���ʿ� (+)�� ���ΰͰ� ����
-- FULL OUTER JOIN : ������ ������ �ƿ��� ����, �� ���ʿ� (+)�� ���ΰͰ� ����

-- JOIN ���ǿ� �̿�Ǵ� �÷����� ���� ��� USING�� �̿��� �������� ����ȭ �� �� �ִ�
SELECT
    first_name,
    department_id,
    department_name,
    job_id,
    job_title,
    location_id,
    city
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN jobs USING ( job_id )
    RIGHT OUTER JOIN locations USING ( location_id );


-- ANSI JOIN�� ����ϸ� ���� ���ǰ� WHERE �������� �����Ͽ� ����� �� �ְ�
-- USING�� ���� �÷��� ��� ���̺��� �÷����� ����� �ʿ䰡 ��������


 --���� 1 : first_name�� valli �� ����� ���/Ǯ����/�μ���

SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    employees.first_name = 'Valli';
    
 -- ���� 2 : job_id�� IT_PROG�� ������� �̸�/�μ���ȣ/�μ����� ��ȸ�غ�����

SELECT
    first_name,
    department_id,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    employees.job_id = 'IT_PROG';
 
 -- ���� 3 : �þ�Ʋ���� �ٹ��ϴ� ��� ����� �̸��� ��å�� �޿��� ����غ�����
 -- * ���̺� ���� ���� ����ؾ� �ϴ� ��� ��Ī�� ����� �� �ִ�.

SELECT
    first_name,
    job_id,
    salary
FROM
         employees e
    INNER JOIN departments  d USING ( department_id )
    INNER JOIN locations    l USING ( location_id )
WHERE
    city = 'Seattle'
ORDER BY
    first_name;

-- ����4 : �����/�μ���ȣ/�μ��̸��� ����ϵ� ����� �Ѹ� ������ ���� �μ��� ��ȸ�غ�����

SELECT
    first_name,
    department_id,
    department_name
FROM
    employees    e
    RIGHT OUTER JOIN departments  d USING ( department_id )
ORDER BY
    first_name;

--����5 : �μ���/�ּ�/���ø��� ����ϵ� �Ҽӵ� �μ��� ���� ���õ� �Բ� ��ȸ�غ�����

SELECT
    department_name,
    street_address,
    city
FROM
    departments  d
    RIGHT OUTER JOIN locations    l USING ( location_id )
ORDER BY
    d.department_name;