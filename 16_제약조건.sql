/*
    # 데이터 무결성
    
     - 데이터에는 결점이 없어야 한다는 뜻
     - 개체 무결성, 참조 무결성, 도메인 무결성 :
     
     
    # 개체 무결성
     - 테이블의 데이터는 반드시 한 행을 구분할 수 있어야 한다
     - 개체 무결성을 지키기 위한 조건으로 PK를 사용한다
    
    # 참조 무결성
    
     - 참조 관계에 있는 데이터는 항상 일관된 값을 가져야 한다
     (employees의 department_id는 departments의 departments_id에 존재하는 값만 사용해야 한다)
     - 참조 무결성을 지키기 위한 제약 조건으로 FK를 사용한다
    
    # 도메인 무결성
    
     - 해당 컬럼을 구성하는 도메인들은 항상 타입이 일정해야 한다
     - 테이블의 컬럼 타입 설정 및 CHECK를 통해서 도메인 무결성을 지키고있다
    
    # 데이터 무결성 제약 조건
    
     - NOT NULL : 해당 컬럼에 NULL을 허용하지 않는 규칙
     - UNIQUE : 해당 컬럼에 중복되는 값을 허용하지 않는 규칙, 항상 유일한 값을 갖도록 한다.
     - PRIMARY KEY: 해당 컬럼을 기본키로 설정한다. NOT NULL + UNIQUE. 테이블 당 하나만 설정 가능.
     - FOREIGN KEY : 해당 컬럼을 외래키로 설정한다
     - CHECK : 원하는 데이터의 조건을 직접 지정하여 도메인 무결성을 유지할 수 있다
     
*/

-- # 제약조건 데이터 딕셔너리를 통해 현재 계정의 모든 제약조건들을 확인할 수 있다


SELECT * FROM all_constraints; -- 현재 계정으로 볼 수 있는 모든 제약조건

/*
    # 제약조건 테이블 CONSTRAINT_TYPE
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
-- CHECK() 내부에 원하는 조건을 추가
ALTER TABLE fruits ADD (fcolor VARCHAR(20) CHECK(fcolor IN ('RED', 'GREEN', 'BLUE'))); -- CHECK() 내부에 원하는 조건을 추가

INSERT INTO fruits VALUES(2, 'Apple', 'RED');
INSERT INTO fruits VALUES(3, 'Banana', 'BLUE');

-- 테이블에 존재하는 존재하는 제약조건 제거하기

ALTER TABLE fruits DROP CONSTRAINT SYS_C007854; 
ALTER TABLE fruits DROP CONSTRAINT SYS_C007852; 

/*
    # 테이블에 이미 존재하는 컬럼에 제약조건 추가하기
     - ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건명 제약조건(적용될 컬럼);
     - ALTER TABLE 테이블 명 MODIFY 컬럼명 (새로 설정);
*/

ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY (fid);

SELECT * FROM user_constraints; -- 현재 계정의 제약 조건
SELECT * FROM all_constraints; -- 현재 계정의 제약 조건

UPDATE fruits SET fcolor = 'Yellow' WHERE fname = 'Banana';

DESC fruits;

SELECT * FROM fruits;

-- ※ 제약조건 이름을 자동생성되는 이름보다 쉽게 구분할 수 있는 보기 좋은 이름으로 설정해야 한다
INSERT INTO fruits VALUES(1, 'Orange', 'Orange');

/*
    # 제약조건을 추가하는 방법
    
     1. 테이블 생성과 동시에 추가하기
     
     - 컬럼명 컬럼타입 CONSTRAINT 제약조건명 제약조건타입
     - 반드시 제약조건 이름을 팀 규칙에 맞게 짓도록하자
     
     2. 테이블을 생성 후 제약조건 추가하기
    

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

-- NOT NULL과 CHECK는 ADD CONSTRAINT 대신 MODIFY를 이용해 추가수정한다
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FID_PK PRIMARY KEY (fid);
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FNAME_UK UNIQUE (fname);
ALTER TABLE fruits3 MODIFY (fname VARCHAR2(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fcolor VARCHAR2(10) CONSTRAINT FRUITS3_FCOLOR_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fsize CHAR(1) CONSTRAINT FRUITS3_FSIZE_CHK CHECK (fsize IN ('L', 'N', 'S')));

SELECT * FROM user_constraints; -- 현재 계정의 제약 조건

/*
    # default 제약 조건
    
     - 해당 컬럼에 기본값을 설정해놓는 제약조건
     - default가 설정된 컬럼은 행 추가시 값을 넣지 않으면 
       null 대신 default로 설정한 값이 추가된다
*/

