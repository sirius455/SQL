/*
    # 서브쿼리로 테이블 복사하기
        CREATE TABLE 테이블명 AS (서브쿼리)로 테이블을 생성할 수 있다
    
*/

-- CREATE TABLE 테이블명 AS (서브쿼리)로 테이블을 생성할 수 있다
CREATE TABLE coffees2 AS (SELECT * FROM coffees);

DESC coffees2;

CREATE TABLE bingsu3 AS (SELECT * FROM coffees WHERE cname LIKE '%빙수');

SELECT * FROM bingsu3;



/*
    # 테이블에 새 컬럼 추가하기
     ALTER TABLE 테이블 명 ADD(컬럼명 컬럼타입, ...)
*/

ALTER TABLE bingsu3 ADD (sirup VARCHAR2(20));

/*
    # 테이블의 컬럼 이름 변경하기
    
        ALTER TABLE 테이블명 RENAME COLUMN 현재이름 TO 바꿀이름;
*/

ALTER TABLE bingsu3 RENAME COLUMN sirup TO syrup;



/*
    # 테이블 이름 변경하기
        
        RENAME 현재테이블명 TO 바꿀테이블명;
*/

RENAME bingsu3 TO bingsoo;

/*
    # 컬럼 타입 변경하기
        
        ALTER TABLE 테이블명 MODIFY(컬럼명 컬럼타입, ....)
*/

SELECT * FROM bingsoo;

ALTER TABLE bingsoo MODIFY (cname varchar2(54));

UPDATE bingsoo SET cname = '민트초코카페라떼파인애플고수나물빙수';

INSERT INTO bingsoo VALUES (101, '민트초코카페라떼파인애플마라빙수', 7500, '딸기');

/*
    # 컬럼 삭제하기
        
        ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
*/

SELECT * FROM bingsoo;

ALTER TABLE bingsoo DROP COLUMN syrup;



















