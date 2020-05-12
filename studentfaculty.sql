create table student(
snum int,
sname varchar(20),
major varchar(20),
lvl varchar(20),
age int,
primary key(snum)
);

create table class(
cname varchar(20),
meet_at time,
room varchar(20),
fid int,
primary key(cname),
foreign key(fid) references faculty(fid)
);
drop table enrolled;
create table enrolled(
snum int,
cname varchar(20),
primary key(snum,cname),
foreign key(snum) references student(snum),
foreign key(cname) references class(cname)
);

create table faculty(
fid int,
fname varchar(20),
deptid int,
primary key(fid)
);
insert into student values(1,'A','CS','Jr',20);
insert into student values(2,'B','IS','Jr',20);
insert into student values(3,'C','CS','Sr',25);
insert into student values(4,'D','IS','Sr',22);
insert into student values(5,'E','CV','Jr',21);
insert into student values(6,'F','CV','Sr',22);
insert into student values(7,'G','Mec','Sr',19);
insert into faculty values(10,'X',1000);
insert into faculty values(11,'Y',1000);
insert into faculty values(12,'Z',2000);
insert into faculty values(13,'W',2000);
insert into faculty values(14,'T',3000);
insert into faculty values(15,'P',4000);
insert into class values('class1','12/11/15 10:15:16','R1',10);
insert into class values('class2','12/11/15 10:15:16','R2',10);
insert into class values('class3','12/11/15 11:15:16','R2',11);
insert into class values('class4','12/11/15 10:20:16','R3',11);
insert into class values('class5','12/11/15 11:20:16','R3',12);
insert into class values('class6','12/11/15 11:15:16','R1',12);
insert into class values('class7','12/11/15 10:15:16','R4',13);
insert into class values('class8','12/11/15 10:15:16','R5',14);
insert into class values('class9','12/11/15 10:25:16','R5',15);
insert into enrolled values(1,'class1');
insert into enrolled values(2,'class1');
insert into enrolled values(3,'class3');
insert into enrolled values(4,'class3');
insert into enrolled values(5,'class4');
insert into enrolled values(5,'class5');
insert into enrolled values(6,'class6');
insert into enrolled values(6,'class7');
insert into enrolled values(5,'class8');
insert into enrolled values(4,'class9');
insert into enrolled values(5,'class1');
insert into enrolled values(5,'class2');
insert into enrolled values(6,'class1');
select distinct sname from student,enrolled where student.snum=enrolled.snum and student.lvl='Jr';
select distinct class.cname from class,enrolled where room='R1'or class.cname in(select cname from enrolled group by cname having count(snum)>1 );
select distinct s1.sname,s2.sname from student s1,student s2,class c1,class c2,enrolled where enrolled.cname=c1.cname and enrolled.cname=c2.cname and s1.snum =enrolled.snum and s2.snum=enrolled.snum and s2.snum!=s1.snum  and c1.meet_at=c2.meet_at;
select fname from faculty f,enrolled e group by deptid having count(deptid)>1;
select distinct sname from student s,enrolled e where s.snum not in(select snum from enrolled);
