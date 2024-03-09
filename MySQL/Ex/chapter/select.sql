# 명령에 커서대고 ctrl+Enter - 해당명령실행
begin;
-- use 사용명령어, hrdb 이름
use hrdb;
end;

# select문
begin;

##########################
begin; #from절
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from job_history;
select * from jobs;

-- 컬럼을 지정해서 조회 할 수 있다
-- 예제 출력

select first_name, last_name 
from employees;
select first_name, 
       phone_number, 
       hire_date, 
       salary 
from employees;
select first_name, 
	   last_name, 
       salary, 
       phone_number, 
       email, 
       hire_date
from employees;

-- 컬럼이름 변경하여 출력
-- 원본은 바뀌지 않고 출력만 바꿔서 보여줌! 
select employee_id as empNO,
       first_name as 'f-name',
       salary 월급
from employees;
select first_name as 이름,
	   phone_number 전화번호,
       hire_date 입사일,
       salary 월급
from employees;
select employee_id '사 번',
	   last_name 이름,
	   first_name 성,
       salary 월급,
       phone_number 전화번호,
       email 이메일,
       hire_date 입사일
from employees;
end;

##########################
begin; #산술연산자
select first_name,
       salary as 월급,
       salary - 100 '월급 - 식대',
       salary * 12 연봉,
       salary * 12 + 500 보너스포함,
       salary / 30 일급,
       employee_id 사번,
       employee_id % 3 + 1 '워크샵 팀'
from employees;
select job_id * 12
from employees;

-- 컬럼합치기
select first_name firstName,
	   last_name lastName,
       concat(first_name, '  ',last_name) name
from employees;
select concat(start_date, ' ~ ', end_date) 업무기간
from job_history;
select concat(first_name, ' ',last_name, '  hire date is  ', hire_date) 'hireData'
from employees;

-- 연습문제
select concat(first_name,'-', last_name) 성명,
       salary 월급,
       salary * 12 연봉,
       salary * 12 + 5000 보너스,
       phone_number 전화번호
from employees;
select first_name, 
       salary, 
       '(주)개발자' as company, 
       3 상태
from employees;

-- 컬럼없이 추가하면 새로운 컬럼으로 인식
-- 같은내용으로 채워진다
select '(주)개발자' company, 3; -- 테이블명(from) 생략 가능 

-- now 현재시각 출력
select now() realtime
from dual;

-- 연습
select start_date, end_date from job_history;
end;

##########################
begin; #where 절
select first_name, 
       department_id
from employees
where department_id = 10
or department_id = 50;

-- 월급이 15000이상인 사원들의 이름과 월급 출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where salary >= 15000;
-- 07/01/01 이후 입사한 사원 이름, 입사일 출력
select hire_date,
       concat(first_name,'-', last_name) name
from employees
where hire_date >= 20070101;
-- where hire_date >= '2007-01-01' -- 으로도 사용 가능
-- 이름이Lex인 직원의 이름과 월급 출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where first_name = 'Lex';
-- 대소문자 구분
select concat(first_name,'-', last_name) name,
       salary
from employees
where binary first_name = 'Lex';

-- 월급이 14000이상 17000이하인 사원의 이름과 월급출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where salary >= 14000
and salary <= 17000;

-- 월급이 14000이하이거나 17000이상인사원의 이름과 월급 출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where salary <= 14000
or salary >= 17000;
-- 입사일이 04.01.01이후 05.12.31이전의 사원 이름과 입사일 출력
select concat(first_name,'-', last_name) name,
       hire_date
from employees
where hire_date >= 20040101
and hire_date <= '2005-12-31';

-- 월급이 14000이상 17000이하인 사원의 이름과 월급 출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where salary between 14000 and 17000;

select concat(first_name,'-', last_name) name,
       salary
from employees
where binary first_name in ('Neena', 'Lex', 'John');

-- 월급 2100, 3100, 4100, 5100인 사원의 이름과 월급 출력
select concat(first_name,'-', last_name) name,
       salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select concat(first_name,'-', last_name) name,
       salary
