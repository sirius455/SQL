/*
    # 트랙젝션 (Transaction)
    
     - 데이터 처리의 한 단위
     - 하나의 논리적인 작업이 완전하게 마무리 될 때 까지의 절차
     - ex : 송금 트랙잭션
         
         1. 보내는 사람의 등장에서 돈이 줄어든다
         2. 받는 사람의 통장의 돈이 늘어난다
     - 하나의 트랙잭션은 여러 명령어의 집합이다
     - 하나의 트랙잭션의 모든 과정이 정상적으로 완료되는 경우에만 변경 사항을 확정짓는다 (all or nothing)
     - 트랜잭션을 관리하게 위해 사용되는 TCL 로는 COMMIT, ROLLBACK, SAVEPOINT등이 있다
     - 트랜잭션은 마지막으로 실행된 커밋(또는 롤백)이후 부터
       새로운 커밋을 실행하는 시점까지 수행하는 모든 DML을 의미한다
       
       COMMIT -> INSERT1 -> INSERT2 -> UPDATE -> CREATE TABLE -> DELETE1 -> 문제발생(ROLLBACK) -> COMMIT
       (DB의 데이터 객체는 트랜잭션의 관리 대상이 아니다)
*/
COMMIT;



 
-- 테이블의 모든 내용을 자른다. DROP TABLE과 다르게 구조는 남긴다.
-- CREAT TABLE, DROP TABLE, TRUNCATE TABLE 등의 DDL은 트랙잭션으로 관리할 수 없다
TRUNCATE TABLE coffees;

-- 연습1 : coffees 테이블에 원하는 새로운 컬럼을 추가해보세요

ALTER TABLE coffees ADD (cup_size VARCHAR2(10));
ALTER TABLE coffees ADD (bitter CHAR(5));
ALTER TABLE coffees MODIFY (bitter CHAR(15));
-- 연습2 : 컬럼의 이름도 몇 개 변경해보세요
ALTER TABLE coffees RENAME COLUMN coffee_id TO menu;
ALTER TABLE coffees RENAME COLUMN cname TO menu_name;
ALTER TABLE coffees RENAME COLUMN menu TO coffee_id;
ALTER TABLE coffees RENAME COLUMN menu_name TO cname;

ALTER TABLE coffees DROP COLUMN cup_size;
-- 연습2 : INSERT문을 사용해 제대로 된 메뉴를 5개 이상 넣어보세요

INSERT INTO coffees VALUES(1, '아메리카노', 2000, 'small');
INSERT INTO coffees VALUES(2, '아메리카노', 2000, 'large');
INSERT INTO coffees VALUES(3, '카페라떼', 2500, 'small');
INSERT INTO coffees VALUES(4, '카페라떼', 2500, 'large');
INSERT INTO coffees VALUES(5, '카푸치노', 2500, 'small');
INSERT INTO coffees VALUES(6, '카푸치노', 2500, 'large');
INSERT INTO coffees VALUES(7, '캬라멜마끼아또', 3000, 'small');
INSERT INTO coffees VALUES(8, '캬라멜마끼아또', 3000, 'large');
INSERT INTO coffees VALUES(9, '다크초코프라프치노', 3500, 'small');
INSERT INTO coffees VALUES(10, '다크초코프라프치노', 3500, 'large');
INSERT INTO coffees VALUES(11, '허브티', 2800, 'small');
INSERT INTO coffees VALUES(12, '허브티', 2800, 'large');

UPDATE coffees SET price = price + 500 WHERE cup_size LIKE 'large';
DELETE FROM coffees WHERE price LIKE '%00';


INSERT INTO coffees(coffee_id, cname, price) VALUES(1, '아메리카노', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(2, '아이스 아메리카노', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(3, '카페라떼', 3000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(4, '아인슈페너', 8000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(5, '카푸치노', 6500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(6, '카페 비엔나', 7000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(7, '에스프레소', 1500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(8, '콜드 브루', 5000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(9, '에스프레소 콘파나', 5000);
INSERT INTO coffees(coffee_id, cname, price) VALUES(10, '카페오레', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(11, '카푸치노', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(12, '비너 멜랑쉬', 7500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(13, '크랜베리아몬드 쿠기', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(14, '모카초코칩 쿠키', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(15, '더블초코칩 쿠키', 3500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(16, '치즈 케이크', 4500);
INSERT INTO coffees(coffee_id, cname, price) VALUES(17, '초코무스 케이크', 4500);

UPDATE coffees SET bitter = '★★★☆☆';


COMMIT;

-- INSERT, UPDATE, DELETE는 DML이기 때문에 ROLLBACK으로 되돌릴수있다
INSERT INTO coffees VALUES(18, '감자탕', 8000, null);

SAVEPOINT save01;

DELETE FROM coffees WHERE coffee_id BETWEEN 3 AND 10;

SAVEPOINT save02;

UPDATE coffees SET cname = replace(cname, '아메리', '이탈리');
SAVEPOINT  save03;

ROLLBACK TO save01;
ROLLBACK TO save02; 
ROLLBACK TO save03;
ROLLBACK;
-- save01로 돌아가면 save02는 없는 상태이므로 나중에 생성된 세이브 포인트로는 돌아갈 수 없다.

SELECT * FROM coffees;






