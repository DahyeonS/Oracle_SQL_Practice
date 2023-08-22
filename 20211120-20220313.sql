-- 1일차

SELECT empno, ename, sal FROM emp;
SELECT * FROM emp;
SELECT empno as "사원 번호", ename as 이름, sal as "Salary"  FROM emp;

-- 2일차

SELECT ename || sal FROM emp;
SELECT ename || '의 월급은 ' || sal || '입니다.' FROM emp;
SELECT ename || '의 직업은 ' || job || '입니다.' as 월급정보 FROM emp;

SELECT DISTINCT job from emp; 

SELECT ename, sal FROM emp ORDER BY sal ASC;
SELECT ename, sal  as 월급 FROM emp ORDER BY 월급 asc;
SELECT ename, deptno, sal FROM emp ORDER BY deptno, sal desc; 
SELECT ename, deptno, sal FROM emp ORDER BY 2 asc,3 desc; -- 숫자

SELECT ename, sal, job FROM emp WHERE sal = 3000;
SELECT ename, sal FROM emp WHERE sal >= 3000;

SELECT ename, sal, job, hiredate, deptno FROM emp WHERE ename = 'SCOTT';
SELECT ename, sal, job, hiredate, deptno FROM emp WHERE ename = 'scott'; -- 데이터가 나오지 않음(반드시 대소문자 구분할 것!)
SELECT ename, sal, job, hiredate, deptno FROM emp WHERE hiredate = '81/11/17';

SELECT * FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT'; -- 접속한 세션 날짜 형식 확인: RR = 년도, MM = 달, DD = 일

SELECT ename, sal * 12 as 연봉 FROM emp WHERE sal * 12 >= 36000;
SELECT ename, sal, comm, sal + comm FROM emp WHERE deptno = 10;
SELECT ename, sal, NVL(comm, 0) , sal + NVL(comm, 0) FROM emp WHERE deptno = 10;

SELECT ename, sal, job, deptno FROM emp WHERE sal <= 1200;

-- 3일차

SELECT ename, sal FROM emp WHERE sal BETWEEN 1000 AND 3000;
SELECT ename, sal FROM emp WHERE (sal >= 1000 AND sal <= 3000);
SELECT ename, sal FROM emp WHERE sal NOT BETWEEN 1000 AND 3000;
SELECT ename, sal FROM emp WHERE (sal <1000 OR sal >3000);
SELECT ename, hiredate FROM emp WHERE hiredate BETWEEN '82/01/01' AND '82/12/31';

SELECT ename, sal FROM emp WHERE ename LIKE 'S%';
SELECT ename FROM emp WHERE ename LIKE '_M%';
SELECT ename FROM emp WHERE ename LIKE '%T';
SELECT ename FROM emp WHERE ename LIKE '%A%';

SELECT ename, comm FROM emp WHERE comm is null;

SELECT ename, sal, job FROM emp WHERE job in ('SALESMAN', 'ANALYST', 'MANAGER');
SELECT ename, sal, job FROM emp WHERE (job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER');
SELECT ename, sal, job FROM emp WHERE job NOT in ('SALESMAN', 'ANALYST', 'MANAGER');
SELECT ename, sal, job FROM emp WHERE (job != 'SALESMAN' and job != 'ANALYST' and job != 'MANAGER');

SELECT ename, sal, job FROM emp WHERE job = 'SALESMAN' AND sal >=1200;
SELECT ename, sal, job FROM emp WHERE job = 'AAAAAAAA' AND sal >=1200;

-- 4일차

SELECT UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;
SELECT ename, sal FROM emp WHERE LOWER(ename) = 'scott';

SELECT SUBSTR('SMITH', 1, 3) FROM dual; -- SMI

SELECT ename, LENGTH(ename) FROM emp;
SELECT LENGTH('가나다라마') FROM dual; -- 5
SELECT LENGTHB('가나다라마') FROM dual; -- 15

SELECT INSTR('SMITH', 'M') FROM dual; -- 2
SELECT INSTR('abcdefg@naver.com', '@') FROM dual; -- 8
SELECT SUBSTR('abcdefgh@naver.com',  INSTR('abcdefgh@naver.com', '@')+1) FROM dual; -- naver.com
SELECT RTRIM(SUBSTR('abcdefgh@naver.com', INSTR('abcdefgh@naver.com', '@')+1), '.com') FROM dual; -- naver

SELECT ename, REPLACE(sal, 0, '*') FROM emp;
SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*') as salary FROM emp;

CREATE TABLE TEST_ENAME (ENAME VARCHAR(10));
INSERT INTO TEST_ENAME VALUES('김인호');
INSERT INTO TEST_ENAME VALUES('안상수');
INSERT INTO TEST_ENAME VALUES('최영희');
COMMIT;

SELECT REGEXP_REPLACE(ename, SUBSTR(ename, 2, 1), '*') FROM test_ename;

SELECT ename, LPAD(sal, 10, '*') as salary1, RPAD(sal, 10, '*') as salary2 FROM emp;
SELECT ename, sal, LPAD('■', ROUND(sal/100), '■') as bar_chart FROM emp;

SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths') FROM dual;

INSERT INTO emp(empno, ename, sal, job, deptno) values(8291, 'JACK ', 3000, 'SALESMAN', 30);
COMMIT;

SELECT ename, sal FROM emp WHERE ename = 'JACK';
SELECT ename, sal FROM emp WHERE RTRIM(ename) = 'JACK';

DELETE FROM emp WHERE RTRIM(ename) = 'JACK';
COMMIT;

SELECT '876.567' as 숫자, ROUND(876.567,1) FROM dual; -- 876.6
SELECT '876.567' as 숫자, ROUND(876.567,2) FROM dual; -- 876.57
SELECT '876.567' as 숫자, ROUND(876.567,-1) FROM dual; -- 880
SELECT '876.567' as 숫자, ROUND(876.567,-2) FROM dual; -- 900
SELECT '876.567' as 숫자, ROUND(876.567, 0) FROM dual; -- 877
SELECT '876.567' as 숫자, ROUND(876.567) FROM dual; -- 877

-- 5일차

SELECT '876.567' as 숫자, TRUNC(876.567, 1) FROM dual; -- 876.5
SELECT '876.567' as 숫자, TRUNC(876.567, 2) FROM dual; -- 876.56
SELECT '876.567' as 숫자, TRUNC(876.567, -1) FROM dual; -- 870
SELECT '876.567' as 숫자, TRUNC(876.567, -2) FROM dual; -- 800
SELECT '876.567' as 숫자, TRUNC(876.567, 0) FROM dual; -- 876
SELECT '876.567' as 숫자, TRUNC(876.567) FROM dual; -- 876

SELECT MOD(10, 3) FROM dual;
SELECT empno, MOD(empno, 2) FROM emp;
SELECT empno, ename FROM emp WHERE MOD(empno,2) = 0;
SELECT FLOOR(10/3) FROM dual;

SELECT ename, MONTHS_BETWEEN(sysdate, hiredate) FROM emp;
SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD') FROM dual;
SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD'))/7) as"총 주수" FROM dual;

SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100) FROM dual;
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + 100 FROM dual;
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '100' month FROM dual;
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '1-3' year(1) to month FROM dual;
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '3' year FROM dual;
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + TO_YMINTERVAL('03-05') as 날짜 FROM dual;

SELECT '2019/05/22' as 날짜, NEXT_DAY('2019/05/22', '월요일') FROM dual;
SELECT sysdate as "오늘 날짜" FROM dual;
SELECT NEXT_DAY(sysdate, '화요일') as "다음 날짜" FROM dual;
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일') as "다음 날짜" FROM dual;
SELECT NEXT_DAY(ADD_MONTHS(sysdate, 100), '월요일') as "다음 날짜" FROM dual;

SELECT '2019/05/22' as 날짜, LAST_DAY('2019/05/22') as "마지막 날짜" FROM dual;
SELECT LAST_DAY(sysdate) - sysdate as "남은 날짜" FROM dual;
SELECT ename, hiredate, LAST_DAY(hiredate) FROM emp WHERE ename = 'KING';

SELECT ename, TO_CHAR(hiredate, 'DAY') as 요일, TO_CHAR(sal, '999,999') as 월급 FROM emp WHERE ename = 'SCOTT';
SELECT hiredate, TO_CHAR(hiredate, 'RRRR') as 연도, TO_CHAR(hiredate, 'MM') as 달, TO_CHAR(hiredate, 'DD') as 일, TO_CHAR(hiredate, 'DAY') as 요일
FROM EMP WHERE ename = 'KING';
SELECT ename, hiredate FROM emp WHERE TO_CHAR(hiredate, 'RRRR') = '1981';
SELECT ename as 이름, EXTRACT(year from hiredate) as 연도, EXTRACT(month from hiredate) as 달, EXTRACT(day from hiredate) as 일 FROM emp;
SELECT ename as 이름, TO_CHAR(sal, '999,999') as 월급 FROM emp;
SELECT ename as 이름, TO_CHAR(sal*200, '999,999,999') as 월급 FROM emp;
SELECT ename as 이름, TO_CHAR(sal*200, 'L999,999,999') as 월급 FROM emp;

SELECT ename, hiredate FROM emp WHERE hiredate = TO_DATE('81/11/17', 'RR/MM/DD');

SELECT * FROM NLS_SESSION_PARAMETERS WHERE parameter = 'NLS_DATE_FORMAT';
SELECT ename, hiredate FROM emp WHERE hiredate = '81/11/17';

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';
SELECT ename, hiredate FROM emp WHERE hiredate = '17/11/81';

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

-- 6일차

SELECT ename, sal FROM emp WHERE sal = '3000';

CREATE TABLE  EMP32(ENAME VARCHAR2(10), SAL VARCHAR(10));
INSERT INTO EMP32 VALUES ('SCOTT', '3000');
INSERT INTO EMP32 VALUES('SMITH', '1200');
COMMIT;

SELECT ename, sal FROM emp32 WHERE sal = '3000';
SELECT ename, sal FROM emp32 WHERE sal = 3000;
SELECT ename, sal FROM emp32 WHERE TO_NUMBER(sal) = 3000;

