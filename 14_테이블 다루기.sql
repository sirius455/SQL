/*
    # ���������� ���̺� �����ϱ�
        CREATE TABLE ���̺�� AS (��������)�� ���̺��� ������ �� �ִ�
    
*/

-- CREATE TABLE ���̺�� AS (��������)�� ���̺��� ������ �� �ִ�
CREATE TABLE coffees2 AS (SELECT * FROM coffees);

DESC coffees2;

CREATE TABLE bingsu3 AS (SELECT * FROM coffees WHERE cname LIKE '%����');

SELECT * FROM bingsu3;



/*
    # ���̺� �� �÷� �߰��ϱ�
     ALTER TABLE ���̺� �� ADD(�÷��� �÷�Ÿ��, ...)
*/

ALTER TABLE bingsu3 ADD (sirup VARCHAR2(20));

/*
    # ���̺��� �÷� �̸� �����ϱ�
    
        ALTER TABLE ���̺�� RENAME COLUMN �����̸� TO �ٲ��̸�;
*/

ALTER TABLE bingsu3 RENAME COLUMN sirup TO syrup;



/*
    # ���̺� �̸� �����ϱ�
        
        RENAME �������̺�� TO �ٲ����̺��;
*/

RENAME bingsu3 TO bingsoo;

/*
    # �÷� Ÿ�� �����ϱ�
        
        ALTER TABLE ���̺�� MODIFY(�÷��� �÷�Ÿ��, ....)
*/

SELECT * FROM bingsoo;

ALTER TABLE bingsoo MODIFY (cname varchar2(54));

UPDATE bingsoo SET cname = '��Ʈ����ī������ξ��ð����������';

INSERT INTO bingsoo VALUES (101, '��Ʈ����ī������ξ��ø������', 7500, '����');

/*
    # �÷� �����ϱ�
        
        ALTER TABLE ���̺�� DROP COLUMN �÷���;
*/

SELECT * FROM bingsoo;

ALTER TABLE bingsoo DROP COLUMN syrup;



















