/*

    # DML (Data Manipulation Languager, ������ ���۾�) �� BD�� CRUD
    
     - SELECT : ���Ǻ��� ������ ��ȸ
     - INSERT : ���Ǻ��� ������ ����
     - DELETE : ���Ǻ��� ������ ����
     - UPDATE : ���Ǻ��� ������ ����
    
     �� CRUD - Create, Read, Update, Delete, ��� ���α׷����� CRUD�� �پ��� ���·� �����Ѵ�
    
    # DDL (Data Definitaion Language, ������ ���Ǿ�)
    
     - ���̺�, ������, ��, .. �� DB���� ����ϴ� ������Ʈ ������ ������ �� ����ϴ� ��ɾ� 
     - CREATE : DB ������Ʈ ����
     - DROP : DB ������Ʈ ����
     - ALTER : DB ������Ʈ ����
     - TRUNCATE : DB ������Ʈ ���� ����
    
    # DCL (Data Control Language, ������ ���� ��ɾ�)
    
     - BD�� ����ڵ��� �����ϴ� ��ɾ�
     - GRANT : ����ڿ��� ������ �ο�
     - REVOKE : ������� ��ȯ�� ȸ��
   
*/

 -- CREATE TABLE ���̺�� (�÷��̸�1 �÷�Ÿ��1, �÷��̸�, �÷�Ÿ��2 ...);

CREATE TABLE coffees (
    
    coffee_id NUMBER(5),
    cname VARCHAR2(50),
    price NUMBER(5)
); 

DESC coffees;    

--  DROP TABEL ���̺��;
DROP TABLE coffees;

-- ������ ���̺��� �����뿡 ����ִ�
show recyclebin;

SELECT * FROM recyclebin;

-- ������ �����ϱ�
flashback table coffees to before drop;

SELECT * FROM coffees;

-- ������ ����
purge recyclebin;

/*
    
    # ������ ��ųʸ�
     
     - �����Ϳ� ���� ������(��Ÿ ������)
     - BD�� �츮�� �߰��� ���𰡸� �˾Ƽ� �����Ѵ�
     - ���� ���´� BD�� ������ ��ųʸ��� ���ؼ��� �� �� �ִ�
     - ����ڰ� ���� ������ ��ųʸ��� ������ ���� ���� 
     
    # ������ ��ųʸ� ��
    
     - ������ ��ųʸ��� ����ڰ� Ȯ���ϱ� ���� ���·� �����ϴ� ��
     - user_�� ������ �ش� ������ ������ ��ųʸ����� ��Ÿ����
     - all_�� ������ ��� ������ ������ ��ųʸ����� ��Ÿ����
*/

SELECT * FROM user_tables;
SELECT * FROM all_tables; 






















