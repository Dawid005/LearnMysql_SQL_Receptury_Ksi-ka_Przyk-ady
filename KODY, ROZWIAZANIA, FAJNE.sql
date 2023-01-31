SELECT * 
FROM receptury_book.EMP E 
WHERE (
	e.deptno = 10 or  
    e.comm is not null or
    sal <=2000) and 
e.deptno = 20;

select *
from(
	select sal as salary, comm as commission
    from emp
    ) x
where salary < 5000;

select concat(ename, ' WORKS AS A ', job) as msg 
	from receptury_book.emp
where deptno = 10;


select ename, sal,
	case when sal <= 2000 then 'UNDERPAID'
		 when sal >= 4000 then 'OVERPAID'
         else 'OK'
	end as status
from emp;

select *
	from emp limit 5;

select * 
	from emp
where comm is null;

select coalesce(comm, 0)
	from emp;
    
select case
	    when comm is null then 0
        else comm
        end as comm
	from emp;

select ename, job
	from emp
where deptno in ('10', '20')
	and (ename like '%I%' or job like '%ER');

select * from emp;


select ename, job, sal
  from emp
 where deptno = 10
 order by sal asc;

select ename, job, sal
  from emp
 where deptno = 10
 order by sal desc;

select ename, job, sal
  from emp
 where deptno = 10
 order by 3 desc;

select empno, deptno, sal, ename, job
  from emp
  order by deptno asc, sal desc;

select ename, job, length(job) -2, substr(job, length(job) -2)
  from emp
 order by substr(job, length(job) -2);
 
 select ename, sal, comm
  from(
 select ename, sal, comm,
		case when comm is null then 0 else 1 end as is_null
	from emp
		) x
 order by is_null desc, comm;
 
 select ename, sal, comm
  from(
 select ename, sal, comm,
		case when comm is null then 0 else 1 end as is_null
	from emp
		) x
 order by is_null desc, comm desc; 

 select ename, sal, comm
  from(
 select ename, sal, comm,
		case when comm is null then 0 else 1 end as is_null
	from emp
		) x
 order by is_null, comm; 

 select ename, sal, comm
  from(
 select ename, sal, comm,
		case when comm is null then 0 else 1 end as is_null
	from emp
		) x
 order by is_null, comm desc; 
 
 select ename, sal, comm,
	case when comm is null 
	  then 0
      else 1
	end as is_null
 from emp;
 
select ename, sal, job, comm
  from emp
 order by case when job = 'SALESMAN' 
   then comm 
   else sal 
 end ;
 
select ename, sal, job, comm,
  case when job = 'SALESMAN' 
   then comm 
   else sal 
   end as ordered
  from emp
 order by 5;
  



select ename as ename_and_dname, deptno
  from emp
 where deptno = 10
  union all
 select '----------', null
    from t1
  union all
select dname, deptno
  from dept;
 
select deptno
  from dept
 union all
select ename 
  from emp;
 
 select deptno
  from dept
 union 
select ename 
  from emp;
 
select deptno
  from emp
 union
select deptno
  from dept;

select deptno
  from emp
 union all
select deptno
  from dept; 
 
select distinct deptno
  from (
select deptno
  from emp
 union all
select deptno
  from dept
	) d;
        
select e.ename, d.loc
  from emp e, dept d
 where e.deptno = d.deptno
   and e.deptno = 10;

select e.ename, d.loc
  from  emp e inner join dept d
    on (e.deptno = d.deptno)
 where e.deptno = 10;
 
create view V
as 
select ename, job, sal
  from emp
 where job = 'CLERK';
select * from V;
 
select e.empno, e.ename, e.job, e.sal, e.deptno
  from emp e, V v
 where 
   e.ename = v.ename and
   e.job = v.job and
   e.sal = v.sal;
  
select * from emp e where e.deptno in ('20');
 
 select deptno
   from dept
 where deptno not in (select deptno from emp);
 
 select deptno 
  from dept
 where not (deptno = 10 or deptno = 50 or deptno = null);
 
  select deptno 
  from dept
 where  (deptno = 10 or deptno = 50 or deptno = null);
 
select deptno 
  from dept
 where not (deptno = 10 or deptno = 50 or deptno = 20) and deptno is not null;

select * from dept; 
  