SET AUTOT ON
SELECT ename, sal FROM emp32 WHERE sal = 3000;

SELECT ename, comm, NVL(comm, 0) FROM emp;
SELECT ename, sal, comm, sal+comm FROM emp WHERE job IN ('SALESMAN', 'ANALYST');
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) FROM emp WHERE job IN('SALESMAN', 'ANALYST');
SELECT ename, sal, comm, NVL2(comm, sal+comm, sal) FROM emp WHERE job IN('SALESMAN', 'ANALYST');

SELECT ename, deptno, DECODE(deptno, 10, 300, 20, 400, 0) as 보너스 FROM emp;
SELECT empno, MOD(empno, 2), DECODE(mod(empno, 2), 0, '짝수', 1, '홀수') as 홀짝 FROM emp;
SELECT ename, job, DECODE(job, 'SALESMAN', 5000, 2000) as 보너스 FROM emp;

SELECT ename, job, sal,
CASE WHEN sal >= 3000 THEN 500
WHEN sal >= 2000 THEN 300
WHEN sal >= 1000 THEN 200
ELSE 0 END as 보너스
FROM emp WHERE job IN('SALESMAN', 'ANALYST');

SELECT ename, job, comm, CASE WHEN comm is null THEN 500 ELSE 0 END as BONUS FROM emp WHERE job IN ('SALESMAN', 'ANALYST');
SELECT ename, job, CASE WHEN job in ('SALESMAN', 'ANALYST') THEN 500 WHEN job IN ('CLERK', 'MANAGER') THEN 400 ELSE 0 END as 보너스 FROM emp;

SELECT MAX(sal) FROM emp;
SELECT MAX(sal) FROM emp WHERE job = 'SALESMAN';
SELECT job, MAX(sal) FROM emp WHERE job = 'SALESMAN'; -- 오류
SELECT job, MAX(sal) FROM emp WHERE job = 'SALESMAN' GROUP BY job;
SELECT deptno, MAX(sal) FROM emp GROUP BY deptno;

SELECT MIN(sal) FROM emp WHERE job = 'SALESMAN';
SELECT job, MIN(sal) as 최소값 FROM emp GROUP BY job ORDER BY 최소값 DESC;
SELECT MIN(sal) FROM emp WHERE 1=2; -- 조건이 거짓이어도 실행되며 NULL값으로 출력
SELECT NVL(min(sal), 0) FROM emp WHERE 1=2;
SELECT job, MIN(sal) FROM emp WHERE job != 'SALESMAN' GROUP BY job ORDER BY MIN(sal) DESC;
SELECT job, MIN(sal) FROM emp WHERE job <> 'SALESMAN' GROUP BY job ORDER BY MIN(sal) DESC;

SELECT AVG(sal) FROM emp;
SELECT AVG(comm) FROM emp; -- 550
SELECT ROUND(avg(nvl(comm, 0))) FROM emp; -- 157

SELECT deptno, SUM(sal) FROM emp GROUP BY deptno;
SELECT job, SUM(sal) FROM emp GROUP BY job ORDER BY SUM(sal) DESC;
SELECT job, SUM(sal) FROM emp WHERE SUM(sal) >= 4000 GROUP BY job; -- 오류
SELECT job, SUM(sal) FROM emp GROUP BY job HAVING SUM(sal) >= 4000;
SELECT job, SUM(sal) FROM emp WHERE job !='SALESMAN' GROUP BY job HAVING SUM(sal) >= 4000;
SELECT job as 직업, SUM(sal) FROM emp WHERE job != 'SALESMAN' GROUP BY 직업 HAVING SUM(sal) >= 4000; -- 오류

SELECT COUNT(empno) FROM emp; -- 14
SELECT COUNT(*) FROM emp; -- 14
SELECT COUNT(comm) FROM emp; -- 4

-- 7일차

SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) as RANK, DENSE_RANK() over (ORDER BY sal DESC) as DENSE_RANK
FROM emp WHERE job IN ('ANALYST', 'MANAGER');
SELECT job, ename, sal, DENSE_RANK() over (PARTITION BY job ORDER BY sal DESC) 순위 FROM emp WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
SELECT job, ename, sal, DENSE_RANK() over (PARTITION BY job ORDER BY sal DESC) 순위
FROM emp WHERE hiredate BETWEEN TO_DATE('1981/01/01', 'RRRR/MM/DD') AND TO_DATE('1981/12/31', 'RRRR/MM/DD');
SELECT DENSE_RANK(2975) within group (ORDER BY sal DESC) 순위 FROM emp;
SELECT DENSE_RANK('81/11/17') within group (ORDER BY hiredate ASC) 순위 FROM emp;

SELECT ename, sal, job, NTILE(4) over (order by sal desc nulls last) 등급 FROM emp WHERE job IN ('ANALYST', 'MANAGER', 'CLERK');
SELECT ename, comm FROM emp WHERE deptno = 30 ORDER BY comm DESC;
SELECT ename, comm FROM emp WHERE deptno = 30 ORDER BY comm DESC NULLS LAST;

SELECT ename, sal, RANK() over (order by sal desc) as RANK, DENSE_RANK() over (order by sal desc) as DENSE_RANK,
CUME_DIST() over(order by sal desc) as CUM_DIST FROM emp;
SELECT job, ename, sal, RANK() over (partition by job order by sal desc) as RANK, CUME_DIST() over (partition by job order by sal desc) as CUM_DIST FROM emp;

SELECT deptno, LISTAGG(ename, ',') within group (order by ename) as EMPLOYEE FROM emp GROUP BY deptno;
SELECT job, LISTAGG(ename, ',') within group (order by ename) as employee FROM emp GROUP BY job;
SELECT job, LISTAGG(ename||'('||sal||')', ',') within group (order by ename asc) as employee FROM emp GROUP BY job; -- || 연결연산자 사용

SELECT empno, ename, sal, LAG(sal, 1) over (order by sal asc) "전 행", LEAD(sal, 1) over (order by sal asc) "다음 행" FROM emp WHERE job IN('ANALYST', 'MANAGER');
SELECT empno, ename, hiredate, LAG(hiredate, 1) over (order by hiredate asc) "전 행", LEAD(hiredate, 1) over (order by hiredate asc) "다음 행"
FROM emp WHERE job IN ('ANALYST', 'MANAGER');
SELECT deptno, empno, ename, hiredate, LAG(hiredate, 1) over (partition by deptno order by hiredate asc) "전 행",
LEAD(hiredate, 1) over (partition by deptno order by hiredate asc) "다음 행" FROM emp;

SELECT SUM(DECODE(deptno, 10, sal)) as "10", SUM(DECODE(deptno, 20, sal)) as "20", SUM(DECODE(deptno, 30, sal)) as "30" FROM emp;
SELECT deptno, DECODE(deptno, 10, sal) as "10" FROM emp;
SELECT SUM(DECODE(deptno, 10, sal)) as "10" FROM emp;

SELECT SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST", SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
SUM(DECODE(job, 'MANAGER', sal)) as "MANAGER", SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN" FROM emp;
SELECT deptno, SUM(DECODE(job, 'ANALYST', sal)) as "ANALYST", SUM(DECODE(job, 'CLERK', sal)) as "CLERK",
SUM(DECODE(job, 'MANAGER', sal)) as "MANAGER", SUM(DECODE(job, 'SALESMAN', sal)) as "SALESMAN" FROM emp GROUP BY deptno;

SELECT * FROM (select deptno, sal from emp) PIVOT (sum(sal) for deptno in (10, 20, 30));
SELECT * FROM (select job, sal from emp) PIVOT (sum(sal) for job in ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'));
SELECT * FROM (select job, sal from emp)
PIVOT (sum(sal) for job in ('ANALYST' as "ANALYST", 'CLERK' as "CLERK", 'MANAGER' as "MANAGER", 'SALESMAN' as "SALESMAN"));

-- 8일차

drop  table order2;

create table order2
( ename  varchar2(10),
  bicycle  number(10),
  camera   number(10),
  notebook  number(10) );

insert  into  order2  values('SMITH', 2,3,1);
insert  into  order2  values('ALLEN',1,2,3 );
insert  into  order2  values('KING',3,2,2 );

commit;

SELECT * FROM order2 UNPIVOT(건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));
SELECT * FROM order2 UNPIVOT(건수 for 아이템 in (BICYCLE as 'C', CAMERA as 'C', NOTEBOOK as 'N'));

UPDATE ORDER2 SET NOTEBOOK = NULL WHERE ENAME = 'SMITH';
SELECT * FROM order2 UNPIVOT(건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));
SELECT * FROM order2 UNPIVOT INCLUDE NULLS (건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));

SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 누적치
FROM emp WHERE job in ('ANALYST', 'MANAGER');
SELECT empno, ename, sal, SUM(sal) OVER (ORDER BY empno ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 누적치
FROM emp WHERE job in ('ANALYST', 'MANAGER');

SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () 비율 FROM emp WHERE deptno = 20;
SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () as 비율, sal/SUM(sal) OVER () as "비교 비율" FROM emp WHERE deptno = 20;

SELECT job, sum(sal) FROM emp GROUP BY ROLLUP(job); SELECT job, sum(sal) FROM emp GROUP BY job;
SELECT deptno, job, sum(sal) FROM emp GROUP BY ROLLUP(job, deptno); SELECT deptno, job, sum(sal) FROM emp GROUP BY ROLLUP(deptno, job);

SELECT job, sum(sal) FROM emp GROUP BY CUBE(job);
SELECT deptno, job, sum(sal) FROM emp GROUP BY CUBE(deptno, job);

SELECT deptno, job, sum(sal) FROM emp GROUP BY GROUPING SETS((deptno), (job), ()); -- ()는 전체를 의미함

SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) RANK, DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RANK,
ROW_NUMBER() OVER (ORDER BY sal DESC) 번호 FROM emp WHERE deptno = 20;
SELECT deptno, ename, sal, ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY sal DESC) 번호 FROM emp WHERE deptno in (10, 20);

-- 9일차