from employees
where salary in (2100, 3100, 4100, 5100);

# like연산자

-- %임의의 길이의 문자열
-- _한글자의 길이
select * 
from employees
where first_name like 'j%o%';

-- 이름에 am을 포함한 사원의 이름과 월급 출력
select concat(first_name, '  ', last_name) name,
       salary
from employees
where first_name like '%am%';

-- 이름의 두번째 글자가 a인 사원의 이름과 월급 출력
select concat(first_name, '  ', last_name) name,
       salary
from employees
where first_name like '_a%';

-- 이름의 네번째 글자가 a인 사원의 이름 출력
select concat(first_name, '  ', last_name) name
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름출력
select concat(first_name, '  ', last_name) name
from employees
where first_name like '__a_';
end;

##########################
begin; #null
select first_name name, 
       salary, 
       commission_pct
from employees
where salary between 13000 and 15000;

select first_name name, 
       salary, 
       commission_pct, 
       salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name,
       salary
       commission_pct
from employees
where commission_pct is null
and salary between 13000 and 15000;

-- 커미션 비율이 있는 사원의 이름과 월급 커미션 비율 출력
select first_name,
       salary
       commission_pct
from employees
where commission_pct is not null
and salary between 13000 and 15000;

-- 담당매니저가 없고 커미션 비율이 없는 직원의 이름과 매니저아이디, 커미션비율 출력
select first_name,
       manager_id,
       commission_pct
from employees
where commission_pct is null
and manager_id is null;

-- 부서가 없는 직원의 이름과 월급 출력
select first_name,
       salary
from employees
where department_id is null;
end;

##########################
begin; #Order by 절
-- 정렬
select * from employees;

select first_name, 
       salary
from employees
order by salary asc;

select  first_name 
       ,hire_date
       ,salary
from employees
order by hire_date asc,
         salary asc;

-- 예제 
select * from employees;
-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름 출력
select department_id,
       salary,
       first_name
from employees
order by department_id asc;
-- 월급이 10000이상인 직원의 이름 월급을 월급이 큰직원부터 출력
select first_name,
       salary
from employees
where salary >= 10000
order by salary desc;
-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은사람부터 부서번호, 월급, 이름 출력
select department_id,
       salary,
       first_name
from employees
order by department_id asc,
		 salary desc;
-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력
select  first_name
       ,salary
       ,hire_date
from employees
order by first_name asc;
-- 직원의 이름, 급여, 입사일을 입사일이 빠른사람부터 출력
select  first_name
       ,salary
       ,hire_date
from employees
order by hire_date asc;

end;

end; #select문

#단일행 숫자 함수
begin;

##########################
-- 올림 반올림
 begin; # round, from, ceil, floor
###### round (반올림)
select  round(123.123, 2)
       ,round(123.126, 2)
from dual;

-- from 제외가능
select  round(123.123, 2)
       ,round(123.126, 2)
       ,round(123.567, 0)
       ,round(123.345, -1)
       ,round(163.345, -2);
       
###### ceil (올림)
select  ceil(123.12343)
       ,ceil(123.896)
       ,ceil(123.345)
       ,ceil(165.14)
from dual;

###### floor (내림)
select  floor(123.12343)
       ,floor(123.896)
       ,floor(123.345)
       ,floor(163.345)
from dual;
end;

##########################
-- 소수점자리수 표현
 begin; # truncate
###### truncate 
-- 소수점 n자리까지 표현
select  truncate(123.12343, 2)
       ,truncate(123.896, 1)
       ,truncate(123.345, 0)
       ,truncate(163.345, -2)
from dual;

select concat(first_name, '  ', last_name) name,
       truncate(salary, 0) salary
from employees
order by salary asc;
end;

##########################
-- 숫자의n승, 제곱근
 begin; # power / pow, sqrt
###### power / pow 
-- 숫자의n승
select pow(12, 2);
select power(12, 2);

###### sqrt 
-- 숫자의제곱근
select  sqrt(144)
       ,truncate(sqrt(633), 0)
from dual;
end;

