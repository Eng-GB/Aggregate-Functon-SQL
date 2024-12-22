

##  aggreate Funtions In SQL ##

#	Count function 
use almadar;
select * from students ;
select count( *) from students ;

select * from receipts ;
select count( *) from receipts;

#	Max and Min function s

select max(amount) from receipts;
select min(amount) from receipts;

#	Sumn function

select sum(amount) from receipts;
select * from receipts ;
select avg(amount) from receipts;

# also yoou can get avg as this way 
select sum(amount)/4 from receipts;


select sum(amount) tiro,group_concat(name)  arday from students s  join receipts r on s.id=r.id;

SELECT 
    name, 
    tell, 
    sex, 
    cl_name, 
    SUM(amount) AS total 
FROM 
    students s
    JOIN student_class sc ON s.id = sc.id
    JOIN class cl ON cl.cl_no = sc.cl_no
    JOIN charge c ON sc.sc_no = c.sc_no 
GROUP BY 
    name, tell, sex, cl_name;

select name,tell, sex,cl_name, sum(amount) total from students s, charge c,class cl, student_class sc 
where s.id=sc.id and cl.cl_no=sc.cl_no and sc.sc_no=c.sc_no group by name ,tell, sex,cl_name;

select * from class;
select * from charge;

ALTER TABLE student_class DROP FOREIGN KEY cons_fk4_st;

#-------subquery: to retreative un-known 

select name,tell,sex, amount from students s join receipts r on s.id=r.id and 
amount=(select max(amount) from receipts);

select upper(name), sex, amount from students s join receipts r on s.id=r.id
and amount =(select max(amount) from receipts );


select name, sex, (amount )from students s join receipts r on s.id=r.id
and amount=(select min(amount) from  receipts);

select name, amount dalacay from students s, student_class sc, charge c 
where s.id=sc.id and sc.sc_no=c.sc_no ;

select name, amount dalacay from students s, student_class sc, charge c 
where s.id=sc.id and sc.sc_no=c.sc_no ;


select group_concat(name), sum(amount) dalacay from students s, student_class sc, charge c 
where s.id=sc.id and sc.sc_no=c.sc_no ;

select group_concat(name) name ,sum(amount) paid from students s, receipts r where s.id=r.id ;


select  name, sex from students union select * from  receipts ;