SELECT ROWNUM, empno, ename, job, sal FROM emp WHERE rownum <=5;


SELECT empno, ename, job, sal FROM emp ORDER BY sal DESC FETCH FIRST 4 ROWS ONLY;
SELECT empno, ename, job, sal FROM emp ORDER BY sal DESC FETCH FIRST 20 PERCENT ROWS ONLY;
SELECT empno, ename, job, sal FROM emp ORDER BY sal DESC FETCH FIRST 2 ROWS WITH TIES;
SELECT empno, ename, job, sal FROM emp ORDER BY sal DESC OFFSET 9 ROWS;
SELECT empno, ename, job, sal FROM emp ORDER BY sal DESC OFFSET 9 ROWS FETCH FIRST 2 ROWS ONLY;


SELECT ename, loc FROM emp, dept WHERE emp.deptno = dept.deptno;
SELECT ename, loc FROM emp, dept;
SELECT ename, loc, job FROM emp, dept WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
SELECT ename, loc, job, deptno FROM emp, dept WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST'; -- 오류
SELECT ename, loc, job, emp.deptno FROM emp, dept WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST';
SELECT emp.ename, dept.loc, emp.job, emp.deptno FROM emp, dept WHERE emp.deptno = dept.deptno and emp.job = 'ANALYST'; -- 검색 속도 향상
SELECT e.ename, d.loc, e.job, e.deptno FROM emp e, dept d WHERE e.deptno = d.deptno and e.job = 'ANALYST';
SELECT emp.ename, d.loc, e.job, e.deptno FROM emp e, dept d WHERE e.deptno = d.deptno and e.job = 'ANALYST'; -- 오류

SELECT e.ename, e.sal, s.grade FROM emp e, salgrade s WHERE e.sal between s.losal and s.hisal;
SELECT * FROM salgrade;

SELECT e.ename, d.loc FROM emp e, dept d WHERE e.deptno (+) = d.deptno;

SELECT e.ename as 사원, e.job as 직업, m.ename as 관리자, m.job as 직업 FROM emp e, emp m WHERE e.mgr = m.empno and e.job = 'SALESMAN';

SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e JOIN dept d ON (e.deptno = d.deptno) WHERE e.job = 'SALESMAN';

SELECT e.ename, d.loc, s.grade FROM emp e, dept d, salgrade s WHERE e.deptno = d.deptno and e.sal between s.losal and s.hisal;
SELECT e.ename, d.loc, s.grade FROM emp e JOIN dept d ON (e.deptno = d.deptno) JOIN salgrade s ON (e.sal between s.losal and s.hisal);

-- 10일차

SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e join dept d USING (deptno) WHERE e.job = 'SALESMAN';
SELECT e.ename, d.loc, s.grade FROM emp e JOIN dept d USING (deptno) JOIN salgrade s ON (e.sal between s.losal and s.hisal);

SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e NATURAL JOIN dept d WHERE e.job = 'SALESMAN';
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e NATURAL JOIN dept d WHERE e.job = 'SALESMAN' and deptno = 30;
-- deptno는 별칭 사용 불가

SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e RIGHT OUTER JOIN dept d ON (e.deptno = d.deptno);
-- SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e, dept d WHERE e.deptno (+) = d.deptno; 과 동일한 기능
INSERT INTO emp(empno, ename, sal, job, deptno) VALUES (8282, 'JACK', 3000, 'ANALYST', 50);
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno);
-- SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e, dept d WHERE e.deptno = d.deptno (+); 과 동일한 기능

SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e FULL OUTER JOIN dept d ON (e.deptno = d.deptno);
SELECT e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as "부서 위치" FROM emp e, dept d WHERE e.deptno (+) = d.deptno (+); -- 사용 불가

SELECT deptno, sum(sal) FROM emp GROUP BY deptno UNION ALL SELECT TO_NUMBER(null) as deptno, sum(sal) FROM emp; -- 연산자의 위아래 쿼리를 합침(합집합)

CREATE TABLE A (COL1 NUMBER(10));
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);
CREATE TABLE B (COL1 NUMBER(10));
INSERT INTO B VALUES(3);
INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);

SELECT col1 FROM A UNION ALL SELECT col1 FROM B;

SELECT deptno, sum(sal) FROM emp GROUP BY deptno UNION SELECT null as deptno, sum(sal) FROM emp;
SELECT col1 FROM A UNION SELECT col1 FROM B; -- 중복된 데이터 제거, 내림차순 정렬

SELECT ename, sal, job, deptno FROM emp WHERE deptno in (10, 20) INTERSECT SELECT ename, sal, job, deptno FROM emp WHERE deptno in (20, 30); -- (교집합)
SELECT col1 FROM A INTERSECT SELECT col1 FROM B; -- 내림차순

-- 11일차

SELECT ename, sal, job, deptno FROM emp WHERE deptno in (10, 20) MINUS SELECT ename, sal, job, deptno FROM emp WHERE deptno in (20, 30); -- 차집합
SELECT col1 FROM A MINUS SELECT col1 FROM B; -- 내림차순

SELECT ename, sal FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');
SELECT ename, sal FROM emp WHERE sal = (SELECT sal FROM emp WHERE ename = 'SCOTT');
SELECT ename, sal FROM emp WHERE sal = (SELECT sal FROM emp WHERE ename = 'SCOTT') AND ename != 'SCOTT'; -- SCOTT 제외

SELECT ename, sal FROM emp WHERE sal in (SELECT sal FROM emp WHERE job = 'SALESMAN');
SELECT ename, sal FROM emp WHERE sal = (SELECT sal FROM emp WHERE job = 'SALESMAN'); -- 오류

SELECT ename, sal, job FROM emp WHERE empno not in (SELECT mgr FROM emp WHERE mgr is not null);
SELECT ename, sal, job FROM emp WHERE empno not in (SELECT mgr FROM emp); -- NULL값으로 인해 결과가 출력되지 않음

SELECT * FROM dept d WHERE EXISTS (SELECT * FROM emp e WHERE e.deptno = d.deptno);
-- SELECT * FROM dept d WHERE deptno in (SELECT deptno FROM emp e WHERE e.deptno = d.deptno); 결과는 동일한데?????
SELECT * FROM dept d WHERE NOT EXISTS (SELECT * FROM emp e WHERE e.deptno = d.deptno);

SELECT job, sum(sal) FROM emp GROUP BY job HAVING sum(sal) > (SELECT sum(sal) FROM emp WHERE job = 'SALESMAN');

SELECT v.ename, v.sal, v.순위 FROM (SELECT ename, sal, rank() over (order by sal desc) 순위 FROM emp) v WHERE v.순위 = 1;
-- SELECT * FROM (SELECT ename, sal, rank() over (order by sal desc) 순위 FROM emp) v WHERE v.순위 = 1; 결과는 동일

SELECT ename, sal, (select max(sal) from emp where job = 'SALESMAN') as "최대 월급", (select min(sal) from emp where job = 'SALESMAN') as "최소 월급"
FROM emp WHERE job = 'SALESMAN';
SELECT ename, sal, max(sal), min(sal) FROM emp WHERE job = 'SALESMAN'; -- 오류

INSERT INTO emp (empno, ename, sal, hiredate, job) VALUES (2812, 'JACK', 3500, TO_DATE('2019-06-05', 'RRRR-MM-DD'), 'ANALYST');
INSERT INTO emp (empno, ename, sal) VALUES (2912, 'JANE', 4500); -- 암시적 NULL값 입력
INSERT INTO emp (empno, ename, sal, job) VALUES (8381, 'JACK', NULL, NULL); -- 명시적 NULL값 입력
INSERT INTO emp (empno, ename, sal, job) VALUES (8381, 'JACK', '', ''); -- 명시적 NULL값 입력

-- 12일차

UPDATE emp SET sal = 3200 WHERE ename = 'SCOTT';
UPDATE emp SET sal = 5000, comm = 200 WHERE ename = 'SCOTT';

DELETE FROM emp WHERE ename = 'SCOTT';
DELETE FROM emp; -- 모든 행 삭제
TRUNCATE TABLE emp; -- 롤백 불가능
DROP TABLE emp; -- 롤백 불가능

COMMIT; -- 모든 변경 사항을 데이터베이스에 반영
ROLLBACK; -- 모든 변경사항 취소
SAVEPOINT; -- 특정 지점까지의 변경 취소


ALTER TABLE emp ADD loc varchar2(10);
MERGE INTO emp e USING dept d ON (e.deptno = d.deptno) WHEN MATCHED THEN -- MERGE UPDATE절
UPDATE set e.loc = d.loc WHEN NOT MATCHED THEN -- MERGE INSERT절
INSERT (e.empno, e.deptno, e.loc) VALUES (1111, d.deptno, d.loc);
UPDATE EMP e SET loc = (SELECT loc FROM dept d WHERE e.deptno = d.deptno); -- 같은 결과

CREATE TABLE emp2 as SELECT * FROM emp WHERE 1 = 2;
INSERT INTO emp2(empno, ename, sal, deptno) SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 13일차

UPDATE emp SET sal = (SELECT sal FROM emp WHERE ename = 'ALLEN') WHERE job = 'SALESMAN';
UPDATE emp SET (sal, comm) = (SELECT sal, comm FROM emp WHERE ename = 'ALLEN') WHERE ename = 'SCOTT';

DELETE FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'SCOTT');
DELETE FROM emp m WHERE sal > (SELECT avg(sal) FROM emp s WHERE s.deptno = m.deptno); -- 부서 별 평균 월급이 높은 사원 삭제
DELETE FROM emp WHERE sal > (SELECT avg(sal) FROM emp); -- 평균 월급이 높은 사원 삭제

ALTER TABLE dept ADD sumsal number(10);
MERGE INTO dept d USING (SELECT deptno, sum(sal) sumsal FROM emp GROUP BY deptno) v ON (d.deptno = v.deptno)
WHEN MATCHED THEN UPDATE set d.sumsal = v.sumsal;
UPDATE dept d SET sumsal = (SELECT sum(sal) FROM emp e WHERE e.deptno = d.deptno); -- 같은 결과