select deptno 
  from dept
 where not (deptno = 10 or deptno = 50 or deptno = 20);
 
 select d.deptno
  from dept d
 where not exists ( select null
					  from emp e
					 where d.deptno = e.deptno);
 
  select d.deptno
  from dept d
 where not exists ( select 1
					  from emp e
					 where d.deptno = e.deptno);
 
select d.deptno
  from dept d
 where exists ( select 1
					  from emp e
					 where d.deptno = e.deptno);
 
select d.*, e.*
  from dept d left outer join emp e
	on(d.deptno = e.deptno)
 where e.deptno is null;
 
 select * from emp where deptno = '40';
 
 select e.ename, e.deptno as emp_deptno, d.*
   from dept d left join emp e
	on(d.deptno = e.deptno);
 
 -- nicer code:
  select e.ename, e.deptno as emp_deptno, d.*
   from emp e right join dept d
	on(d.deptno = e.deptno);
 
select e.ename, d.loc
  from emp e, dept d
 where e.deptno = d.deptno;
 
select e.ename, d.loc, eb.received
  from emp e, dept d, emp_bonus eb
 where e.deptno = d.deptno
	and e.empno = eb.empno; 
 
select e.ename, d.loc, eb.received
  from emp e join dept d
	on(e.deptno = d.deptno)
  left join emp_bonus eb
    on(e.empno = eb.empno)
 order by 2;
 
 select e.ename, d.loc,
		(select eb.received from emp_bonus eb
		  where eb.empno = e.empno) as received
  from emp e, dept d
 where e.deptno = d.deptno
 order by 2;
 
 create view V2
 as
 select * from emp where deptno != 10
   union all
select * from emp where ename = 'WARD';

select * from V2;

select * 
   from (
select e.empno, e.ename, e.job, e.mgr, e.hiredate,
	   e.sal, e.comm, e.deptno, count(*) as cnt
   from emp e
  group by empno, ename, job, mgr, hiredate,
			sal, comm, deptno
		) e
	where not exists(
select null
  from (
select v.empno, v.ename, v.job, v.mgr, v.hiredate,
	   v.sal, v.comm, v.deptno, count(*) as cnt
   from V2 v
 group by empno, ename, job, mgr, hiredate,
		   sal, comm, deptno
		) v
	where 
  v.empno = e.empno and
  v.ename = e.ename and
  v.job = e.job and
  v.mgr = e.mgr and
  v.hiredate = e.hiredate and
  v.sal = e.sal and
  v.deptno = e.deptno and
  v.cnt = e.cnt and
  coalesce(v.comm, 0) = coalesce(e.comm, 0)
  )
	union all
  select *
    from (
  select v.empno, v.ename, v.job, v.mgr, v.hiredate,
		 v.sal, v.comm, v.deptno, count(*) as cnt
	from V2 v
  group by empno, ename, job, mgr, hiredate,
		   sal, comm, deptno
		) v
   where not exists (
 select null
	from(
  select e.empno, e.ename, e.job, e.mgr, e.hiredate,
		 e.sal, e.comm, e.deptno, count(*) as cnt
	from emp e
   group by empno, ename, job, mgr, hiredate,
			sal, comm, deptno
		) e where
  v.empno = e.empno and
  v.ename = e.ename and
  v.job = e.job and
  v.mgr = e.mgr and
  v.hiredate = e.hiredate and
  v.sal = e.sal and
  v.deptno = e.deptno and
  v.cnt = e.cnt and
  coalesce(v.comm, 0) = coalesce(e.comm, 0)
 );
 
select e.ename, d.loc
  from emp e, dept d
 where e.deptno = 10 
   and d.deptno = e.deptno;
   
select deptno,
		sum(distinct sal) as total_sal,
        sum(bonus) as total_bonus
	from(
select e.empno,
		e.ename,
		e.sal,
        e.deptno,
        e.sal * case when eb.type = 1 then .1
					 when eb.type = 2 then .2
                     else .3
				end as bonus
	from emp e, emp_bonus eb
  where e.empno = eb.empno
	-- and e.deptno = 10
		) x
	group by deptno;
   
select deptno,
		sum(distinct sal) as total_sal,
        sum(bonus) as total_bonus
	from(
select e.empno,
		e.ename,
		e.sal,
        e.deptno,
        e.sal * case when eb.type is null then 0
					 when eb.type = 1 then .1
					 when eb.type = 2 then .2
                     else .3
				end as bonus
	from emp e left outer join emp_bonus eb
	on(e.empno = eb.empno)
	-- and e.deptno = 10
		) x
	group by deptno;
