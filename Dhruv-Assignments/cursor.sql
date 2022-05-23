mysql > use Abhi;
Reading table information for completion of table
and column names You can turn off this feature to get a quicker startup
with - A Database changed mysql > create table o_rollcall(
roll_no int,
name varchar(20),
address varchar(20)
);
Query OK,
0 rows affected (0.28 sec) mysql > create varchar(20)
);
table n_rollcall(
roll_no Query OK,
0 rows affected (0.27 sec) int,
namevarchar(20),
address mysql > insert into o_rollcall
values
('1', 'Hitesh', 'Nandura');
Query OK,
1 row affected (0.05 sec) mysql > insert into o_rollcall
values
('2', 'Piyush', 'MP');
Query OK,
1 row affected (0.06 sec) mysql > insert into o_rollcall
values
('3', 'Ashley', 'Nsk');
Query OK,
1 row affected (0.05 sec) mysql > insert into o_rollcall
values
('4', 'Kalpesh', 'Dhule');
Query OK,
1 row affected (0.05 sec) mysql > insert into o_rollcall
values
('5', 'Abhi', 'Satara');
Query OK,
1 row affected (0.04 sec) mysql > delimiter // mysql > create procedure
p3(in r1 int)-> begin -> declare r2 int;
-> declare exit_loop boolean;
-> declare c1 cursor for
select
roll_no
from
o_rollcall
where
roll_no > r1;
-> declare continue handler for not found
set
exit_loop = true;
-> open c1;
-> e_loop : loop -> fetch c1 into r2;
-> if not exists(
select
*
from
n_rollcall
where
roll_no = r2
)-> then -> insert into n_rollcall
select
*
from
o_rollcall
where
roll_no = r2;
-> end if;
-> if exit_loop -> then -> close c1;
-> leave e_loop;
-> end if;
-> end loop e_loop;
-> end -> // Query OK,
0 rows affected (0.00 sec) mysql > call p3(3);
-> // Query OK,
0 rows affected (0.10 sec) mysql >
select * from n_rollcall;
insert into o_rollcall values('6', 'Patil', 'Kolhapur');