##########################
-- 음수양수, 절대값
 begin; # sing, abs
###### sign 
-- 음수양수표시
select  sign(23)
       ,sign(-23)
       ,sign(0);

###### abs
-- 절대값
select abs(123)
      ,abs(0)
      ,abs(-123);
end;

##########################
-- 값들중 가장 큰 값, 작은값
 begin; # greatest, least
 ###### greatest 
-- 괄호안의 값중 가장 큰 값
select greatest(23, 3, 231);
select greatest('A', 'C', 'c');

###### least 
-- 괄호안의 값중 가장 작은 값
select least(3, 0, 23)
	  ,least(234,-23,0)
      ,least('a', 34);
end;
 
 ##########################
 begin; #응용
 -- id중 가장 큰 수 출력
 select employee_id
       ,manager_id
       ,department_id
       ,greatest(employee_id, manager_id, department_id)
 from employees; 
  -- id중 가장 작은 수 출력
 select employee_id
       ,manager_id
       ,department_id
       ,least(employee_id, manager_id, department_id)
 from employees; 
 
 -- salary중 가장 큰 수 출력
 select max(salary)
 from employees; 
 -- salary중 가장 작은 수 출력
  select min(salary)
 from employees; 
 
 end;

end; #단일행함수

# 문자함수
begin;

##########################
-- 문자열 연결
 begin; #concat, concat_ws
# cancat 문자열 연결
 select concat('-', first_name, last_name, salary)
 from employees;
# ws 문자열을 제일 앞글자에 선언된 문자로 연결
  select concat_ws('-', first_name, last_name, salary)
 from employees;
 end; #concat, concat_ws
 
 ##########################
 -- 대소문자 변환
 begin; # lcase/lower, ucase/upper
# lcase/lower
 -- 모든 대문자를 소문자로 변환
 select first_name
       ,lcase(first_name)
       ,lower(first_name)
 from employees;
 
# ucase/upper
 -- 모든 소문자를 대문자로 변환
  select first_name
       ,ucase(first_name)
       ,upper(first_name)
 from employees;
 
 end;
 
 ##########################
 -- 문자열 길이 반환
 begin; #length, char_length / character_length
 
 ##### length
 -- 문자열의 길이를 byte로 반환
 select first_name
       ,length(first_name)
 from employees;
 
 ##### char_length / character_length
 -- 문자열의 길이를 반환
 select first_name
       ,char_length(first_name)
       ,character_length(first_name)
 from employees;
 
 end;
 
 ##########################
 -- 문자열 자르기
 begin; #substring / substr
 -- 문자열, n번째글자부터, n번째 글자까지
 -- 같은숫자 입력으로 글자수 지정도 가능
 -- 음수입력하면 뒤에서부터
 
 select first_name
       ,substr(first_name, 1,3)
       ,substr(first_name, 2,2) 
       ,substr(first_name, -3,2) 
       ,substr(first_name, 3,2) 
 from employees
 where department_id = 100;
 
 select substr('990523-2345678', 8, 1);
 select substr('990523-2345678', -7, 1);
 
 end;
 
 ##########################
 -- 문자열 공백설정
 begin; #LPAD, RPAD
 # lpad(왼쪽)
 -- 문자열 길이 설정, 공백에 문자출력
 select first_name
       ,lpad(first_name, 10,'0') 
 from employees;
 #rpad(오른쪽)
 select first_name
       ,rpad(first_name, 10,'0') 
 from employees;
 
 end;
 
 ##########################
 -- 공백자르기
 begin; #trim, ltrin, rtrim
 
 select concat('|', '     안녕하세요     ', '|') no
	   ,concat('|', trim('      안녕하세요      '),'|') trim
       ,concat('|', rtrim('      안녕하세요      '),'|') rtrim
       ,concat('|', ltrim('      안녕하세요      '),'|') ltrim;
 
 end;
 
 ##########################
 -- 문자변경
 begin; # replace
 -- 문자변경(문자열, 바꿀문자, 바뀔문자)
 select first_name name
       ,replace(first_name,'a', '*') 'replace'
       ,replace(first_name, substr(first_name, 2, 4), '***') lpad
 from employees
 where department_id = 100;
 end;
 
 end; #문자함수
 