-- now it will be the same, but now we will use: 'Sum Over':
/*
select distinct deptno,total_sal, total_bonus
	from(
select  e.empno,
		e.ename,
        sum(distinct e.sal) over
        (partition by e.deptno) as total_sal,
        e.deptno,
        sum(e.sal * case when eb.type is null then 0
					 when eb.type = 1 then .1
					 when eb.type = 2 then .2
                     else .3
				end ) over
			(partition by deptno) as total_bonus
	from emp e left outer join emp_bonus eb
	on(e.empno = eb.empno)
	-- and e.deptno = 10
		) x;
*/

select d.deptno, d.dname, e.ename
  from receptury_book.dept d left outer join receptury_book.emp e
	on(d.deptno = e.deptno);

select d.deptno, d.dname, e.ename
  from receptury_book.dept d right outer join receptury_book.emp e
	on(d.deptno = e.deptno);

select d.deptno, d.dname, e.ename
  from receptury_book.dept d left outer join receptury_book.emp e
	on(d.deptno = e.deptno)
union
select d.deptno, d.dname, e.ename
  from receptury_book.dept d right outer join receptury_book.emp e
	on(d.deptno = e.deptno);

select ename, comm
  from receptury_book.emp e
 where coalesce(e.comm, 0) < ( select comm
								 from receptury_book.emp e
									where e.ename = 'WARD');

insert into receptury_book.dept (deptno, dname, loc)
	values(50, 'PROGRAMMING', 'BALTIMORE');

select * from receptury_book.dept;

SET SQL_SAFE_UPDATES = 0;
delete from  receptury_book.dept where deptno = '50';

create table receptury_book.D (id integer default 0);
 
insert into receptury_book.D values(); 
 
 select * from receptury_book.D;
 
create table receptury_book.D1 (id integer default 0, foo varchar(10));
 
insert into receptury_book.D1(foo) values('Bar'); 
 
select * from receptury_book.D1; 

create table receptury_book.D2(id integer default 0, foo varchar(10));

insert into receptury_book.D2 (id, foo) values(null, 'Brighten'); 
 
 select * from receptury_book.D2;
  
 create table receptury_book.dept_east like receptury_book.dept;
 
insert into receptury_book.dept_east (deptno, dname, loc)
select deptno, dname, loc
  from receptury_book.dept d
where d.loc in ('NEW YORK', 'BOSTON');
 
select * from receptury_book.dept_east;

create table receptury_book.dept_2
as
select *
	from receptury_book.dept
where 1=0;

select * from receptury_book.dept_2;


create table receptury_book.emp_2
as
select empno, ename, job
	from receptury_book.emp
where 1=0;

select * from receptury_book.emp_2;

insert into receptury_book.emp_2
	(empno, ename, job)
		values(1, 'Jonathan', 'Editor');

select * from receptury_book.emp_2;

select * from receptury_book.emp;

insert into receptury_book.emp (empno, ename, job)
select empno, ename, job
  from receptury_book.emp_2;


select * from receptury_book.emp; 

delete from receptury_book.emp where empno = '1';

select deptno, ename, sal
  from emp
where deptno = 20
order by 1, 3;

update  receptury_book.emp
  set sal = sal * 1.1
where deptno = 20;

select * from receptury_book.emp;

select deptno,
	   ename,
	   sal 		as orig_sal,
       sal * .1 as amt_to_add,
       sal * 1.1 as new_sall
	from receptury_book.emp
  where deptno = 20
  order by 1, 5;

update receptury_book.emp	
	set sal = sal * 1.2
where empno in (select empno from receptury_book.emp_bonus);

select * from receptury_book.emp join receptury_book.emp_bonus using(empno);

update receptury_book.emp	e
	set sal = sal * 1.2
where exists (select null
				from receptury_book.emp_bonus eb
			  where e.empno = eb.empno);

select * from receptury_book.emp join receptury_book.emp_bonus using(empno);

select deptno, ename, sal, comm
  from emp
order by 1;

update receptury_book.emp e, receptury_book.new_sal ns
set e.sal = ns.sal,
e.comm = ns.sal/2
where e.deptno = ns.deptno;

select * from receptury_book.emp order by deptno;





















