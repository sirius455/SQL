/*
    # 엔티티간의 다대다 관계가 발생하는 경우에 대하여
    
     - 두 개의 1:다 관계를 만들어 해결한다 (성능이 매우 저하된다)
     
    메뉴   손님                 메뉴      주문      손님
                                PK          FK  FK  PK
    짜장면 A                   짜장면     짜장면 A   A
    짬뽕   B              =>   짬뽕       짬뽕   A   B
    탕수육 C                   탕수육     탕수육 A   C
    짬뽕밥 D                   짬뽕밥     짜장   B   D
           E                              짬뽕   B   E
                                          탕짜면 C                                  

    2. 그냥 포기하고 한 테이블에 다 적는다 (성능이 떨어지지 않는다. 물리적 용량을 많이 차지한다)

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

INSERT INTO menu VALUES(1, '짜장면', '5000');
INSERT INTO menu VALUES(2, '짬뽕', '5500');
INSERT INTO menu VALUES(3, '탕수육', '13000');
INSERT INTO menu VALUES(4, '코스정식A', '100000', 4);
ALTER TABLE menu ADD(menu_num NUMBER(4));

UPDATE menu SET MENU_NUM = 1;
UPDATE menu SET MENU_NUM = 3 WHERE menu_name = '탕수육';

ALTER TABLE menu MODIFY(menu_price NUMBER(7));
UPDATE menu SET menu_price =  0;
ALTER TABLE menu DROP COLUMN menu_price;
ALTER TABLE menu ADD(menu_price NUMBER(7));

UPDATE menu SET menu_price = 100000 WHERE menu_name = '코스정식A';

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


INSERT INTO order_nums VALUES(1, '짜장면', '1');
INSERT INTO order_nums VALUES(2, '짬뽕', '1');
INSERT INTO order_nums VALUES(3, '탕수육', '2');
INSERT INTO order_nums VALUES(4, '짬뽕', '2');
INSERT INTO order_nums VALUES(5, '짜장면', '3');
INSERT INTO order_nums VALUES(6, '짜장면', '4');
INSERT INTO order_nums VALUES(7, '코스정식A', '3');

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

INSERT INTO customers VALUES(1, '홍길동', 100000);
INSERT INTO customers VALUES(2, '이순신', 999999);
INSERT INTO customers VALUES(3, '신사임당', 5000);

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

-- A씨가 시킨 모든 메뉴를 조회

SELECT 
    o.menu_name
FROM
    order_nums o,
    customers c,
    menu m
WHERE   
    c.customer_name = '홍길동'
    and  o.customer_id = c.customer_id
    and  m.menu_name = o.menu_name;
-- B씨가 시킨 모든 메뉴의 총합을 조회

SELECT 
   c.customer_name, SUM(m.menu_price)
FROM
    order_nums o,
    customers c,
    menu m
WHERE   
    c.customer_name = '이순신'
    and  o.customer_id = c.customer_id
    and  m.menu_name = o.menu_name
GROUP BY c.customer_name;

-- 시킨 메뉴의 총합이 한도를 넘는 손님들의 정보를 조회

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