SELECT rpad(' ', level*3) || ename as employee, level, sal, job FROM emp START WITH ename = 'KING' CONNECT BY prior empno = mgr;

SELECT rpad(' ', level*3) || ename as employee, level, sal, job FROM emp START WITH ename= 'KING'
CONNECT by prior empno = mgr AND ename != 'BLAKE'; -- WHERE절을 쓸 시 BLAKE 본인만 제거

SELECT rpad(' ', level*3) || ename as employee, level, sal, job FROM emp START WITH ename = 'KING'
CONNECT BY prior empno = mgr ORDER SIBLINGS BY sal DESC; -- 서열 순서를 지키면서 월급 순으로 정렬
SELECT rpad(' ', level*3) || ename as employee, level, sal, job FROM emp START WITH ename = 'KING'
CONNECT BY prior empno = mgr ORDER BY sal DESC; -- 서열 순서를 무시하며 월급 순으로 정렬

SELECT ename, SYS_CONNECT_BY_PATH(ename, '/') as path FROM emp START WITH ename = 'KING' CONNECT BY prior empno = mgr;
SELECT ename, LTRIM(SYS_CONNECT_BY_PATH(ename, '/'), '/') as path FROM emp START WITH ename = 'KING' CONNECT BY prior empno = mgr;

-- 14일차

CREATE TABLE EMP01(
EMPNO NUMBER(10),
ENAME VARCHAR2(10),
SAL NUMBER(10, 2),
HIREDATE DATE);

CREATE GLOBAL TEMPORARY TABLE EMP37(
EMPNO NUMBER(10),
ENAME VARCHAR2(10),
SAL NUMBER(10))
ON COMMIT DELETE ROWS; -- 커밋 시 데이터가 사라지는 임시 테이블 생성

INSERT INTO EMP37 VALUES(1111, 'SCOTT', 3000);
SELECT * FROM EMP37;
COMMIT;
SELECT * FROM EMP37; -- 커밋 후에는 데이터가 사라짐

CREATE GLOBAL TEMPORARY TABLE EMP38(
EMPNO NUMBER(10),
ENAME VARCHAR2(10),
SAL NUMBER(10))
ON COMMIT PRESERVE ROWS; -- 세션 종료 시 데이터가 사라지는 임시 테이블 생성

INSERT INTO EMP38 VALUES(1111, 'SCOTT', 3000);
SELECT * FROM EMP38;
COMMIT;
SELECT * FROM EMP38; -- 세션 종료(재접속) 시 데이터가 사라짐

CREATE VIEW EMP_VIEW AS SELECT empno, ename, sal, job, deptno FROM emp WHERE job = 'SALESMAN'; -- 쿼리 단순화
SELECT * FROM EMP_VIEW;
UPDATE EMP_VIEW SET sal = 0 WHERE ename = 'MARTIN';
SELECT * FROM emp WHERE job = 'SALESMAN'; -- VIEW에서 데이터를 수정하면 원본 테이블에 반영됨

CREATE VIEW EMP_VIEW2 AS SELECT deptno, round(avg(sal)) "평균 월급" FROM emp GROUP BY deptno; -- 그룹 함수 사용 시 반드시 칼럼 별칭 포함
SELECT * FROM EMP_VIEW2;
UPDATE EMP_VIEW2 SET 평균 월급 = 3000 WHERE deptno = 30; -- 오류  발생
SELECT e.ename, e.sal, e.deptno, v."평균 월급" FROM emp e, emp_view2 v WHERE e.deptno = v.deptno and e.sal > v."평균 월급"; -- 사용 가능

CREATE INDEX EMP_SAL ON EMP(SAL); -- 검색 속도 향상
SELECT ename, sal FROM emp WHERE sal = 1600;

CREATE SEQUENCE SEQ1 START WITH 1 INCREMENT BY 1 MAXVALUE 100 NOCYCLE;
SELECT max(empno) FROM emp;
INSERT INTO EMP(empno, ename, sal, job, deptno) VALUES(7935, 'JACK', 3400, 'ANALYST', 20);

CREATE TABLE EMP02 (
EMPNO NUMBER(10),
ENAME VARCHAR2(10),
SAL NUMBER(10));

INSERT INTO EMP02 VALUES(SEQ1.NEXTVAL, 'JACK', 3500);
INSERT INTO EMP02 VALUES(SEQ1.NEXTVAL, 'JAMES', 4500);
SELECT * FROM emp02;

SELECT * FROM emp AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE) WHERE ename = 'KING';
SELECT SYSTIMESTAMP FROM dual; SELECT SYSTIMESTAMP - INTERVAL '5' MINUTE FROM dual;
SELECT ename, sal FROM emp WHERE ename = 'KING';
UPDATE EMP SET sal = 0 WHERE ename = 'KING';
COMMIT;
SELECT ename, sal FROM emp AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE) WHERE ename = 'KING'; -- '21/12/29 22:12:43'으로 TIMESTAMP 대체 가능
SELECT name, value FROM V$PARAMETER WHERE name = 'undo_retention';

-- 15일차

DELETE FROM emp WHERE ename = 'KING';
ALTER TABLE emp ENABLE ROW MOVEMENT;
SELECT row_movement FROM user_tables WHERE table_name = 'EMP'; -- 확인 방법
FLASHBACK TABLE emp TO TIMESTAMP TO_TIMESTAMP('21/12/31 00:18:00', 'RR/MM/DD HH24:MI:SS'); -- (SYSTIMESTAMP - INTERVAL '5' MINUTE)로 대체 가능

DROP TABLE EMP;
FLASHBACK TABLE emp TO BEFORE DROP;
DROP TABLE EMP2;
FLASHBACK TABLE emp2 TO BEFORE DROP RENAME TO emp3;

SELECT ename, sal, deptno, versions_starttime, versions_endtime, versions_operation FROM emp VERSIONS BETWEEN TIMESTAMP
TO_TIMESTAMP('2021-12-31 00:55:00', 'RRRR-MM-DD HH24:MI:SS') AND MAXVALUE WHERE ename = 'KING' ORDER BY versions_starttime;
SELECT ename, sal, deptno FROM emp WHERE ename = 'KING';
UPDATE EMP SET sal = 8000 WHERE ename = 'KING'; COMMIT;
UPDATE EMP SET deptno = 20 WHERE ename = 'KING'; COMMIT;
FLASHBACK TABLE emp TO TIMESTAMP TO_TIMESTAMP('21/12/31 00:27:06', 'RR/MM/DD HH24:MI:SS');

SELECT undo_sql FROM flashback_transaction_query WHERE table_owner = 'SCOTT' AND table_name = 'EMP'
AND commit_scn between 9457390 and 9457397 ORDER BY start_timestamp desc;

CREATE TABLE DEPT2 (
DEPTNO NUMBER(10) CONSTRAINT DEPT2_DEPTNO_PK PRIMARY KEY, -- 기본 키 설정(중복, 공백 불가)
DNAME VARCHAR2(14),
LOC VARCHAR2(10));

SELECT a.CONSTRAINT_NAME, a.CONSTRAINT_TYPE, b.COLUMN_NAME FROM USER_CONSTRAINTS a, USER_CONS_COLUMNS b
WHERE a.TABLE_NAME = 'DEPT2' AND a.CONSTRAINT_NAME = b.CONSTRAINT_NAME;

DROP TABLE DEPT2;
CREATE TABLE DEPT2 (
DEPTNO NUMBER(10),
DNAME VARCHAR2(13),
LOC VARCHAR2(10));
ALTER TABLE DEPT2 ADD CONSTRAINT DEPT2_DEPTNO_PK PRIMARY KEY(DEPTNO); -- 테이블 생성 후 기본키(PK) 설정 가능

CREATE TABLE DEPT3 (
DEPTNO NUMBER(10),
DNAME VARCHAR2(14) CONSTRAINT DEPT3_DNAME_UN UNIQUE, -- 고유값(U)(중복 불가)
LOC VARCHAR2(10));

SELECT a.CONSTRAINT_NAME, a.CONSTRAINT_TYPE, b.COLUMN_NAME FROM USER_CONSTRAINTS a, USER_CONS_COLUMNS b
WHERE a.TABLE_NAME = 'DEPT3' AND a.CONSTRAINT_NAME = b.CONSTRAINT_NAME;
;
CREATE TABLE DEPT4(
DEPTNO NUMBER(10),
DNAME VARCHAR2(13),
LOC VARCHAR2(10));
ALTER TABLE DEPT4 ADD CONSTRAINT DEPT4_DNAME_UN UNIQUE(DNAME); -- 테이블 생성 후 고유값 설정 가능

CREATE TABLE DEPT5 (
DEPTNO NUMBER(10),
DNAME VARCHAR2(14),
LOC VARCHAR2(10) CONSTRAINT DEPT5_LOC_NN NOT NULL); -- 공백 불가(NN)

CREATE TABLE DEPT6(
DEPTNO NUMBER(10),
DNAME VARCHAR2(13),
LOC VARCHAR2(10));
ALTER TABLE DEPT6 MODIFY LOC CONSTRAINT DEPT6_LOC_NN NOT NULL; -- 테이블 생성 후 중복 불가 설정 가능(단, 기존 데이터 중에 NULL 값이 존재하지 않아야 함)

CREATE TABLE EMP6(
EMPNO NUMBER(10),
ENAME VARCHAR2(20),
SAL NUMBER(10) CONSTRAINT EMP6_SAL_CK
CHECK (SAL BETWEEN 0 AND 6000)); -- 0에서 6000까지의 값만 입력 가능(CK)

INSERT INTO emp6 VALUES (7839, 'KING', 5000);
INSERT INTO emp6 VALUES (7698, 'BLAKE', 2850);
INSERT INTO emp6 VALUES (7782, 'CLARK', 2450);
INSERT INTO emp6 VALUES (7839, 'JONES', 2975);
UPDATE emp6 SET sal = 9000 WHERE ename = 'CLARK'; -- 오류
INSERT INTO emp6 VALUES (7566, 'ADAMS', 9000); -- 오류

