/*
    # dual 테이블
    
     - 연습용 테이블
     - 하나의 행만 가지고 있음
*/

SELECT
    3 * 2
FROM
    dual;

SELECT
    1
FROM
    dual;

-- ABS(n) : 절대값
SELECT
    abs(- 123)
FROM
    dual;

-- FLOOR(n): 내림
SELECT
    floor(123.335)
FROM
    dual;

-- ROUND(n): 반올림
SELECT
    round(123.555)
FROM
    dual;

-- CEIL(n): 올림
SELECT
    ceil(123.111)
FROM
    dual;

-- MOD (n, m) : 나머지연산
SELECT
    mod(13, 10)
FROM
    dual;

--TRUNC(value, m) : 지정한 자리 값 이하를 잘라낸다
SELECT
    trunc(123.1234, 3)
FROM
    dual;

SELECT
    trunc(123.1234, 2)
FROM
    dual;

SELECT
    trunc(123.1234, 1)
FROM
    dual;

SELECT
    trunc(123.1234, - 1)
FROM
    dual;

SELECT
    trunc(123.1234, - 2)
FROM
    dual;

SELECT
    sysdate
FROM
    dual;

SELECT
    trunc(sysdate, 'year')
FROM
    dual;

SELECT
    trunc(sysdate, 'month')
FROM
    dual;

SELECT
    trunc(sysdate, 'day')
FROM
    dual;

-- TO_CHAR로 DATE타입 데이터를 원하는 포맷으로 변경하기
SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

SELECT
    to_char(trunc(sysdate, 'YEAR'), 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

SELECT
    to_char(trunc(sysdate, 'MONTH'), 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

SELECT
    to_char(trunc(sysdate, 'DAY'), 'YYYY/MM/DD HH24:MI:SS')
FROM
    dual;

SELECT
    lower('ABC')
FROM
    dual;

SELECT
    upper('abc')
FROM
    dual;

-- 1 base (여기는 인덱스를 1부터 센다)
SELECT
    substr('Hello,world', 1, 4)
FROM
    dual;
-- 숫자를 하나만 적으면 맨 뒤까지 자른다
SELECT
    substr('Hello,world', 5)
FROM
    dual;

-- 글자수를 측정
SELECT
    length('of the people, by the people, for the people.')
FROM
    dual; 

--LPAD(원본, 길이, 채울문자)
--RPAD(원본, 길이, 채울문자)
-- ※ 채울 문자가 공백일 경우 생략가능
SELECT
    lpad('title', 10, '#')
FROM
    dual;

SELECT
    rpad('title', 10, '')
FROM
    dual;

--LTRIM(원본, 제거할 문자)
--RTRIM(원본, 제거할 문자)
-- ※ 제거할 문자가 공백일 경우 생략가능
SELECT
    ltrim('#####TITLE', '#')
FROM
    dual;

SELECT
    ltrim('      TITLE')
FROM
    dual;

SELECT
    '      TITLE'
FROM
    dual;

-- TRIM() : 앞 뒤의 특정 문자를 제거한다

SELECT
    TRIM('    title   ')
FROM
    dual;

SELECT
    TRIM('#' FROM '#####title#####')
FROM
    dual;

--원격접속
--https://docs.oracle.com/cd/E17781_01/server.112/e18804/network.htm#ADMQS166

-- 날자 연산하기
SELECT
    sysdate - 1  AS 어제,
    sysdate      AS 오늘,
    sysdate + 1  AS 내일,
    sysdate + 2  AS "내일 모래"
FROM
    dual;

-- 날짜끼리 연산하면 두날짜 사이의 시간을 구할 수 있다
SELECT last_name, FLOOR(sysdate - hire_date) AS "근무일" FROM employees;

-- MONTHS_BETWEEN : 두 날짜 사이의 개월 수를 구한다
SELECT last_name, FLOOR(MONTHS_BETWEEN(sysdate, hire_date)) AS "근무개월" FROM employees;

-- ADD MONTH(date, n) : DATE타입 데이터에 원하는 개월 수를 더한다
SELECT ADD_MONTHS(sysdate, 5) FROM dual;

-- NEXT_DAY(date, 요일) : DATE타입 데이터를 기준으로 다음 요일을 찾는다
SELECT NEXT_DAY(sysdate, '화요일') FROM dual;
SELECT NEXT_DAY(sysdate, '화') FROM dual;

-- LAST_DAY(date) : DATE타입 데이터를 기준으로 해당 달의 마지막 날짜를 반환한다
SELECT LAST_DAY(sysdate) FROM dual;

/*
    # 오라클의 날짜 포맷
    
    CC : 세기
    YYYY : 년도
    YY : 년도(2자리)
    MM : 월
    MON : 월을 문자로
    DD : 날짜
    DAY : 요일
    DY : 요일(줄임)
    HH, HH12 : 12시
    HH24 : 24시
    MI : 분
    AM, PM : 오전 오후 표시
    
    # 오라클의 숫자 포멧
    
    0 : 자리수를 나타낸다. 숫자가 비면 0으로 채운다
    9 : 자리수를 나타낸다. 숫자가 비면 빈칸으로 채운다.
    L : 각 지역별 통화 기호를 붙인다
    . : 소수점을 출력한다
    , : 천 단위를 구분하는 쉼표를 출력한다
*/

-- TO_CHAR : 숫자를 문자로 바꾸거나. 날짜를 문자로 바꾼다. 바꿀 때 형식을 이용할 수 있어서 편리하다
SELECT TO_CHAR(sysdate, 'CC HH12:MI:SS PM') FROM dual;

SELECT TO_CHAR(150000000, '999,999,999,999L') FROM dual;

SELECT TO_CHAR(150000000, '000,000,000,000,000L') FROM dual;

-- TO_NUMBER : 문자를 숫자로 변환 포멧을 이용해 다시 숫자로 변환할 수 있다

SELECT TO_NUMBER('15,000,000￦', '99,999,999L') FROM dual;

/*
    # 날짜 컬럼 비교
    
    CHECK (visit_date > TO_DATE('2020/01/01', YYYY/MM//DD'))
    CHECK (visit_date BETWEEN TO_DATE('2020/01/01', 'YYYY/MM/DD') AND TO_DATE('2021/01/01', 'YYYY/MM/DD');
*/



    