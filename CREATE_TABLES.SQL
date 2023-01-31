create table receptury_book.emp (
    empno varchar(4),
    ename varchar(240),
    job varchar(240),
    mgr varchar(4),
    hiredate date,
    sal integer,
    comm integer,
    deptno varchar(2)
);

create table receptury_book.dept(
	 deptno varchar(2),
     dname varchar(240),
     loc varchar(240)
);

select * from receptury_book.emp;

select * from receptury_book.dept;

insert into receptury_book.emp values('7369', 'SMITH','CLERK','7902',STR_TO_DATE('17-12-2005', '%d-%m-%Y'), 800, null, '20');

insert into receptury_book.emp values('7499', 'ALLEN','SALESMAN','7698',STR_TO_DATE('20-02-2006', '%d-%m-%Y'), 1600, 300, '30');

insert into receptury_book.emp values('7521', 'WARD','SALESMAN','7698',STR_TO_DATE('22-02-2006', '%d-%m-%Y'), 1250, 500, '30');

insert into receptury_book.emp values('7566', 'JONES','MANAGER','7839',STR_TO_DATE('02-04-2006', '%d-%m-%Y'), 2975, NULL, '20');

insert into receptury_book.emp values('7654', 'MARTIN','SALESMAN','7698',STR_TO_DATE('28-09-2006', '%d-%m-%Y'), 1250, 1400, '30');

insert into receptury_book.emp values('7698', 'BLAKE','MANAGER','7839',STR_TO_DATE('01-05-2006', '%d-%m-%Y'), 2850, NULL, '30');


insert into receptury_book.emp values('7782', 'CLARK','MANAGER','7839',STR_TO_DATE('09-01-2006', '%d-%m-%Y'), 2450, NULL, '10');

insert into receptury_book.emp values('7788', 'SCOTT','ANALYST','7566',STR_TO_DATE('09-12-2007', '%d-%m-%Y'), 3000, NULL, '20');

insert into receptury_book.emp values('7839', 'KING','PRESIDENT','7698',STR_TO_DATE('17-11-2006', '%d-%m-%Y'), 5000, NULL, '10');

insert into receptury_book.emp values('7844', 'TURNER','SALESMAN','7698',STR_TO_DATE('08-09-2006', '%d-%m-%Y'), 1500, 0, '30');

insert into receptury_book.emp values('7876', 'ADAMS','CLERK','7788',STR_TO_DATE('12-01-2008', '%d-%m-%Y'), 1100, NULL, '20');

insert into receptury_book.emp values('7900', 'JAMES','CLERK','7698',STR_TO_DATE('03-12-2006', '%d-%m-%Y'), 950, NULL, '30');

insert into receptury_book.emp values('7902', 'FORD','ANALYST','7566',STR_TO_DATE('03-12-2006', '%d-%m-%Y'), 3000, NULL, '20');

insert into receptury_book.emp values('7934', 'MILLER','CLERK','7782',STR_TO_DATE('23-01-2007', '%d-%m-%Y'), 1300, NULL, '10');

SELECT * FROM RECEPTURY_BOOK.EMP;

INSERT INTO RECEPTURY_BOOK.DEPT VALUES('10', 'ACCOUNTING', 'NEW YORK');

INSERT INTO RECEPTURY_BOOK.DEPT VALUES('20', 'RESEARCH', 'DALLAS');

INSERT INTO RECEPTURY_BOOK.DEPT VALUES('30', 'SALES', 'CHICAGO');

INSERT INTO RECEPTURY_BOOK.DEPT VALUES('40', 'OPERATIONS', 'BOSTON');

SELECT * FROM receptury_book.DEPT;

create table receptury_book.t10(
	 ID int not null auto_increment primary key
);

insert into receptury_book.t10 values(default);

select * from receptury_book.t10;

create table receptury_book.emp_bonus (
    empno varchar(4),
    received date,
    type varchar(10)
);

insert into receptury_book.emp_bonus values('7369',STR_TO_DATE('14-03-2005', '%d-%m-%Y'), '1');

insert into receptury_book.emp_bonus values('7369',STR_TO_DATE('14-03-2005', '%d-%m-%Y'), '2');

insert into receptury_book.emp_bonus values('7900',STR_TO_DATE('14-03-2005', '%d-%m-%Y'), '2');

insert into receptury_book.emp_bonus values('7788',STR_TO_DATE('14-03-2005', '%d-%m-%Y'), '3');

select * from receptury_book.emp_bonus;

create table receptury_book.new_sal (
	deptno varchar(4),
    sal integer
);

insert into receptury_book.new_sal values('10', 4000);

select * from receptury_book.new_sal;