ALTER TABLE emp6 DROP CONSTRAINT emp6_sal_ck; -- 범위 삭제
INSERT INTO emp6 VALUES (7566, 'ADAMS', 9000); -- 정상 작동
COMMIT;
DELETE FROM emp6 WHERE ename = 'ADAMS';
ALTER TABLE emp6 ADD CONSTRAINT emp6_sal_ck check (sal between 0 and 6000); -- 범위 추가

-- 16일차

CREATE TABLE DEPT7 (
DEPTNO NUMBER(10) CONSTRAINT DEPT7_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(10));

CREATE TABLE EMP7 (
EMPNO NUMBER(10),
ENAME VARCHAR2(20),
SAL NUMBER(10),
DEPTNO NUMBER(10) CONSTRAINT EMP7_DEPTNO_FK REFERENCES DEPT7(DEPTNO)); -- 외래키(FK) 특정 데이터와 연동

ALTER TABLE DEPT7 DROP CONSTRAINT DEPT7_DEPTNO_PK; -- 오류(고유값 삭제 불가능)
ALTER TABLE DEPT7 DROP CONSTRAINT DEPT7_DEPTNO_PK cascade; -- 삭제 가능(EMP7의 외래키도 삭제)

WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) as 토탈 FROM EMP GROUP BY JOB)
SELECT JOB, 토탈 FROM JOB_SUMSAL WHERE 토탈 > (SELECT AVG(토탈) FROM JOB_SUMSAL);
SELECT JOB, SUM(SAL) as 토탈 FROM EMP GROUP BY JOB HAVING SUM(SAL) > (SELECT AVG(SUM(SAL)) FROM EMP GROUP BY JOB); -- 실행 시간이 더 긺

WITH JOB_SUMSAL AS (SELECT JOB, SUM(SAL) 토탈 FROM EMP GROUP BY JOB),
DEPTNO_SUMSAL AS (SELECT DEPTNO, SUM(SAL) 토탈 FROM EMP GROUP BY DEPTNO HAVING SUM(SAL) > (SELECT AVG(토탈) + 3000 FROM JOB_SUMSAL))
SELECT DEPTNO, 토탈 FROM DEPTNO_SUMSAL;
SELECT DEPTNO, SUM(SAL) 토탈 FROM (SELECT JOB, SUM(SAL) 토탈 FROM EMP GROUP BY JOB) AS JOB_SUMSAL,
(SELECT DEPTNO, SUM(SAL) 토탈 FROM EMP GROUP BY DEPTNO HAVING SUM(SAL) > (SELECT AVG(토탈) + 3000 FROM JOB_SUMSAL)) DEPTNO_SUMSAL; -- 오류

WITH LOOP_TABLE as (SELECT LEVEL as NUM FROM DUAL CONNECT BY LEVEL <= 9)
SELECT '2' || ' x ' || NUM || ' = ' || 2 * NUM AS "2단" FROM LOOP_TABLE;
SELECT LEVEL as NUM FROM dual CONNECT BY LEVEL <= 9; -- 1에서 9까지의 자연수

WITH LOOP_TABLE AS (SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= 9),
GUGU_TABLE AS (SELECT LEVEL + 1 AS GUGU FROM DUAL CONNECT BY LEVEL <= 8)
SELECT TO_CHAR(A.NUM) || ' X ' || TO_CHAR(B.GUGU) || ' = ' || TO_CHAR(B.GUGU * A.NUM) as 구구단 FROM LOOP_TABLE A, GUGU_TABLE B;

WITH LOOP_TABLE AS (SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= 8) SELECT LPAD('★', num, '★') as STAR FROM LOOP_TABLE; -- 직각 삼각형 출력
SELECT LPAD('★', 10, '★') as STAR FROM dual; -- 전체 10자리를 잡고 별 하나를 출력 후, 나머지 9자리에 별을 채워넣음

WITH LOOP_TABLE AS (SELECT LEVEL as NUM FROM dual CONNECT BY LEVEL <= 8)
SELECT LPAD(' ', 10 - NUM, ' ') || LPAD('★', NUM, '★') as "Triangle" FROM LOOP_TABLE; -- 삼각형 출력

undefine 숫자1
undefine 숫자2
WITH LOOP_TABLE AS (SELECT LEVEL as NUM FROM dual CONNECT BY LEVEL <= &숫자1)
SELECT LPAD(' ', &숫자2 - NUM, ' ') || LPAD('★', NUM, '★') as "Triangle" FROM LOOP_TABLE; -- 치환변수 사용

undefine p_num
ACCEPT p_num prompt '숫자 입력 : '
SELECT lpad(' ', &p_num - level, ' ') || rpad('★', level, '★') as star FROM dual CONNECT BY level <&p_num + 1
UNION ALL SELECT lpad(' ', level, ' ') || rpad('★', &p_num - level, '★') as star FROM dual CONNECT BY level < &p_num; -- 치환변수를 사용해 마름모 출력

-- 17일차

undefine p_n1
undefine p_n2
ACCEPT p_n1 prompt '가로 숫자를 입력하세요~';
ACCEPT p_n2 prompt '세로 숫자를 입력하세요~';
WITH LOOP_TABLE as (SELECT LEVEL as NUM FROM DUAL CONNECT BY LEVEL <= &p_n2)
SELECT LPAD('★', &p_n1, '★') as STAR FROM LOOP_TABLE;

undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:~';
SELECT SUM(LEVEL) as 합계 FROM DUAL CONNECT BY LEVEL <= &p_n;

undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:';
SELECT ROUND(EXP(SUM(LN(LEVEL)))) 곱 FROM DUAL CONNECT BY LEVEL <= &p_n;

undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:';
SELECT LEVEL, LISTAGG(LEVEL, ', ') 짝수 FROM DUAL WHERE MOD(LEVEL, 2) = 0 CONNECT BY LEVEL <= &p_n; -- 해결불가(보류)

undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:'
WITH LOOP_TABLE as (SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= &p_n)
SELECT L1.NUM 소수 FROM LOOP_TABLE L1, LOOP_TABLE L2 WHERE MOD(L1.NUM, L2.NUM) = 0 GROUP BY L1.NUM HAVING COUNT(L1.NUM) = 2; -- 소수 출력

WITH LOOP_TABLE as (SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <=10)
SELECT L1.NUM, COUNT(L1.NUM) FROM LOOP_TABLE L1, LOOP_TABLE L2 WHERE MOD(L1.NUM, L2.NUM) = 0 GROUP BY L1.NUM; -- 2가 출력된 숫자가 소수

ACCEPT p_n1 prompt '첫번째 숫자를 입력하세요.';
ACCEPT p_n2 prompt '두번째 숫자를 입력하세요.';
WITH NUM_D AS (SELECT &p_n1 as NUM1, &p_n2 as NUM2 FROM DUAL)
SELECT MAX(LEVEL) AS "최대 공약수" FROM NUM_D WHERE MOD(NUM1, LEVEL) = 0 AND MOD(NUM2, LEVEL) = 0 CONNECT BY LEVEL <= NUM2;

ACCEPT P_N1 PROMPT '첫번째 숫자를 입력하세요.';
ACCEPT P_N2 PROMPT '두번째 숫자를 입력하세요.';
WITH NUM_D AS (SELECT &P_N1 NUM1, &P_N2 NUM2 FROM DUAL)
SELECT NUM1, NUM2, (NUM1/MAX(LEVEL)) * (NUM2/MAX(LEVEL)) * MAX(LEVEL) AS "최소 공배수" FROM NUM_D
WHERE MOD(NUM1, LEVEL) = 0 AND MOD(NUM2, LEVEL) = 0 CONNECT BY LEVEL <= NUM2;

ACCEPT NUM1 REPORT '밑변의 길이를 입력하세요 ~ ';
ACCEPT NUM2 REPORT '높이를 입력하세요 ~ ';
ACCEPT NUM3 REPORT '빗변의 길이를 입력하세요 ~ ';
SELECT CASE WHEN (POWER(&NUM1, 2) + POWER(&NUM2, 2)) = POWER(&NUM3, 2)
THEN '직각삼각형이 맞습니다' ELSE '직각삼각형이 아닙니다'
END AS "피타고라스의 정리" FROM DUAL;

SELECT SUM(CASE WHEN (POWER(NUM1, 2) + POWER(NUM2, 2)) <= 1 THEN 1 ELSE 0 END) / 100000 * 4 as 원주율
FROM (SELECT DBMS_RANDOM.VALUE(0, 1) AS NUM1, DBMS_RANDOM.VALUE(0, 1) AS NUM2 FROM DUAL CONNECT BY LEVEL < 100000);

WITH LOOP_TABLE AS (SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= 1000000)
SELECT RESULT FROM (SELECT NUM, POWER((1 + 1 / NUM), NUM) AS RESULT FROM LOOP_TABLE) WHERE NUM = 1000000;

-- 18일차

CREATE TABLE CANCER (
암종 VARCHAR2(50),
질병코드 VARCHAR2(20),
환자수 NUMBER(10),
성별 VARCHAR2(20),
조유병률 NUMBER(10, 2),
생존률 NUMBER(10, 2));

CREATE TABLE SPEECH(SPEECH_TEXT VARCHAR2(1000));

SELECT count(*) FROM speech;
SELECT REGEXP_SUBSTR('I never graduated from college', '[^ ]+', 1, 2) word FROM dual;
SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word FROM speech, (SELECT level a FROM dual CONNECT BY level <= 52);
SELECT word, count(*) FROM (SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word FROM speech, (SELECT level a FROM dual CONNECT BY level <= 52))
WHERE word is not null GROUP BY word ORDER BY count(*) desc;

CREATE TABLE POSITIVE (P_TEXT VARCHAR2(2000));
CREATE TABLE NEGATIVE (N_TEXT VARCHAR2(2000));

CREATE VIEW SPEECH_VIEW AS SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
FROM speech, (SELECT level a FROM dual CONNECT BY LEVEL <= 52);

SELECT count(word) as "긍정 단어" FROM speech_view WHERE lower(word) IN (SELECT lower(p_text) FROM positive);
SELECT count(word) as "부정 단어" FROM speech_view WHERE lower(word) IN (SELECT lower(n_text) FROM negative);

