/*
    # ������ ���Ἲ
    
     - �����Ϳ��� ������ ����� �Ѵٴ� ��
     - ��ü ���Ἲ, ���� ���Ἲ, ������ ���Ἲ :
     
     
    # ��ü ���Ἲ
     - ���̺��� �����ʹ� �ݵ�� �� ���� ������ �� �־�� �Ѵ�
     - ��ü ���Ἲ�� ��Ű�� ���� �������� PK�� ����Ѵ�
    
    # ���� ���Ἲ
    
     - ���� ���迡 �ִ� �����ʹ� �׻� �ϰ��� ���� ������ �Ѵ�
     (employees�� department_id�� departments�� departments_id�� �����ϴ� ���� ����ؾ� �Ѵ�)
     - ���� ���Ἲ�� ��Ű�� ���� ���� �������� FK�� ����Ѵ�
    
    # ������ ���Ἲ
    
     - �ش� �÷��� �����ϴ� �����ε��� �׻� Ÿ���� �����ؾ� �Ѵ�
     - ���̺��� �÷� Ÿ�� ���� �� CHECK�� ���ؼ� ������ ���Ἲ�� ��Ű���ִ�
    
    # ������ ���Ἲ ���� ����
    
     - NOT NULL : �ش� �÷��� NULL�� ������� �ʴ� ��Ģ
     - UNIQUE : �ش� �÷��� �ߺ��Ǵ� ���� ������� �ʴ� ��Ģ, �׻� ������ ���� ������ �Ѵ�.
     - PRIMARY KEY: �ش� �÷��� �⺻Ű�� �����Ѵ�. NOT NULL + UNIQUE. ���̺� �� �ϳ��� ���� ����.
     - FOREIGN KEY : �ش� �÷��� �ܷ�Ű�� �����Ѵ�
     - CHECK : ���ϴ� �������� ������ ���� �����Ͽ� ������ ���Ἲ�� ������ �� �ִ�
     
*/

-- # �������� ������ ��ųʸ��� ���� ���� ������ ��� �������ǵ��� Ȯ���� �� �ִ�


SELECT * FROM all_constraints; -- ���� �������� �� �� �ִ� ��� ��������

/*
    # �������� ���̺� CONSTRAINT_TYPE
     P : Primary key
     F : Foreign key
     C : CHECK / NOT NULL
     U : UNIQUE
*/

CREATE TABLE fruits (
    fid NUMBER(2) PRIMARY KEY,
    fname VARCHAR2(20) NOT NULL
);




-- UNIQUE
ALTER TABLE fruits MODIFY (fname VARCHAR(20) UNIQUE);
-- CHECK() ���ο� ���ϴ� ������ �߰�
ALTER TABLE fruits ADD (fcolor VARCHAR(20) CHECK(fcolor IN ('RED', 'GREEN', 'BLUE'))); -- CHECK() ���ο� ���ϴ� ������ �߰�

INSERT INTO fruits VALUES(2, 'Apple', 'RED');
INSERT INTO fruits VALUES(3, 'Banana', 'BLUE');

-- ���̺� �����ϴ� �����ϴ� �������� �����ϱ�

ALTER TABLE fruits DROP CONSTRAINT SYS_C007854; 
ALTER TABLE fruits DROP CONSTRAINT SYS_C007852; 

/*
    # ���̺� �̹� �����ϴ� �÷��� �������� �߰��ϱ�
     - ALTER TABLE ���̺� �� ADD CONSTRAINT �������Ǹ� ��������(����� �÷�);
     - ALTER TABLE ���̺� �� MODIFY �÷��� (���� ����);
*/

ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY (fid);

SELECT * FROM user_constraints; -- ���� ������ ���� ����
SELECT * FROM all_constraints; -- ���� ������ ���� ����

UPDATE fruits SET fcolor = 'Yellow' WHERE fname = 'Banana';

DESC fruits;

SELECT * FROM fruits;

-- �� �������� �̸��� �ڵ������Ǵ� �̸����� ���� ������ �� �ִ� ���� ���� �̸����� �����ؾ� �Ѵ�
INSERT INTO fruits VALUES(1, 'Orange', 'Orange');

/*
    # ���������� �߰��ϴ� ���
    
     1. ���̺� ������ ���ÿ� �߰��ϱ�
     
     - �÷��� �÷�Ÿ�� CONSTRAINT �������Ǹ� ��������Ÿ��
     - �ݵ�� �������� �̸��� �� ��Ģ�� �°� ����������
     
     2. ���̺��� ���� �� �������� �߰��ϱ�
    

*/

