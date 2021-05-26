/*
    # Ʈ������ (Transaction)
    
     - ������ ó���� �� ����
     - �ϳ��� ������ �۾��� �����ϰ� ������ �� �� ������ ����
     - ex : �۱� Ʈ�����
         
         1. ������ ����� ���忡�� ���� �پ���
         2. �޴� ����� ������ ���� �þ��
     - �ϳ��� Ʈ������� ���� ��ɾ��� �����̴�
     - �ϳ��� Ʈ������� ��� ������ ���������� �Ϸ�Ǵ� ��쿡�� ���� ������ Ȯ�����´� (all or nothing)
     - Ʈ������� �����ϰ� ���� ���Ǵ� TCL �δ� COMMIT, ROLLBACK, SAVEPOINT���� �ִ�
     - Ʈ������� ���������� ����� Ŀ��(�Ǵ� �ѹ�)���� ����
       ���ο� Ŀ���� �����ϴ� �������� �����ϴ� ��� DML�� �ǹ��Ѵ�
       
       COMMIT -> INSERT1 -> INSERT2 -> UPDATE -> CREATE TABLE -> DELETE1 -> �����߻�(ROLLBACK) -> COMMIT
       (DB�� ������ ��ü�� Ʈ������� ���� ����� �ƴϴ�)
*/
COMMIT;



 
-- ���̺��� ��� ������ �ڸ���. DROP TABLE�� �ٸ��� ������ �����.
-- CREAT TABLE, DROP TABLE, TRUNCATE TABLE ���� DDL�� Ʈ��������� ������ �� ����
TRUNCATE TABLE coffees;

-- ����1 : coffees ���̺� ���ϴ� ���ο� �÷��� �߰��غ�����

ALTER TABLE coffees ADD (cup_size VARCHAR2(10));
ALTER TABLE coffees ADD (bitter CHAR(5));
ALTER TABLE coffees MODIFY (bitter CHAR(15));
-- ����2 : �÷��� �̸��� �� �� �����غ�����
ALTER TABLE coffees RENAME COLUMN coffee_id TO menu;
ALTER TABLE coffees RENAME COLUMN cname TO menu_name;
ALTER TABLE coffees RENAME COLUMN menu TO coffee_id;
ALTER TABLE coffees RENAME COLUMN menu_name TO cname;

ALTER TABLE coffees DROP COLUMN cup_size;
-- ����2 : INSERT���� ����� ����� �� �޴��� 5�� �̻� �־����

INSERT INTO coffees VALUES(1, '�Ƹ޸�ī��', 2000, 'small');
INSERT INTO coffees VALUES(2, '�Ƹ޸�ī��', 2000, 'large');
INSERT INTO coffees VALUES(3, 'ī���', 2500, 'small');
INSERT INTO coffees VALUES(4, 'ī���', 2500, 'large');
INSERT INTO coffees VALUES(5, 'īǪġ��', 2500, 'small');
INSERT INTO coffees VALUES(6, 'īǪġ��', 2500, 'large');
INSERT INTO coffees VALUES(7, 'ļ��Ḷ���ƶ�', 3000, 'small');
INSERT INTO coffees VALUES(8, 'ļ��Ḷ���ƶ�', 3000, 'large');
INSERT INTO coffees VALUES(9, '��ũ����������ġ��', 3500, 'small');
INSERT INTO coffees VALUES(10, '��ũ����������ġ��', 3500, 'large');
INSERT INTO coffees VALUES(11, '���Ƽ', 2800, 'small');
INSERT INTO coffees VALUES(12, '���Ƽ', 2800, 'large');

UPDATE coffees SET price = price + 500 WHERE cup_size LIKE 'large';
DELETE FROM coffees WHERE price LIKE '%00';


INSERT INTO coffees(coffee_id, cname, price) VALUES(1, '�Ƹ޸�ī��', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(2, '���̽� �Ƹ޸�ī��', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(3, 'ī���', 3000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(4, '���ν����', 8000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(5, 'īǪġ��', 6500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(6, 'ī�� �񿣳�', 7000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(7, '����������', 1500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(8, '�ݵ� ���', 5000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(9, '���������� ���ĳ�', 5000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(10, 'ī�����', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(11, 'īǪġ��', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(12, '��� �����', 7500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(13, 'ũ�������Ƹ�� ���', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(14, '��ī����Ĩ ��Ű', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(15, '��������Ĩ ��Ű', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(16, 'ġ�� ����ũ', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(17, '���ڹ��� ����ũ', 4500);

UPDATE coffees SET bitter = '�ڡڡڡ١�';


COMMIT;

-- INSERT, UPDATE, DELETE�� DML�̱� ������ ROLLBACK���� �ǵ������ִ�
INSERT INTO coffees VALUES(18, '������', 8000, null);

SAVEPOINT save01;

DELETE FROM coffees WHERE coffee_id BETWEEN 3 AND 10;

SAVEPOINT save02;

UPDATE coffees SET cname = replace(cname, '�Ƹ޸�', '��Ż��');
SAVEPOINT  save03;

ROLLBACK TO save01;
ROLLBACK TO save02; 
ROLLBACK TO save03;
ROLLBACK;
-- save01�� ���ư��� save02�� ���� �����̹Ƿ� ���߿� ������ ���̺� ����Ʈ�δ� ���ư� �� ����.

SELECT * FROM coffees;