CREATE TABLE CRIME_DAY (
CRIME_TYPE VARCHAR2(50),
SUN_CNT NUMBER(10),
MON_CNT NUMBER(10),
TUE_CNT NUMBER(10),
WED_CNT NUMBER(10),
THU_CNT NUMBER(10),
FRI_CNT NUMBER(10),
SAT_CNT NUMBER(10),
UNKNOWN_CNT NUMBER(10));

CREATE TABLE CRIME_DAY_UNPIVOT AS
SELECT * FROM CRIME_DAY UNPIVOT (CNT FOR DAY_CNT IN (SUN_CNT, MON_CNT, TUE_CNT, WED_CNT, THU_CNT, FRI_CNT, SAT_CNT));

SELECT * FROM (SELECT DAY_CNT, CNT, RANK() OVER (ORDER BY CNT DESC) RNK FROM CRIME_DAY_UNPIVOT WHERE TRIM(CRIME_TYPE) = '절도')
WHERE RNK = 1;

CREATE TABLE UNIVERSITY_FEE (
DIVISION VARCHAR2(20),
TYPE VARCHAR2(20),
UNIVERSITY VARCHAR2(60),
LOC VARCHAR2(40),
ADMISSION_CNT NUMBER(20),
ADMISSION_FEE NUMBER(20),
TUITION_FEE NUMBER(20));

SELECT * FROM (SELECT UNIVERSITY, TUITION_FEE, RANK() OVER (ORDER BY TUITION_FEE DESC NULLS LAST) 순위 FROM UNIVERSITY_FEE)
WHERE 순위 = 1;

CREATE TABLE PRICE(
P_SEQ NUMBER(10),
M_SEQ NUMBER(10),
M_NAME VARCHAR2(80),
A_SEQ NUMBER(10),
A_NAME VARCHAR2(60),
A_UNIT VARCHAR2(40),
A_PRICE NUMBER(10),
P_YEAR_MONTH VARCHAR2(30),
ADD_COL VARCHAR2(100),
M_TYPE_CODE VARCHAR2(20),
M_TYPE_NAME VARCHAR2(20),
M_GU_CODE VARCHAR2(10),
M_GU_NAME VARCHAR2(30));

SELECT A_NAME as 상품, A_PRICE as 가격, M_NAME as 매장명 FROM PRICE WHERE A_PRICE = (SELECT MAX(A_PRICE) FROM PRICE);

CREATE TABLE CRIME_LOC (
CRIME_TYPE VARCHAR2(100),
C_LOC VARCHAR2(100),
CRIME_CNT NUMBER(10));

SELECT * FROM (SELECT c_loc, cnt, rank() over (order by cnt desc) rnk FROM crime_loc WHERE crime_type = '살인') WHERE rnk = 1;

-- 19일차

CREATE TABLE CRIME_CAUSE (
"범죄 유형" VARCHAR2(20),
생계형 NUMBER(10),
유흥 NUMBER(10),
도박 NUMBER(10),
허영심 NUMBER(10),
복수 NUMBER(10),
해고 NUMBER(10),
징벌 NUMBER(10),
가정불화 NUMBER(10),
호기심 NUMBER(10),
유혹 NUMBER(10),
사고 NUMBER(10),
불만 NUMBER(10),
부주의 NUMBER(10),
기타 NUMBER(10));

CREATE TABLE CRIME_CAUSE2 AS
SELECT * FROM CRIME_CAUSE UNPIVOT (CNT FOR TERM IN (생계형, 유흥, 도박, 허영심, 복수, 해고, 징벌, 가정불화, 호기심, 유혹, 사고, 불만, 부주의, 기타));

SELECT "범죄 유형" FROM CRIME_CAUSE2 WHERE CNT = (SELECT MAX(CNT) FROM CRIME_CAUSE2 WHERE TERM =  '가정불화') AND TERM = '가정불화';

SELECT TERM AS 원인 FROM CRIME_CAUSE2 WHERE CNT = (SELECT MAX(CNT) FROM CRIME_CAUSE2 WHERE "범죄 유형" = '방화');

CREATE TABLE ACC_LOC_DATA(
ADD_LOC_NO NUMBER(10),
ACC_YEAR NUMBER(10),
ACC_TYPE VARCHAR2(20),
ACC_LOC_CODE NUMBER(10),
CITY_NAME VARCHAR2(50),
ACC_LOC_NAME VARCHAR2(200),
ACC_CNT NUMBER(10),
AL_CNT NUMBER(10),
DEAD_CNT NUMBER(10),
M_INJURY_CNT NUMBER(10),
L_INJURY_CNT NUMBER(10),
H_INJURY_CNT NUMBER(10),
LAT NUMBER(15, 8),
LOT NUMBER(15, 8),
DATA_UPDATE_DATE DATE);

SELECT * FROM (SELECT ACC_LOC_NAME AS "사고 장소", ACC_CNT AS "사고 건수", DENSE_RANK () OVER (ORDER BY ACC_CNT DESC NULLS LAST) AS 순위
FROM ACC_LOC_DATA WHERE ACC_YEAR = 2017) WHERE 순위 <= 5;

CREATE TABLE CLOSING (
연도 NUMBER(10),
미용실 NUMBER(10),
양식집 NUMBER(10),
일식집 NUMBER(10),
치킨집 NUMBER(10),
커피음료 NUMBER(10),
한식음식점 NUMBER(10),
호프간이주점 NUMBER(10));

SELECT * FROM CLOSING;
SELECT 연도 "치킨집 폐업 연도", 치킨집 "건수" FROM (SELECT 연도, 치킨집, rank() over (order by 치킨집 desc) 순위 FROM closing) WHERE 순위 = 1;

CREATE TABLE WORKING_TIME (
COUNTRY VARCHAR2(30),
Y_2014 NUMBER(10),
Y_2015 NUMBER(10),
Y_2016 NUMBER(10),
Y_2017 NUMBER(10),
Y_2018 NUMBER(10));

CREATE VIEW C_WORK_TIME AS SELECT * FROM WORKING_TIME UNPIVOT (CNT FOR Y_YEAR IN (Y_2014, Y_2015, Y_2016, Y_2017, Y_2018));
SELECT COUNTRY, CNT, RANK() OVER (ORDER BY CNT DESC) 순위 FROM C_WORK_TIME WHERE Y_YEAR = 'Y_2018';

CREATE TABLE CANCER (
암종 VARCHAR2(50),
질병코드 VARCHAR2(20),
환자수 NUMBER(10),
성별 VARCHAR2(20),
조유병률 NUMBER(10, 2),
생존률 NUMBER(10, 2));

SELECT DISTINCT(암종), 성별, 환자수 FROM CANCER WHERE 환자수 = (SELECT MAX(환자수) FROM CANCER WHERE 성별 = '남자' AND 암종 <> '모든암')
UNION ALL
SELECT DISTINCT(암종), 성별, 환자수 FROM CANCER WHERE 환자수 = (SELECT MAX(환자수) FROM CANCER WHERE 성별 = '여자' AND 암종 != '모든암');

-- 26일차

DROP TABLE NAIVE_FLU_TRAIN;

CREATE TABLE NAIVE_FLU_TRAIN(
PATIENT_ID NUMBER(10),
CHILLS VARCHAR2(2),
RUNNY_NOSE VARCHAR2(2),
HEADACHE VARCHAR2(10),
FEVER VARCHAR2(2),
FLU VARCHAR2(2));

INSERT INTO NAIVE_FLU_TRAIN VALUES(1, 'Y', 'N', 'MILD', 'Y', 'N');
INSERT INTO NAIVE_FLU_TRAIN VALUES(2, 'Y', 'Y', 'NO', 'N', 'Y');
INSERT INTO NAIVE_FLU_TRAIN VALUES(3, 'Y', 'N', 'STRONG', 'Y', 'Y');
INSERT INTO NAIVE_FLU_TRAIN VALUES(4, 'N', 'Y', 'MILD', 'Y', 'Y');
INSERT INTO NAIVE_FLU_TRAIN VALUES(5, 'N', 'N', 'NO', 'N', 'N');
INSERT INTO NAIVE_FLU_TRAIN VALUES(6, 'N', 'Y', 'STRONG', 'Y', 'Y');
INSERT INTO NAIVE_FLU_TRAIN VALUES(7, 'N', 'Y', 'STRONG', 'N', 'N');
INSERT INTO NAIVE_FLU_TRAIN VALUES(8, 'Y', 'Y', 'MILD', 'Y', 'Y');
COMMIT;

DROP TABLE NAIVE_FLU_TEST;

CREATE TABLE NAIVE_FLU_TEST(
PATIENT_ID NUMBER(10),
CHILLS VARCHAR2(2),
RUNNY_NOSE VARCHAR2(2),
HEADACHE VARCHAR2(10),
FEVER VARCHAR2(2),
FLU VARCHAR2(2));

INSERT INTO NAIVE_FLU_TEST VALUES(9, 'Y', 'N', 'MILD', 'N', NULL);
COMMIT;

DROP TABLE SETTINGS_GLM;

CREATE TABLE SETTINGS_GLM AS SELECT * FROM TABLE (DBMS_DATA_MINING.GET_DEFAULT_SETTINGS) WHERE SETTING_NAME LIKE '%GLM%';

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_CLASSIFICATION_MODEL';
SELECT T.*, PREDICTION(MD_CLASSIFICATION_MODEL USING *) 예측값 FROM NAIVE_FLU_TEST T;

DROP TABLE MUSHROOMS;