ALTER TABLE fruits3 ADD (fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits3 MODIFY (fprice NUMBER(7) DEFAULT 10);

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';
DESC fruits3;

/*
    # Foreign Key 제약조건
    
     - 제약조건을 설정할 때 어떤 테이블의 어떤 컬럼을 참조할지 반드시 지정해야 한다
     - 다른 테이블의 PK또는 UK제약조건이 걸린 컬럼만 지정할 수 있다
*/

CREATE TABLE fruit_locations(
  lid NUMBER(2),
  addr VARCHAR2(200),
  city VARCHAR2(40)
);

INSERT INTO fruit_locations VALUES(10, '충청북도 청주시', '청주');
INSERT INTO fruit_locations VALUES(20, '경상북도 안동시', '안동');
INSERT INTO fruit_locations VALUES(30, '전라남도 고흥군', '고흥');
INSERT INTO fruit_locations VALUES(40, '충청남도 논산시', '논산');

SELECT * FROM fruit_locations;

-- ※ UNIQUE 또는 PRIMARY KEY 제약 조건이 걸리지 않은 컬럼은 외래키로 참조될 수 없다
-- ADD를 MODIFY로 바꾸면 이미 생성된것에 외래키를 지정할 수 있다.

ALTER TABLE fruit_locations ADD CONSTRAINT FLO_LID_UK UNIQUE(lid);
ALTER TABLE fruits3 ADD (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));

SELECT * FROM user_constraints WHERE constraint_name LIKE 'FRUITS3%';

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'RED', 'L', 10);
INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(2, 'Banana', 'Yellow', 'N', 20);

purge recyclebin;

SELECT * FROM fruits3 INNER JOIN fruit_locations USING (lid);

/*
    # 제약조건 추가하는 방법3 (테이블 레벨로 추가하기)
     
     - 컬럼을 모두 정의한 CREATE TABLE의 맨 뒤에 따로 제약조건을 지정하는 방식
     - DEFAULT와 NOT NULL은 테이블 레벨에서 정의할 수 없다
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
     # 1:N관계를 가지는 두 테이블을 생성한 후 연결해보세요
     
         ※ 이태까지 배운 모든 제약조건을 최소 한번이상 사용할 것, 각 테이블에 데이터 3개씩 넣어볼것

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
        CONSTRAINT MARKET_PRODUCT_KIND_CK CHECK (product_kind IN ('육류', '어류', '가공식품', '즉석식품', '음료', '술' )),
    proudct_origin NUMBER(2)    
);

ALTER TABLE market MODIFY (product_name varchar2(30));
ALTER TABLE market MODIFY (product_kind varchar2(12));


INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(1, '국내산삼겹살100g', '2400', '육류', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(2, '수입산목살100g', '2000', '육류', 2);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(3, '소세지', '3000', '육류', 3);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(4, '고등어', '7000', '어류', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(5, '불닭볶음면', '1500', '즉석식품', 1);
INSERT INTO market(product_id, product_name, product_price, product_kind, proudct_origin) VALUES(6, '나시고랭', '3000', '즉석식품', 6);

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

UPDATE proudct SET shelf_life = '2021/05/30' WHERE product_name = '수입산목살100g';


SELECT * FROM proudct;

SELECT * FROM proudct_origins;

SELECT * FROM proudct INNER JOIN proudct_origins USING (proudct_origin);


-- 다른 테이블에서 FK로 참조되는 테이블의 행을 아무생각없이 삭제하면 무결성을 해칠 위험이 있음
SELECT * FROM fruits3;
SELECT * FROM fruit_locations;

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'RED', 'S', 20);

COMMIT;

DELETE FROM fruit_locations;

ROLLBACK;

/*
    # ON DELETE 제약조건
    
     - FK(자식레코드)가 참조하고 있는 부모 레코드를 삭제할때의 정책을 결정할 수 있다.
     - CASCADE, SET NULL, RESTRICT
   
    # ON DELETE CASCADE
    
     - 부모 레코드를 삭제하면 자식 레코드를 모두 함께 삭제한다
    
    # ON DELETE SET NULL
    
     - 부모 레코드를 삭제하면 참조하던 자식 레코드의 값을 null로 변경한다
    
    # RESTRICT
    
     - 자식 레코드가 있으면 부모 레코드를 삭제할 수 없게한다.
     -  ON DELETE를 설정하지 안으면 된다
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