CREATE TABLE fruits2 (
    fid         NUMBER(4)
        CONSTRAINT FRUITS2_FID_PK PRIMARY KEY,
    fname       VARCHAR2(20)
        CONSTRAINT  FRUITS2_FNAME_NN NOT NULL
        CONSTRAINT  FRUITS2_FNAME_UK UNIQUE,
    fcolor      VARCHAR2(10)
        CONSTRAINT  FRUITS2_COLOR_NN NOT NULL,
    fsize       CHAR(1)
        CONSTRAINT FRUITS2_FSIZE_CHK CHECK (fsize IN ('L', 'N', 'S'))
);

DESC fruits2;

CREATE TABLE fruits3 (
    fid         NUMBER(4),
    fname       VARCHAR2(20),
    fcolor      VARCHAR2(10),
    fsize       CHAR(1)
);

-- NOT NULL�� CHECK�� ADD CONSTRAINT ��� MODIFY�� �̿��� �߰������Ѵ�
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FID_PK PRIMARY KEY (fid);
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FNAME_UK UNIQUE (fname);
ALTER TABLE fruits3 MODIFY (fname VARCHAR2(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fcolor VARCHAR2(10) CONSTRAINT FRUITS3_FCOLOR_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fsize CHAR(1) CONSTRAINT FRUITS3_FSIZE_CHK CHECK (fsize IN ('L', 'N', 'S')));

SELECT * FROM user_constraints; -- ���� ������ ���� ����

/*
    # default ���� ����
    
     - �ش� �÷��� �⺻���� �����س��� ��������
     - default�� ������ �÷��� �� �߰��� ���� ���� ������ 
       null ��� default�� ������ ���� �߰��ȴ�
*/

ALTER TABLE fruits3 ADD (fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits3 MODIFY (fprice NUMBER(7) DEFAULT 10);

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';
DESC fruits3;

/*
    # Foreign Key ��������
    
     - ���������� ������ �� � ���̺��� � �÷��� �������� �ݵ�� �����ؾ� �Ѵ�
     - �ٸ� ���̺��� PK�Ǵ� UK���������� �ɸ� �÷��� ������ �� �ִ�
*/

CREATE TABLE fruit_locations(
  lid NUMBER(2),
  addr VARCHAR2(200),
  city VARCHAR2(40)
);

INSERT INTO fruit_locations VALUES(10, '��û�ϵ� û�ֽ�', 'û��');
INSERT INTO fruit_locations VALUES(20, '���ϵ� �ȵ���', '�ȵ�');
INSERT INTO fruit_locations VALUES(30, '���󳲵� ���ﱺ', '����');
INSERT INTO fruit_locations VALUES(40, '��û���� ����', '���');

SELECT * FROM fruit_locations;

-- �� UNIQUE �Ǵ� PRIMARY KEY ���� ������ �ɸ��� ���� �÷��� �ܷ�Ű�� ������ �� ����
-- ADD�� MODIFY�� �ٲٸ� �̹� �����ȰͿ� �ܷ�Ű�� ������ �� �ִ�.

ALTER TABLE fruit_locations ADD CONSTRAINT FLO_LID_UK UNIQUE(lid);
ALTER TABLE fruits3 ADD (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));

SELECT * FROM user_constraints WHERE constraint_name LIKE 'FRUITS3%';

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'RED', 'L', 10);
INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(2, 'Banana', 'Yellow', 'N', 20);

purge recyclebin;

SELECT * FROM fruits3 INNER JOIN fruit_locations USING (lid);

/*
    # �������� �߰��ϴ� ���3 (���̺� ������ �߰��ϱ�)
     
     - �÷��� ��� ������ CREATE TABLE�� �� �ڿ� ���� ���������� �����ϴ� ���
     - DEFAULT�� NOT NULL�� ���̺� �������� ������ �� ����
*/

CREATE TABLE fruits5 (
    fid     NUMBER(4),
    fname   VARCHAR2(20)  CONSTRAINT F4_FNAME_NN NOT NULL,
    fcolor  VARCHAR2(10)  CONSTRAINT F4_FCOLOR_NN NOT NULL,
    fsize   CHAR(1),
    fprice  NUMBER(7) DEFAULT 123,
    lid NUMBER(2),
    CONSTRAINT F4_FID_PK PRIMARY KEY (fid),
    CONSTRAINT F4_FNAME_UK UNIQUE (fname),
    CONSTRAINT F4_FSIZE_CHK CHECK (fsize IN ('L', 'N', 'S')),
    CONSTRAINT F4_LID_FK FOREIGN KEY (lid) REFERENCES fruit_locations (lid)
);

SELECT * FROM user_constraints WHERE table_name = 'FRUITS5';

/*
     # 1:N���踦 ������ �� ���̺��� ������ �� �����غ�����
     
         �� ���±��� ��� ��� ���������� �ּ� �ѹ��̻� ����� ��, �� ���̺� ������ 3���� �־��

*/