CREATE TABLE MUSHROOMS (
ID NUMBER(10),
TYPE VARCHAR2(10),
CAP_SHAPE VARCHAR2(10),
CAP_SURFACE VARCHAR2(10),
CAP_COLOR VARCHAR2(10),
BRUISES VARCHAR2(10),
ODOR VARCHAR2(10),
GILL_ATTACHMENT VARCHAR2(10),
GILL_SPACING VARCHAR2(10),
GILL_SIZE VARCHAR2(10),
GILL_COLOR VARCHAR2(10),
STALK_SHAPE VARCHAR2(10),
STALK_ROOT VARCHAR2(10),
STALK_SURFACE_ABOVE_RING VARCHAR2(10),
STALK_SURFACE_BELOW_RING VARCHAR2(10),
STALK_COLOR_ABOVE_RING VARCHAR2(10),
STALK_COLOR_BELOW_RING VARCHAR2(10),
VEIL_TYPE VARCHAR2(10),
VEIL_COLOR VARCHAR2(10),
RING_NUMBER VARCHAR2(10),
RING_TYPE VARCHAR2(10),
SPORE_PRINT_COLOR VARCHAR2(10),
POPULATION VARCHAR2(10),
HABITAT VARCHAR2(10));

DROP TABLE MUSHROOMS_TRAINING;
CREATE TABLE MUSHROOMS_TRAINING AS SELECT * FROM MUSHROOMS WHERE ID < 7312;
DROP TABLE MUSHROOMS_TEST;
CREATE TABLE MUSHROOMS_TEST AS SELECT * FROM MUSHROOMS WHERE ID >= 7312;

SELECT ID, CAP_SHAPE, CAP_SURFACE, CAP_COLOR, BRUISES, ODOR, TYPE 실제값, PREDICTION (MD_CLASSIFICATION_MODEL USING *) 예측값
FROM MUSHROOMS_TEST T WHERE ID IN (7620, 7621, 7622, 7623);
SELECT SUM(DECODE(P.MODEL_PREDICT_RESPONSE, I.TYPE, 1, 0)) / COUNT(*) 정확도
FROM (SELECT ID, PREDICTION (MD_CLASSIFICATION_MODEL USING *) MODEL_PREDICT_RESPONSE FROM MUSHROOMS_TEST T) P, MUSHROOMS I
WHERE P.ID = I.ID;

DROP TABLE HR_DATA;

CREATE TABLE HR_DATA(
EMP_ID NUMBER,
SATISFACTION_LEVEL NUMBER,
LAST_EVALUATION NUMBER,
NUMBER_PROJECT NUMBER,
AVERAGE_MONTLY_HOURS NUMBER,
TIME_SPEND_COMPANY NUMBER,
WORK_ACCIDENT NUMBER,
LEFT NUMBER,
PROMOTION_LAST_5YEARS NUMBER,
SALES VARCHAR2(20),
SALARY VARCHAR2(20));

DROP TABLE HR_DATA_MAIN;
CREATE TABLE HR_DATA_MAIN AS SELECT * FROM HR_DATA;
DROP TABLE HR_DATA_TRAINING;
CREATE TABLE HR_DATA_TRAINING AS SELECT * FROM HR_DATA_MAIN WHERE EMP_ID < 10500;
DROP TABLE HR_DATA_TEST;
CREATE TABLE HR_DATA_TEST AS SELECT * FROM HR_DATA_MAIN WHERE EMP_ID >= 10500;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'DT_MODEL';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'DT_MODEL';
SELECT EMP_ID, T.LEFT 실제값, PREDICTION (DT_MODEL USING *) 예측값, PREDICTION_PROBABILITY (DT_MODEL USING *) "모델이 예측할 확률" FROM HR_DATA_TEST T;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'DT_MODEL2';

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'DT_MODEL3';
SELECT EMP_ID, T.LEFT 실제값, PREDICTION (DT_MODEL3 USING *) 예측값, PREDICTION_PROBABILITY (DT_MODEL3 USING *) "예측한 확률"
FROM HR_DATA_TEST T WHERE ROWNUM < 6;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'DT_MODEL4';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'DT_MODEL4';

-- 27일차

DROP TABLE CONCRETE;

CREATE TABLE CONCRETE(
C_ID NUMBER(10),
CEMENT NUMBER(20, 4),
SLAG NUMBER(20, 4),
ASH NUMBER(20, 4),
WATER NUMBER(20, 4),
SUPERPLASTIC NUMBER(20, 4),
COARSEAGG NUMBER(20, 4),
FINEAGG NUMBER(20, 4),
AGE NUMBER(20, 4),
STRENGTH NUMBER(20, 4));

DROP TABLE CONCRETE_TRAIN;
CREATE TABLE CONCRETE_TRAIN AS SELECT * FROM CONCRETE WHERE C_ID < 931;
DROP TABLE CONCRETE_TEST;
CREATE TABLE CONCRETE_TEST AS SELECT * FROM CONCRETE WHERE C_ID >= 931;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_GLM_MODEL';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'MD_GLM_MODEL' AND SETTING_NAME = 'NNET_HIDDEN_LAYERS';
SELECT C_ID, STRENGTH 실제값, ROUND(PREDICTION(MD_GLM_MODEL USING *), 2) 예측값 FROM CONCRETE_TEST;
SELECT ROUND(CORR(PREDICTED_VALUE, STRENGTH), 2) 상관관계
FROM (SELECT C_ID, PREDICTION(MD_GLM_MODEL USING *) PREDICTED_VALUE, PREDICTION_PROBABILITY(MD_GLM_MODEL USING *) PROB, STRENGTH FROM CONCRETE_TEST);

SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS
WHERE MODEL_NAME = 'MD_GLM_MODEL' AND SETTING_NAME IN ('NNET_HIDDEN_LAYERS', 'NNET_NODES_PER_LAYER');
SELECT C_ID, STRENGTH 실제값, ROUND(PREDICTION(MD_GLM_MODEL USING *), 2) 예측값 FROM CONCRETE_TEST;
SELECT ROUND(CORR(PREDICTED_VALUE, STRENGTH), 2) 상관관계
FROM (SELECT C_ID, PREDICTION(MD_GLM_MODEL USING *) PREDICTED_VALUE, PREDICTION_PROBABILITY(MD_GLM_MODEL USING *) PROB, STRENGTH FROM CONCRETE_TEST);

DROP TABLE WISC_BC_DATA;

CREATE TABLE WISC_BC_DATA(
ID NUMBER(10),
DIAGNOSIS VARCHAR2(5),
RADIUS_MEAN NUMBER(20, 7),
TEXTURE_MEAN NUMBER(20, 7),
PERIMETER_MEAN NUMBER(20, 7),
AREA_MEAN NUMBER(20, 7),
SMOOTHNESS_MEAN NUMBER(20, 7),
COMPACTNESS_MEAN NUMBER(20, 7),
CONCAVITY_MEAN NUMBER(20, 7),
POINTS_MEAN NUMBER(20, 7),
SYMMETRY_MEAN NUMBER(20, 7),
DIMENSION_MEAN NUMBER(20, 7),
RADIUS_SE NUMBER(20, 7),
TEXTURE_SE NUMBER(20, 7),
PERIMETER_SE NUMBER(20, 7),
AREA_SE NUMBER(20, 7),
SMOOTHNESS_SE NUMBER(20, 7),
COMPACTNESS_SE NUMBER(20, 7),
CONCAVITY_SE NUMBER(20, 7),
POINTS_SE NUMBER(20, 7),
SYMMETRY_SE NUMBER(20, 7),
DIMENSION_SE NUMBER(20, 7),
RADIUS_WORST NUMBER(20, 7),
TEXTURE_WORST NUMBER(20, 7),
PERIMETER_WORST NUMBER(20, 7),
AREA_WORST NUMBER(20, 7),
SMOOTHNESS_WORST NUMBER(20, 7),
COMPACTNESS_WORST NUMBER(20, 7),
CONCAVITY_WORST NUMBER(20, 7),
POINTS_WORST NUMBER(20, 7),
SYMMETRY_WORST NUMBER(20, 7),
DIMENSION_WORST NUMBER(20, 7));

DROP TABLE WISC_BC_DATA_TRAINING;
CREATE TABLE WISC_BC_DATA_TRAINING AS SELECT * FROM WISC_BC_DATA WHERE ROWNUM < 501;
DROP TABLE WISC_BC_DATA_TEST;
CREATE TABLE WISC_BC_DATA_TEST AS SELECT * FROM WISC_BC_DATA MINUS SELECT * FROM WISC_BC_DATA_TRAINING;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'WC_MODEL';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'WC_MODEL';

DROP TABLE WC_DATA_TEST_MATRIX;

CREATE OR REPLACE VIEW VIEW_WISC_BC_DATA_TEST AS
SELECT ID, DIAGNOSIS, PREDICTION(WC_MODEL USING *) PREDICTED_VALUE, PREDICTION_PROBABILITY(WC_MODEL USING *) PROBABILITY FROM WISC_BC_DATA_TEST;
SELECT ID "환자 번호", DIAGNOSIS 실제값, PREDICTED_VALUE 예측값, PROBABILITY "예측 확률" FROM VIEW_WISC_BC_DATA_TEST WHERE id in (87930, 91858, 92751, 842517, 845636);

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'WC_MODEL';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'WC_MODEL';

-- 28일차

DROP TABLE STUDENT_SCORE;

CREATE TABLE STUDENT_SCORE(
ST_ID NUMBER(10),
ACADEMIC NUMBER(20, 8),
SPORTS NUMBER(30, 10),
MUSIC NUMBER(30, 10),
ACCEPTANCE NUMBER(30, 10));

DROP TABLE STUDENT_SCORE_TRAINING;
CREATE TABLE STUDENT_SCORE_TRAINING AS SELECT * FROM STUDENT_SCORE WHERE ST_ID < 181;
DROP TABLE STUDENT_SCORE_TEST;
CREATE TABLE STUDENT_SCORE_TEST AS SELECT * FROM STUDENT_SCORE WHERE ST_ID >= 181;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_REG_MODEL1';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'MD_REG_MODEL1';

SELECT ST_ID "학생 번호", ACADEMIC "학과 점수", ROUND(MUSIC, 2) "음악 점수", SPORTS "체육 점수", ROUND(ACCEPTANCE, 2) "실제 점수", ROUND(MODEL_PREDICT_RESPONSE,2) "예측 점수"
FROM (SELECT T.*, PREDICTION (MD_REG_MODEL1 USING * ) MODEL_PREDICT_RESPONSE FROM STUDENT_SCORE_TEST T);
SELECT * FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLOBAL(MODEL_NAME => 'MD_REG_MODEL1'))
WHERE GLOBAL_DETAIL_NAME IN ('R_SQ', 'ADJUSTED_R_SQUARE');
SELECT ATTRIBUTE_NAME, COEFFICIENT FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLM ('MD_REG_MODEL1'));

