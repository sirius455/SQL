/*
    # 시퀀스
    
     - 기본키로 사용하기 편하도록 설계된 자동 번호 생성기
     - user_sequences 데이터 딕셔너리로 확인할 수 있다
     
     CREATE SEQUENCE 시퀀스명
                        [START WHIT n]   - 시퀀스의 시작 번호 설정
                        [INCREMENT BY n] - 시퀸스의 증가값 설정
                        [MAXVALUE n | NOMAXVALUE] - 최대값 설정
                        [MINVALUE n | NOMAXVALUE] - 최소값 설정
                        [CYCLE | NOCYCLE] - 최대값에 도달했을 때 순환 여부 설정
                        [CACHE n | NOCACHE] - 메모리상에 미리 만들어놓을 시퀀스의 개수 설정
*/

-- 스퀀스 데이터 딕셔너리
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

CREATE TABLE sodas (
    pid NUMBER(4) CONSTRAINT SODA_PAD_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL
);

INSERT INTO sodas VALUES(1, '사이다');
INSERT INTO sodas VALUES(2, '청포도 에이드');
INSERT INTO sodas VALUES(3, '자몽 에이드');

-- 4부터 시작하고 1씩 증가하는 시퀀스 생성
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;

INSERT INTO sodas VALUES(sodas_seq.nextval, '민트초코라떼');
INSERT INTO sodas VALUES(sodas_seq.nextval, '환타');
INSERT INTO sodas VALUES(sodas_seq.nextval, '밀키스');
INSERT INTO sodas VALUES(sodas_seq.nextval, '암바사');

DELETE FROM sodas WHERE pid > 3;

CREATE TABLE soda_categories (
    cate_id NUMBER(4),
    cate_name VARCHAR2(40),
    CONSTRAINT SC_ID_PK PRIMARY KEY (cate_id)
);
/*
    sod_categories 테이블에서 사용할 시퀀스를 생성해보세요
    
    1.시작은 10번부터
    2. 10씩 증가할 것
    3. CACHE 10으로설정
    4. 순환하지 않을 것
    5. 최대값은 9000
*/

CREATE SEQUENCE soda_categories_seq START WITH 10 INCREMENT BY 10 MAXVALUE 9000 NOCYCLE CACHE 10;

INSERT INTO soda_categories VALUES(10, '탄산');
INSERT INTO soda_categories VALUES(soda_categories_seq.nextval, '강탄산');

DROP TABLE soda_categories;

-- 현재 몇 번째 번호까지 사용중인지 알고싶을 때 
SELECT sodas_seq.currval FROM dual; -- 시퀸스.currval

/*
    # 시퀀스 삭제
        DROP SEQUENCE 시퀀스명;
        
    # 시퀀스 수정
        ALTER SEQUENCE 시퀀스 명 ※ 수정 옵션은 CREATE SEQUENCE와 같음
*/


SELECT * FROM soda_categories;
SELECT * FROM user_sequences;













