mysql> show databases;
+--------------------+
| Database
|
+--------------------+
| information_schema |
| A |
| db1 |
| PVG |
| RENUKA |
| mysql |
| nishant |
| performance_schema |
| renuka |
| sys |
| time |
+--------------------+
11 rows in set (0.11 sec)
mysql> use db1;
Database changed
mysql> create table Employee(emp_no int,emp_name varchar(20),date date,position
varchar(20));
Query OK, 0 rows affected (0.75 sec)
mysql> alter table Employee add salary int;
Query OK, 0 rows affected (0.68 sec)
Records: 0
Duplicates: 0
Warnings: 0
mysql> insert into Employee values('01','abc','2018-07-11','clerk','50000');
Query OK, 1 row affected (0.08 sec)
mysql> insert into Employee values('02','abhi','2018-05-11','ceo','150000');
Query OK, 1 row affected (0.08 sec)
mysql> insert into Employee values('03','xyz','2018-05-21','hr','100000');
Query OK, 1 row affected (0.04 sec)
mysql> insert into Employee values('04','aqwgy','2018-06-21','te','10000');
Query OK, 1 row affected (0.03 sec)
mysql> insert into Employee values('05','sfhjfh','2018-07-21','gt','12000');
Query OK, 1 row affected (0.03 sec)
mysql> create table TE(emp_no int,emp_namevarchar(20),join_date date,position
varchar(20),salary int);
Query OK, 0 rows affected (0.36 sec)
mysql> insert into TE values('01','abc','2018-07-11','clerk','50000');
Query OK, 1 row affected (0.03 sec)
mysql> insert into TE values('02','abhi','2018-05-11','ceo','150000');
Query OK, 1 row affected (0.04 sec)
mysql> insert into TE values('03','xyz','2018-05-21','hr','100000');
Query OK, 1 row affected (0.04 sec)
mysql> insert into TE values('04','aqwgy','2018-06-21','te','10000');
Query OK, 1 row affected (0.05 sec)
mysql> insert into TE values('05','sfhjfh','2018-07-21','gt','12000');
Query OK, 1 row affected (0.04 sec)
mysql> select * from TE;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | join_date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.04 sec)
mysql> select * from Employee;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> update TE set emp_name='gjgj' where emp_no='5';
Query OK, 1 row affected (0.13 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> select * from TE;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | join_date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | gjgj | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> select * from Employee union select * from TE;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
| 5 | gjgj | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
6 rows in set (0.01 sec)
mysql> select * from Employee union all select * from TE;
+--------+----------+------------+----------+--------+| emp_no | emp_name | date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | gjgj | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
10 rows in set (0.00 sec)
mysql> select distinct emp_no from Employee where emp_no in(select emp_no from TE);
+--------+
| emp_no |
+--------+
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+--------+
5 rows in set (0.03 sec)
mysql> select * from Employee;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | date
| position | salary |
+--------+----------+------------+----------+--------+| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> select * from TE;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | join_date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | gjgj | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> select distinct emp_name from Employee where emp_name in(select emp_name from
TE);
+----------+
| emp_name |
+----------+
| abc |
| abhi |
| xyz |
| aqwgy |
+----------+
4 rows in set (0.00 sec)
mysql> select * from Employee;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | sfhjfh | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> select * from TE;
+--------+----------+------------+----------+--------+
| emp_no | emp_name | join_date
| position | salary |
+--------+----------+------------+----------+--------+
| 1 | abc | 2018-07-11 | clerk |
50000 |
| 2 | abhi | 2018-05-11 | ceo | 150000 |
| 3 | xyz | 2018-05-21 | hr | 100000 |
| 4 | aqwgy | 2018-06-21 | te |
10000 |
| 5 | gjgj | 2018-07-21 | gt |
12000 |
+--------+----------+------------+----------+--------+
5 rows in set (0.00 sec)
mysql> select distinct emp_name from Employee where emp_name in(select emp_name from
TE);
+----------+
| emp_name |
+----------+
| abc |
| abhi |
| xyz || aqwgy
|
+----------+
4 rows in set (0.00 sec)
mysql> select min(salary) from Employee;
+-------------+
| min(salary) |
+-------------+
|
10000 |
+-------------+
1 row in set (0.04 sec)

mysql> select max(salary) from Employee;
+-------------+
| max(salary) |
+-------------+
|
150000 |
+-------------+
1 row in set (0.00 sec)
mysql> select sum(salary) from Employee;
+-------------+
| sum(salary) |
+-------------+
|
322000 |
+-------------+
1 row in set (0.00 sec)
mysql> select avg(salary) from Employee;
+-------------+
| avg(salary) |
+-------------+|
64400.0000 |
+-------------+
1 row in set (0.00 sec)
mysql> select count(salary) from Employee;
+---------------+
| count(salary) |
+---------------+
|
5 |
+---------------+
1 row in set (0.00 sec)
mysql> select lcase(emp_no) from Employee;
+---------------+
| lcase(emp_no) |
+---------------+
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+---------------+
5 rows in set (0.00 sec)
mysql> select ucase(emp_no) from Employee;
+---------------+
| ucase(emp_no) |
+---------------+
| 1 |
| 2 |
| 3 |
| 4 || 5
|
+---------------+
5 rows in set (0.00 sec)
mysql> select lcase(salary) from Employee;
+---------------+
| lcase(salary) |
+---------------+
| 50000 |
| 150000 |
| 100000 |
| 10000 |
| 12000 |
+---------------+
5 rows in set (0.00 sec)
mysql> select mid(emp_no,1,3) from Employee;
+-----------------+
| mid(emp_no,1,3) |
+-----------------+
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+-----------------+
5 rows in set (0.01 sec)
mysql> select mid(emp_no,1,3) from Employee;
+-----------------+
| mid(emp_no,1,3) |
+-----------------+| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+-----------------+
5 rows in set (0.00 sec)
mysql> select mid(emp_no,1,5) from Employee;
+-----------------+
| mid(emp_no,1,5) |
+-----------------+
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+-----------------+
5 rows in set (0.00 sec)
mysql> select mid(salary,1,3) from Employee;
+-----------------+
| mid(salary,1,3) |
+-----------------+
| 500 |
| 150 |
| 100 |
| 100 |
| 120 |
+-----------------+
5 rows in set (0.00 sec)
mysql> select mid(salary,1,5) from Employee;
+-----------------+
| mid(salary,1,5) |
+-----------------+
| 50000 |
| 15000 |
| 10000 |
| 10000 |
| 12000 |
+-----------------+
5 rows in set (0.00 sec)
mysql> select mid(emp_no,1,2) from Employee;
+-----------------+
| mid(emp_no,1,2) |
+-----------------+
| 1 |
| 2 |
| 3 |
| 4 |
| 5 |
+-----------------+
5 rows in set (0.00 sec)