DROP TABLE INSURANCE;

CREATE TABLE INSURANCE(
ID NUMBER(10),
AGE NUMBER(3),
SEX VARCHAR2(10),
BMI NUMBER(10, 2),
CHILDREN NUMBER(2),
SMOKER VARCHAR2(10),
REGION VARCHAR2(20),
EXPENSES NUMBER(10, 2));

DROP TABLE INSURANCE_TRAINING;
CREATE TABLE INSURANCE_TRAINING AS SELECT * FROM INSURANCE WHERE ID < 1114;
DROP TABLE INSURANCE_TEST;
CREATE TABLE INSURANCE_TEST AS SELECT * FROM INSURANCE WHERE ID >= 1114;

SELECT ATTRIBUTE_NAME, ATTRIBUTE_VALUE, ROUND(COEFFICIENT) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLM ('MD_REG_MODEL2'));
SELECT ID, AGE, SEX, EXPENSES, ROUND(PREDICTION (MD_REG_MODEL2 USING * ), 2) MODEL_PREDICT_RESPONSE FROM INSURANCE_TEST T;
SELECT GLOBAL_DETAIL_NAME, ROUND(GLOBAL_DETAIL_VALUE, 3) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLOBAL
(MODEL_NAME => 'MD_REG_MODEL2')) WHERE GLOBAL_DETAIL_NAME IN ('R_SQ', 'ADJUSTED_R_SQUARE');

ALTER TABLE INSURANCE DROP COLUMN BMI30;
ALTER TABLE INSURANCE ADD BMI30 NUMBER(10);
UPDATE INSURANCE I SET BMI30 = (SELECT CASE WHEN BMI >= 30 AND SMOKER = 'yes' THEN 1 ELSE 0 END FROM INSURANCE S WHERE S.ROWID = I.ROWID);
COMMIT;

DROP TABLE INSURANCE_TRAINING;
CREATE TABLE INSURANCE_TRAINING AS SELECT * FROM INSURANCE WHERE ID < 1114;
DROP TABLE INSURANCE_TEST;
CREATE TABLE INSURANCE_TEST AS SELECT * FROM INSURANCE WHERE ID >= 1114;

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_REG_MODEL3';
SELECT ATTRIBUTE_NAME, ATTRIBUTE_VALUE, ROUND(COEFFICIENT) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLM ('MD_REG_MODEL3'));
SELECT GLOBAL_DETAIL_NAME, ROUND(GLOBAL_DETAIL_VALUE, 3) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLOBAL
(MODEL_NAME => 'MD_REG_MODEL3')) WHERE GLOBAL_DETAIL_NAME IN ('R_SQ', 'ADJUSTED_R_SQUARE');

ALTER TABLE INSURANCE DROP COLUMN AGE2;
ALTER TABLE INSURANCE ADD AGE2 NUMBER(10);
UPDATE INSURANCE SET AGE2 = AGE * AGE;
COMMIT;

DROP TABLE INSURANCE_TRAINING;
CREATE TABLE INSURANCE_TRAINING AS SELECT * FROM INSURANCE WHERE ID < 1114;
DROP TABLE INSURANCE_TEST;
CREATE TABLE INSURANCE_TEST AS SELECT * FROM INSURANCE WHERE ID >= 1114;

SELECT MODEL_NAME, ALGORITHM, CREATION_DATE, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_REG_MODEL4';
SELECT ATTRIBUTE_NAME, ATTRIBUTE_VALUE, ROUND(COEFFICIENT) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLM ('MD_REG_MODEL4'));
SELECT GLOBAL_DETAIL_NAME, ROUND(GLOBAL_DETAIL_VALUE, 3) FROM TABLE (DBMS_DATA_MINING.GET_MODEL_DETAILS_GLOBAL
(MODEL_NAME => 'MD_REG_MODEL3')) WHERE GLOBAL_DETAIL_NAME IN ('R_SQ', 'ADJUSTED_R_SQUARE');

-- 29일차

ALTER SESSION SET NLS_DATE_FORMAT = 'RRRR-MM-DD';

DROP TABLE MARKET_TABLE;

CREATE TABLE MARKET_TABLE (
CUST_ID NUMBER(10),
STOCK_CODE NUMBER(10),
STOCK_NAME VARCHAR2(30),
QUANTITY NUMBER(10),
STOCK_PRICE NUMBER(10, 2),
BUY_DATE DATE);

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_ASSOC_ANALYSIS';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'MD_ASSOC_ANALYSIS';
SELECT A.ATTRIBUTE_SUBNAME ANTECEDENT, C.ATTRIBUTE_SUBNAME CONSEQUENT, ROUND(RULE_SUPPORT, 3) SUPPORT,
ROUND(RULE_CONFIDENCE, 3) CONFIDENCE, ROUND(RULE_LIFT, 3) LIFT FROM TABLE (DBMS_DATA_MINING.GET_ASSOCIATION_RULES('MD_ASSOC_ANALYSIS', 10)) T,
TABLE (T.CONSEQUENT) C, TABLE (T.ANTECEDENT) A ORDER BY SUPPORT DESC, LIFT DESC;

DROP TABLE ONLINE_RETAIL;

CREATE TABLE ONLINE_RETAIL (
INVOICENO VARCHAR2(100),
STOCKCODE VARCHAR2(100),
DESCRIPTION VARCHAR2(200),
QUANTITY NUMBER(10, 2),
INVOICEDATE DATE,
UNITPRICE NUMBER(10, 2),
CUSTOMERID NUMBER(10, 2),
COUNTRY VARCHAR2(100));

SELECT MODEL_NAME, ALGORITHM, MINING_FUNCTION FROM ALL_MINING_MODELS WHERE MODEL_NAME = 'MD_ASSOC_ANALYSIS2';
SELECT SETTING_NAME, SETTING_VALUE FROM ALL_MINING_MODEL_SETTINGS WHERE MODEL_NAME = 'MD_ASSOC_ANALYSIS2';
SELECT A.ATTRIBUTE_SUBNAME ANTECEDENT, C.ATTRIBUTE_SUBNAME CONSEQUENT, ROUND(RULE_SUPPORT, 3) SUPPORT,
ROUND(RULE_CONFIDENCE, 3) CONFIDENCE, ROUND(RULE_LIFT, 3) LIFT FROM TABLE (DBMS_DATA_MINING.GET_ASSOCIATION_RULES('MD_ASSOC_ANALYSIS2', 10)) T,
TABLE (T.CONSEQUENT) C, TABLE (T.ANTECEDENT) A ORDER BY SUPPORT DESC, LIFT DESC;

-- 30일차

DROP TABLE FRUIT;

CREATE TABLE FRUIT (
F_ID NUMBER(10),
F_NAME VARCHAR2(10),
SWEET NUMBER(10),
CRISPY NUMBER(10),
F_CLASS VARCHAR2(10));

INSERT INTO FRUIT VALUES(1, '사과', 10, 9, '과일');
INSERT INTO FRUIT VALUES(2, '베이컨', 1, 4, '단백질');
INSERT INTO FRUIT VALUES(3, '바나나', 10, 1, '과일');
INSERT INTO FRUIT VALUES(4, '당근', 7, 10, '채소');
INSERT INTO FRUIT VALUES(5, '샐러리', 3, 10, '채소');
INSERT INTO FRUIT VALUES(6, '치즈', 1, 1, '단백질');
INSERT INTO FRUIT VALUES(7, '토마토', 6, 7, NULL);
COMMIT;

SELECT T2.F_NAME, T2.F_CLASS, T1.CLUSTER_ID, T1.PROBABILITY, T2.SWEET, T2.CRISPY
FROM (SELECT F_ID, CLUSTER_ID, PROBABILITY FROM (SELECT T.*,  MAX(PROBABILITY) OVER (PARTITION BY F_ID ORDER BY PROBABILITY DESC)
MAXP FROM KMEANS_RESULT1 T) WHERE MAXP = PROBABILITY) T1, FRUIT T2 WHERE T1.F_ID = T2.F_ID ORDER BY CLUSTER_ID;

DROP TABLE CHICAGO_CRIME;

CREATE TABLE CHICAGO_CRIME (
C_ID NUMBER(10),
CASE_NUMBER VARCHAR2(10),
CRIME_DATE VARCHAR2(40),
PRIMARY_TYPE VARCHAR2(40),
DESCRIPTION VARCHAR2(80),
LOCATION_DESCRIPTION VARCHAR2(50),
ARREST_YN VARCHAR2(10),
DOMESTIC VARCHAR2(10),
FBI_CODE VARCHAR2(10),
CRIME_YEAR VARCHAR2(10),
LATITUDE NUMBER(20, 10),
LONGITUDE NUMBER(20, 10));

SELECT T1.C_ID, T1.CLUSTER_ID, T1.PROBABILITY, T2.LATITUDE, T2.LONGITUDE FROM (SELECT C_ID, CLUSTER_ID, PROBABILITY
FROM (SELECT T.*, MAX(PROBABILITY) OVER (PARTITION BY C_ID ORDER BY PROBABILITY DESC) MAXP FROM KMEANS_RESULT2 T)
WHERE MAXP = PROBABILITY) T1, CHICAGO_CRIME T2 WHERE T1.C_ID = T2.C_ID ORDER BY CLUSTER_ID;
SELECT T1.CLUSTER_ID, COUNT(*) FROM (SELECT C_ID, CLUSTER_ID, PROBABILITY
FROM (SELECT T.*, MAX(PROBABILITY) OVER (PARTITION BY C_ID ORDER BY PROBABILITY DESC) MAXP FROM KMEANS_RESULT2 T)
WHERE MAXP = PROBABILITY) T1, CHICAGO_CRIME T2 WHERE T1.C_ID = T2.C_ID GROUP BY T1.CLUSTER_ID;

-- 부록