CREATE TABLE market (
    product_id     NUMBER(4)
        CONSTRAINT MARKET_PRODUCT_ID_PK PRIMARY KEY,
    product_name       VARCHAR2(20)
        CONSTRAINT  MARKET_PRODUCT_NAME_NN NOT NULL
        CONSTRAINT  MARKET_PRODUCT_NAME_UN UNIQUE,
    product_price     VARCHAR2(10)
        CONSTRAINT  MARKET_PRODUCT_PRICE_NN NOT NULL,
    product_kind     VARCHAR2(10)
        CONSTRAINT MARKET_PRODUCT_KIND_CK CHECK (product_kind IN ('����', '���', '������ǰ', '�Ｎ��ǰ', '����', '��' )),
    proudct_origin NUMBER(2)    
);

ALTER TABLE market MODIFY (product_name varchar2(30));
ALTER TABLE market MODIFY (product_kind varchar2(12));


INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(1, '���������100g', '2400', '����', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(2, '���Ի���100g', '2000', '����', 2);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(3, '�Ҽ���', '3000', '����', 3);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(4, '����', '7000', '���', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(5, '�Ҵߺ�����', '1500', '�Ｎ��ǰ', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(6, '���ð�', '3000', '�Ｎ��ǰ', 6);

CREATE TABLE proudct_origin (
    proudct_origin  NUMBER(2)
        CONSTRAINT proudct_origin_proudct_origin_pk PRIMARY KEY,
    country_name    VARCHAR2(20)
        CONSTRAINT proudct_origin_contry_name_nn NOT NULL
        CONSTRAINT proudct_origin_contry_name_un UNIQUE,
    country_city    VARCHAR2(10)
        CONSTRAINT proudct_origin_contry_city_nn NOT NULL
);

INSERT INTO proudct_origin (proudct_origin, country_name, country_city) VALUES(1, 'Korea', 'Seoul');
INSERT INTO proudct_origin (proudct_origin, country_name, country_city) VALUES(2, 'America', 'Texas');
INSERT INTO proudct_origin (proudct_origin, country_name, country_city) VALUES(3, 'Germany', 'Berlin');
INSERT INTO proudct_origin (proudct_origin, country_name, country_city) VALUES(4, 'China', 'Beijing');
INSERT INTO proudct_origin (proudct_origin, country_name, country_city) VALUES(5, 'Japan', 'Tokyo');



ALTER TABLE proudct ADD(stock NUMBER(3));
ALTER TABLE proudct ADD(shelf_life DATE);

UPDATE proudct SET shelf_life = '2021/05/30' WHERE product_name = '���Ի���100g';


SELECT * FROM proudct;

SELECT * FROM proudct_origins;

SELECT * FROM proudct INNER JOIN proudct_origins USING (proudct_origin);


-- �ٸ� ���̺��� FK�� �����Ǵ� ���̺��� ���� �ƹ��������� �����ϸ� ���Ἲ�� ��ĥ ������ ����
SELECT * FROM fruits3;
SELECT * FROM fruit_locations;

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'RED', 'S', 20);

COMMIT;

DELETE FROM fruit_locations;

ROLLBACK;

/*
    # ON DELETE ��������
    
     - FK(�ڽķ��ڵ�)�� �����ϰ� �ִ� �θ� ���ڵ带 �����Ҷ��� ��å�� ������ �� �ִ�.
     - CASCADE, SET NULL, RESTRICT
   
    # ON DELETE CASCADE
    
     - �θ� ���ڵ带 �����ϸ� �ڽ� ���ڵ带 ��� �Բ� �����Ѵ�
    
    # ON DELETE SET NULL
    
     - �θ� ���ڵ带 �����ϸ� �����ϴ� �ڽ� ���ڵ��� ���� null�� �����Ѵ�
    
    # RESTRICT
    
     - �ڽ� ���ڵ尡 ������ �θ� ���ڵ带 ������ �� �����Ѵ�.
     -  ON DELETE�� �������� ������ �ȴ�
*/
-- # CASCADE TEST
SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';

ALTER TABLE fruits3 DROP CONSTRAINT FRUITS3_LDK_FK;

ALTER TABLE fruits3 
    ADD CONSTRAINT fr3_lid_fk FOREIGN KEY ( lid )
        REFERENCES fruit_locations ( lid ) ON DELETE CASCADE;


SELECT * FROM fruits3;
SELECT * FROM fruit_locations;

COMMIT;

DELETE FROM fruit_locations WHERE LID = 10;

ROLLBACK;
-- # SET NULL TEST
ALTER TABLE fruits3 
    ADD CONSTRAINT FRUITS3_LDK_FK FOREIGN KEY ( lid )
        REFERENCES fruit_locations ( lid ) ON DELETE SET NULL;

DELETE FROM fruit_locations WHERE lid = 10;


