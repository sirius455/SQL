/*
    # ������
    
     - �⺻Ű�� ����ϱ� ���ϵ��� ����� �ڵ� ��ȣ ������
     - user_sequences ������ ��ųʸ��� Ȯ���� �� �ִ�
     
     CREATE SEQUENCE ��������
                        [START WHIT n]   - �������� ���� ��ȣ ����
                        [INCREMENT BY n] - �������� ������ ����
                        [MAXVALUE n | NOMAXVALUE] - �ִ밪 ����
                        [MINVALUE n | NOMAXVALUE] - �ּҰ� ����
                        [CYCLE | NOCYCLE] - �ִ밪�� �������� �� ��ȯ ���� ����
                        [CACHE n | NOCACHE] - �޸𸮻� �̸� �������� �������� ���� ����
*/

-- ������ ������ ��ųʸ�
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

CREATE TABLE sodas (
    pid NUMBER(4) CONSTRAINT SODA_PAD_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL
);

INSERT INTO sodas VALUES(1, '���̴�');
INSERT INTO sodas VALUES(2, 'û���� ���̵�');
INSERT INTO sodas VALUES(3, '�ڸ� ���̵�');

-- 4���� �����ϰ� 1�� �����ϴ� ������ ����
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;

INSERT INTO sodas VALUES(sodas_seq.nextval, '��Ʈ���ڶ�');
INSERT INTO sodas VALUES(sodas_seq.nextval, 'ȯŸ');
INSERT INTO sodas VALUES(sodas_seq.nextval, '��Ű��');
INSERT INTO sodas VALUES(sodas_seq.nextval, '�Ϲٻ�');

DELETE FROM sodas WHERE pid > 3;

CREATE TABLE soda_categories (
    cate_id NUMBER(4),
    cate_name VARCHAR2(40),
    CONSTRAINT SC_ID_PK PRIMARY KEY (cate_id)
);
/*
    sod_categories ���̺��� ����� �������� �����غ�����
    
    1.������ 10������
    2. 10�� ������ ��
    3. CACHE 10���μ���
    4. ��ȯ���� ���� ��
    5. �ִ밪�� 9000
*/

CREATE SEQUENCE soda_categories_seq START WITH 10 INCREMENT BY 10 MAXVALUE 9000 NOCYCLE CACHE 10;

INSERT INTO soda_categories VALUES(10, 'ź��');
INSERT INTO soda_categories VALUES(soda_categories_seq.nextval, '��ź��');

DROP TABLE soda_categories;

-- ���� �� ��° ��ȣ���� ��������� �˰���� �� 
SELECT sodas_seq.currval FROM dual; -- ������.currval

/*
    # ������ ����
        DROP SEQUENCE ��������;
        
    # ������ ����
        ALTER SEQUENCE ������ �� �� ���� �ɼ��� CREATE SEQUENCE�� ����
*/


SELECT * FROM soda_categories;
SELECT * FROM user_sequences;













