/*
    # �׷� �Լ�
    
     - ���� ���� ���� Ư�� �÷��� �������� �׷�ȭ �ϴ� �Լ���
     - Ư�� ������ ����, ����, ��� ���� ���� �� �ִ�
     - �׷��� ������ �Ǵ� �÷��� GROUP BY���� ���� �����Ѵ�
     - �׷� �Լ��� ����� �Ϲ� �÷��� �Բ� ��µ� �� ����

*/


SELECT SUM(salary) FROM employees;

--��å�� �� ����
SELECT job_id, SUM(salary) FROM employees GROUP BY job_id;

--��å�� ��� ����
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

-- SUM(column) : �׷캰�� �ش� �÷��� �� ���� ���Ѵ�
SELECT department_id, sum(salary) FROM employees GROUP BY department_id;

--AVG(column) : ���
--MAX(column) : �ִ밪
SELECT department_id, max(salary) FROM employees GROUP BY department_id;

--MIN(column) : �ּҰ�
-- COUNT(column) : ���
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

-- ���� 1 : �μ����� ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ������ִ� �������� �ۼ�
-- ���� 2 : �μ����� ���ʽ��� �޴� ����� �� �μ��� ��� �ִ��� ����� �������� �ۼ�

SELECT
    department_id             AS �μ���ȣ,
    MAX(hire_date)            AS �����ֱٿ��Ի��ѻ��,
    MIN(hire_date)            AS ������������Ի��ѻ��,
    COUNT(commission_pct)     AS ���ʽ��޴��ο���
FROM
    employees
GROUP BY
    department_id;
    
-- ���� 3 : �� ���޺� ��� ������ ���غ����� (�ؿ��� �ƴ�, Ŀ�̼����� �Ҽ��� ��°�ڸ����� ���)
SELECT * FROM employees;

SELECT
    job_id                                                        AS ����,
   TRUNC(AVG((salary * 12) * (1 + NVL(commission_pct, 0))), 2)               AS ���ʽ����뿬��
FROM
    employees
GROUP BY
    job_id;
    
--Ǯ��  

SELECT
    job_id                                                        AS ����,
   TO_CHAR(AVG((salary * 12) * (1 + NVL(commission_pct, 0))), '9999999999999.99')               AS ���ʽ����뿬��
FROM
    employees
GROUP BY
    job_id;
    

-- GROUP BY�� ���� �÷��� ������ ���� �ִ�
SELECT
    job_id,  department_id,
   TO_CHAR(AVG((salary * 12) * (1 + NVL(commission_pct, 0))), '9999999999999.99')               AS ���ʽ����뿬��
FROM
    employees
GROUP BY
    job_id, department_id;  
    
-- GROUP BY�� ������ �׷쿡 ������ �ְ� ���� ���� HAVING���� �̿��Ѵ�

SELECT job_id, count(*) FROM employees GROUP BY job_id;

-- ��WHERE�� �׷��� �����Ǳ� ���� ��� �࿡ �������� �����̴�

SELECT job_id, count(*) FROM employees WHERE salary <= 5000 GROUP BY job_id;

--ȸ�翡 5�� ���Ϲۿ� ���� ��å�� ��� ���
SELECT job_id, count(*) FROM employees GROUP BY job_id HAVING count(*) <= 5;

--ȸ�翡 5�� ���Ϲۿ� ���� ��å�� ��� ���
SELECT job_id, count(*) FROM employees GROUP BY job_id HAVING count(*) <= 3;

-- ���� 1 : �μ��� �ִ� �޿��� �ּұ޿��� ����ϵ� �ִ�޿��� 5000�̻��� �μ��� ����غ�����

SELECT
    department_id             AS �μ�,
    MAX(salary)            AS �ִ�޿�,
    MIN(salary)            AS �ּұ޿�
FROM
    employees
GROUP BY
    department_id HAVING MAX(salary) >= 5000;

-- ���� 2 : �μ��� ��� �޿��� ����ϵ� �ش� �μ��� �Ҽӵ� ����� 10�� �̻��� �μ��� ����غ�����

SELECT
    department_id             AS �μ�,
    TRUNC(AVG(salary) , 2)    AS ��ձ޿�
FROM
    employees
GROUP BY
    department_id HAVING count(*) >= 10;




