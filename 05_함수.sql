/*
    # dual ���̺�
    
     - ������ ���̺�
     - �ϳ��� �ุ ������ ����
*/

SELECT
    3 * 2
FROM
    dual;

SELECT
    1
FROM
    dual;

-- ABS(n) : ���밪
SELECT
    abs(- 123)
FROM
    dual;

-- FLOOR(n): ����
SELECT
    floor(123.335)
FROM
    dual;

-- ROUND(n): �ݿø�
SELECT
    round(123.555)
FROM
    dual;

-- CEIL(n): �ø�
SELECT
    ceil(123.111)
FROM
    dual;

-- MOD (n, m) : ����������
SELECT
    mod(13, 10)
FROM
    dual;

--TRUNC(value, m) : ������ �ڸ� �� ���ϸ� �߶󳽴�
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

-- TO_CHAR�� DATEŸ�� �����͸� ���ϴ� �������� �����ϱ�
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

-- 1 base (����� �ε����� 1���� ����)
SELECT
    substr('Hello,world', 1, 4)
FROM
    dual;
-- ���ڸ� �ϳ��� ������ �� �ڱ��� �ڸ���
SELECT
    substr('Hello,world', 5)
FROM
    dual;

-- ���ڼ��� ����
SELECT
    length('of the people, by the people, for the people.')
FROM
    dual; 

--LPAD(����, ����, ä�﹮��)
--RPAD(����, ����, ä�﹮��)
-- �� ä�� ���ڰ� ������ ��� ��������
SELECT
    lpad('title', 10, '#')
FROM
    dual;

SELECT
    rpad('title', 10, '')
FROM
    dual;

--LTRIM(����, ������ ����)
--RTRIM(����, ������ ����)
-- �� ������ ���ڰ� ������ ��� ��������
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

-- TRIM() : �� ���� Ư�� ���ڸ� �����Ѵ�

SELECT
    TRIM('    title   ')
FROM
    dual;

SELECT
    TRIM('#' FROM '#####title#####')
FROM
    dual;

--��������
--https://docs.oracle.com/cd/E17781_01/server.112/e18804/network.htm#ADMQS166

-- ���� �����ϱ�
SELECT
    sysdate - 1  AS ����,
    sysdate      AS ����,
    sysdate + 1  AS ����,
    sysdate + 2  AS "���� ��"
FROM
    dual;

-- ��¥���� �����ϸ� �γ�¥ ������ �ð��� ���� �� �ִ�
SELECT last_name, FLOOR(sysdate - hire_date) AS "�ٹ���" FROM employees;

-- MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ���Ѵ�
SELECT last_name, FLOOR(MONTHS_BETWEEN(sysdate, hire_date)) AS "�ٹ�����" FROM employees;

-- ADD MONTH(date, n) : DATEŸ�� �����Ϳ� ���ϴ� ���� ���� ���Ѵ�
SELECT ADD_MONTHS(sysdate, 5) FROM dual;

-- NEXT_DAY(date, ����) : DATEŸ�� �����͸� �������� ���� ������ ã�´�
SELECT NEXT_DAY(sysdate, 'ȭ����') FROM dual;
SELECT NEXT_DAY(sysdate, 'ȭ') FROM dual;

-- LAST_DAY(date) : DATEŸ�� �����͸� �������� �ش� ���� ������ ��¥�� ��ȯ�Ѵ�
SELECT LAST_DAY(sysdate) FROM dual;

/*
    # ����Ŭ�� ��¥ ����
    
    CC : ����
    YYYY : �⵵
    YY : �⵵(2�ڸ�)
    MM : ��
    MON : ���� ���ڷ�
    DD : ��¥
    DAY : ����
    DY : ����(����)
    HH, HH12 : 12��
    HH24 : 24��
    MI : ��
    AM, PM : ���� ���� ǥ��
    
    # ����Ŭ�� ���� ����
    
    0 : �ڸ����� ��Ÿ����. ���ڰ� ��� 0���� ä���
    9 : �ڸ����� ��Ÿ����. ���ڰ� ��� ��ĭ���� ä���.
    L : �� ������ ��ȭ ��ȣ�� ���δ�
    . : �Ҽ����� ����Ѵ�
    , : õ ������ �����ϴ� ��ǥ�� ����Ѵ�
*/

-- TO_CHAR : ���ڸ� ���ڷ� �ٲٰų�. ��¥�� ���ڷ� �ٲ۴�. �ٲ� �� ������ �̿��� �� �־ ���ϴ�
SELECT TO_CHAR(sysdate, 'CC HH12:MI:SS PM') FROM dual;

SELECT TO_CHAR(150000000, '999,999,999,999L') FROM dual;

SELECT TO_CHAR(150000000, '000,000,000,000,000L') FROM dual;

-- TO_NUMBER : ���ڸ� ���ڷ� ��ȯ ������ �̿��� �ٽ� ���ڷ� ��ȯ�� �� �ִ�

SELECT TO_NUMBER('15,000,000��', '99,999,999L') FROM dual;

/*
    # ��¥ �÷� ��
    
    CHECK (visit_date > TO_DATE('2020/01/01', YYYY/MM//DD'))
    CHECK (visit_date BETWEEN TO_DATE('2020/01/01', 'YYYY/MM/DD') AND TO_DATE('2021/01/01', 'YYYY/MM/DD');
*/



    