/*
    # ��ƼƼ���� �ٴ�� ���谡 �߻��ϴ� ��쿡 ���Ͽ�
    
     - �� ���� 1:�� ���踦 ����� �ذ��Ѵ� (������ �ſ� ���ϵȴ�)
     
    �޴�   �մ�                 �޴�      �ֹ�      �մ�
                                PK          FK  FK  PK
    ¥��� A                   ¥���     ¥��� A   A
    «��   B              =>   «��       «��   A   B
    ������ C                   ������     ������ A   C
    «�͹� D                   «�͹�     ¥��   B   D
           E                              «��   B   E
                                          ��¥�� C                                  

    2. �׳� �����ϰ� �� ���̺� �� ���´� (������ �������� �ʴ´�. ������ �뷮�� ���� �����Ѵ�)

*/


CREATE TABLE menu (
    menu_id   NUMBER(4)
        CONSTRAINT MENU_MENU_ID_PK PRIMARY KEY,
    menu_name    VARCHAR2(20)
        CONSTRAINT  MENU_MENU_NAME_NN NOT NULL
        CONSTRAINT  MENU_MENU_NAME_UN UNIQUE,
    menu_price     VARCHAR2(10)
        CONSTRAINT  MENU_MENU_PRICE_NN NOT NULL        
);

INSERT INTO menu VALUES(1, '¥���', '5000');
INSERT INTO menu VALUES(2, '«��', '5500');
INSERT INTO menu VALUES(3, '������', '13000');
INSERT INTO menu VALUES(4, '�ڽ�����A', '100000', 4);
ALTER TABLE menu ADD(menu_num NUMBER(4));

UPDATE menu SET MENU_NUM = 1;
UPDATE menu SET MENU_NUM = 3 WHERE menu_name = '������';

ALTER TABLE menu MODIFY(menu_price NUMBER(7));
UPDATE menu SET menu_price =  0;
ALTER TABLE menu DROP COLUMN menu_price;
ALTER TABLE menu ADD(menu_price NUMBER(7));

UPDATE menu SET menu_price = 100000 WHERE menu_name = '�ڽ�����A';

CREATE TABLE order_nums (
    order_num   NUMBER(4)
        CONSTRAINT ORDER_NUMS_ORDER_NUM_PK PRIMARY KEY,
    menu_name    VARCHAR2(20)
        CONSTRAINT   ORDER_NUMS_MENU_NAME_NN NOT NULL,
    customer_id     NUMBER(4)
        CONSTRAINT  ORDER_NUMS_COSTOMER_ID_NN NOT NULL
);

DROP TABLE order_nums;
purge recyclebin;


INSERT INTO order_nums VALUES(1, '¥���', '1');
INSERT INTO order_nums VALUES(2, '«��', '1');
INSERT INTO order_nums VALUES(3, '������', '2');
INSERT INTO order_nums VALUES(4, '«��', '2');
INSERT INTO order_nums VALUES(5, '¥���', '3');
INSERT INTO order_nums VALUES(6, '¥���', '4');
INSERT INTO order_nums VALUES(7, '�ڽ�����A', '3');

DELETE FROM order_nums WHERE customer_id = 4;

ALTER TABLE order_nums MODIFY(customer_name VARCHAR(12));




CREATE TABLE customers (
    customer_id   NUMBER(4)
        CONSTRAINT CUSTOMERS_CUSTOMER_ID_PK PRIMARY KEY,
    customer_name    VARCHAR2(20)
        CONSTRAINT   CUSTOMERS_CUSTOMER_NAME_NN NOT NULL,
    customer_limit     NUMBER(6)
        CONSTRAINT   CUSTOMERS_CUSTOMER_LIMIT_NN NOT NULL
);

INSERT INTO customers VALUES(1, 'ȫ�浿', 100000);
INSERT INTO customers VALUES(2, '�̼���', 999999);
INSERT INTO customers VALUES(3, '�Ż��Ӵ�', 5000);

SELECT * FROM user_constraints WHERE table_name = 'MENU';
ALTER TABLE order_nums MODIFY (menu_name CONSTRAINT ORDER_NUMS_LID_FK REFERENCES menu(menu_name));
ALTER TABLE order_nums MODIFY (customer_id CONSTRAINT CUSTOMER_ID_LID_FK REFERENCES customers(customer_id));

SELECT 
    *
FROM
    order_nums,
    customers,
    menu;
SELECT * FROM menu;
SELECT * FROM order_nums;

-- A���� ��Ų ��� �޴��� ��ȸ

SELECT 
    o.menu_name
FROM
    order_nums o,
    customers c,
    menu m
WHERE   
    c.customer_name = 'ȫ�浿'
    and  o.customer_id = c.customer_id
    and  m.menu_name = o.menu_name;
-- B���� ��Ų ��� �޴��� ������ ��ȸ

SELECT 
   c.customer_name, SUM(m.menu_price)
FROM
    order_nums o,
    customers c,
    menu m
WHERE   
    c.customer_name = '�̼���'
    and  o.customer_id = c.customer_id
    and  m.menu_name = o.menu_name
GROUP BY c.customer_name;

-- ��Ų �޴��� ������ �ѵ��� �Ѵ� �մԵ��� ������ ��ȸ

SELECT
    c.customer_name,
    c.customer_limit,
    m.menu_price
FROM
    order_nums  o,
    customers   c,
    menu        m
WHERE
        o.customer_id = c.customer_id
    AND m.menu_name = o.menu_name
        AND c.customer_limit < (
        SELECT
            SUM(m.menu_price)
        FROM
            order_nums  o,
            customers   c,
            menu        m
        WHERE
            o.customer_id = c.customer_id
            and  m.menu_name = o.menu_name      
    );

SELECT * FROM customers;
SELECT * FROM order_nums;





