/*
    # �� (view)
    
     - �������� �⺻ ���̺���� �̿��� ������ ������ ������ ���̺�
     - �⺻ ���̺��� �Ļ��� BD ��ü
     - �並 ���� ����ڰ� �⺻ ���̺��� ���������� ����ϰԲ� �� �� �ִ�
     
     CREATE [OR REPLACE] VIEW ���̸� AS �������� [WITH CHECK OPTON | WITH READ ONLY];
     
      - CREATE OR REPLACE : �̹� �����ϴ� ���� ������ �Ѵ�. ���ٸ� �����Ѵ�
      - WHIT CHECK OPTION : �ش� �並 ���� UPDATE�� INSERT�� ���������� �ش� ���� ������ �����ϴ� DML�� ���������� (�������� DML).
      - WHIT READ ONLY : �ش� ��� SELECT�� ����������(DML ����).

*/

-- �� ������ ��ųʸ�
SELECT * FROM user_views;
SELECT * FROM all_views;    

-- �⺻ �ɼ� ��
CREATE OR REPLACE VIEW dept30_view AS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id =30;
        
SELECT * FROM dept30_view;

-- �⺻ �ɼ� �並 ���ؼ��� �����ο� INSERT�� �����ϴ�. (�����ڰ� INSERT�� ������ �� �ִ�)

SELECT * FROM employees WHERE first_name = 'Gildong';
INSERT INTO dept30_view VALUES(1, 'Gildong', 'Hong', 'GHong', '515.127.4444',  sysdate, 'IT_PROG', 1000, null, 100, 70);

-- �б� ���� ��
CREATE OR REPLACE VIEW dept50_view_readonly AS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id =50
WITH READ ONLY;
        
SELECT * FROM dept50_view_readonly;

-- �б� ���� �並 ���ؼ��� DML �۾��� ������ �� �����ϴ�.
INSERT INTO dept50_view_readonly VALUES(2, 'Heedong', 'Hong', 'HHeedong', '515.127.4445',  sysdate, 'IT_PROG', 1000, null, 100, 70);

SELECT * FROM employees;




CREATE OR REPLACE VIEW dept80_view_check AS
    SELECT
        *
    FROM
        employees
    WHERE
        department_id =80
WITH CHECK OPTION;
        
SELECT * FROM dept80_view_check;

-- 80�� �μ� ����鸸 ��ȸ�ϴ� ���̱� ������, 80�� �μ��� ���õ� DML�� ����� �� �ְ� �ȴ�
INSERT INTO dept80_view_check VALUES(3, 'Heedong', 'Hong', 'HHeedong', '515.127.4445',  sysdate, 'IT_PROG', 1000, null, 100, 70);

-- 80�� �μ����� DML�� �����ϴ� 
INSERT INTO dept80_view_check VALUES(2, 'Heedong', 'Hong', 'HHeedong', '515.127.4445',  sysdate, 'IT_PROG', 1000, null, 100, 80);
-- �� ���� : DROP VIEW

ROLLBACK;