# 날짜/시간함수
begin;

##########################
-- 시간, 날짜
begin; # current_date, time, timestamp
-- 현재날짜
select current_date(), curdate();
-- 현재시간
select current_time(), curtime();
-- 현재 날짜와 시간
select current_timestamp(), now();

end;

##########################
-- 시간, 날짜 더하기 빼기
begin; # adddate/date_add, subdate/datesub

select '2021-06-20 00:00:00:00' date
      ,adddate('2021-06-20 00:00:00:00', interval 1 year) 'interval 1 year'
      ,adddate('2021-06-20 00:00:00:00', interval 1 month) 'interval 1 month'
      ,adddate('2021-06-20 00:00:00:00', interval 1 week) 'interval 1 week'
      ,adddate('2021-06-20 00:00:00:00', interval 1 day) 'interval 1 day'
      ,adddate('2021-06-20 00:00:00:00', interval 1 hour) 'interval 1 hour'
      ,adddate('2021-06-20 00:00:00:00', interval 1 minute) 'interval 1 minute'
      ,adddate('2021-06-20 00:00:00:00', interval 1 second) 'interval 1 second';
      
select '2021-06-20 00:00:00:00' date
      ,subdate('2021-06-20 00:00:00:00', interval 1 year) 'interval 1 year'
      ,subdate('2021-06-20 00:00:00:00', interval 1 month) 'interval 1 month'
      ,subdate('2021-06-20 00:00:00:00', interval 1 week) 'interval 1 week'
      ,subdate('2021-06-20 00:00:00:00', interval 1 day) 'interval 1 day'
      ,subdate('2021-06-20 00:00:00:00', interval 1 hour) 'interval 1 hour'
      ,subdate('2021-06-20 00:00:00:00', interval 1 minute) 'interval 1 minute'
      ,subdate('2021-06-20 00:00:00:00', interval 1 second) 'interval 1 second';
end;

##########################
-- 일수차, 시간차 구하기
begin; #datediff, timediff
-- datediff (일수차)
-- timediff (시간차)
select datediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
      ,timediff('2021-06-20 01:05:05', '2021-06-20 01:00:00');

select first_name
      ,hire_date
      ,round(datediff(now(), hire_date)/365, 1) year
from employees
order by hire_date desc;

end;

end;
 
 # 변환함수
 begin;
 
 ##########################
 -- 날짜 > 문자열
 begin; # datefomat
 select now() now
       ,date_format(now(), '%Y / %m / %d  %H:%i:%s') format
       ,date_format(now(), '%Y-(%b)%m/(%a)%d  %h:%i:%s(%p)')format;
 end;
 
 ##########################
 -- 문자열 > 날짜
 begin; #str_to_date
 -- 
select datediff('2021-06-21 01:05:05', '2021-06-20 01:00:00') dateDiff;
select str_to_date('2021-jun-21', '%Y-%b-%d') strToDate;
 select datediff(str_to_date('2021-Jun-24', '%Y-%b-%d'), str_to_date('2021-06-20', '%Y-%m-%d')) dateDiff;
 
 end;
 
 ##########################
 -- 숫자에 , 추가 소수점 n자리까지 출력
 begin; #format
 
 select concat(format(1234567.89, 0), ' 원')
			  ,format(1234567.89, 2)
              ,format(1234567.89, - 2);
 
 
 end;
 
 ##########################
 -- expression을 type형식으로 변환
 begin; #cast
 
 select cast(1234567.89 as char);
 
 end;
 
 ##########################
 -- 컬럼의 값이 null일때 정해진 값 출력
 begin; #ifnull
 
 select first_name
       ,commission_pct
       ,ifnull(commission_pct, 0) ifnull
 from employees
 order by ifnull;
 
  select first_name
       ,commission_pct
       ,ifnull(commission_pct, '없음') ifnull
 from employees
 
 end;
 
 end;
 