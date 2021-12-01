mysql> show databases;
+--------------------+
| Database
|
+--------------------+
| information_schema |
| A |
| db3 |
| COMPUTER |
| H |
| PVG |
| RENUKA |
| mysql |
| nishant |
| nishantl |
| performance_schema |
| renuka |
| sys |
| time |
+--------------------+
14 rows in set (0.21 sec)
mysql> use db3;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -ADatabase changed
mysql> show tables;
+----------------+
| Tables_in_Abhi |
+----------------+
| Employee |
| TE |
| auto |
| c_master |
| product_master |
+----------------+
5 rows in set (0.00 sec)
mysql> create table _master(product_no int,description varchar(20),profit_per
float,unit_measure varchar(10),quantity int,reorder int,sell_price
float,cost_price float,primary key(product_no));
Query OK, 0 rows affected (0.55 sec)
mysql> create table customer(cust_no int,cust_name varchar(20),cust_add
varchar(20),phone_no int,primary key(cust_no));
Query OK, 0 rows affected (0.28 sec)
mysql> create table capital(cap_no int,cap_name varchar(20),state_no
int,primary key(cap_no));
Query OK, 0 rows affected (0.27 sec)
mysql> create table state(state_no int,state_name varchar(20),state_code
int,capital varchar(20),primary key(state_no));
Query OK, 0 rows affected (0.28 sec)
mysql> insert into capital values('01','MH','01');
Query OK, 1 row affected (0.12 sec)
mysql> insert into capital values('02','RAJ','02');
Query OK, 1 row affected (0.04 sec)
mysql> insert into capital values('03','GOA','03');
Query OK, 1 row affected (0.05 sec)
mysql> insert into capital values('04','GUJ','04');
Query OK, 1 row affected (0.05 sec)
mysql> insert into capital values('05','KAR','05');
Query OK, 1 row affected (0.04 sec)
mysql> insert into state values('01','MH','01','MUM');
Query OK, 1 row affected (0.03 sec)
mysql> insert into state values('02','RAJ','02','JAI');
Query OK, 1 row affected (0.03 sec)
mysql> insert into state values('03','GOA','03','PAN');
Query OK, 1 row affected (0.04 sec)
mysql> insert into state values('04','GUJ','04','SUR');
Query OK, 1 row affected (0.04 sec)
mysql> insert into state values('05','KAR','05','BAN');
Query OK, 1 row affected (0.03 sec)
mysql> select * from capital;
+--------+----------+----------+
| cap_no | cap_name | state_no |
+--------+----------+----------+| 1 | MH | 1 |
| 2 | RAJ | 2 |
| 3 | GOA | 3 |
| 4 | GUJ | 4 |
| 5 | KAR | 5 |
+--------+----------+----------+
5 rows in set (0.01 sec)
mysql> select * from state;
+----------+------------+------------+---------+
| state_no | state_name | state_code | capital |
+----------+------------+------------+---------+
| 1 | MH | 1 | MUM |
| 2 | RAJ | 2 | JAI |
| 3 | GOA | 3 | PAN |
| 4 | GUJ | 4 | SUR |
| 5 | KAR | 5 | BAN |
+----------+------------+------------+---------+
5 rows in set (0.00 sec)
mysql> select capital.cap_no, state.state_no from capital inner join state on
capital.cap_no=state.state_no;
+--------+----------+
| cap_no | state_no |
+--------+----------+
| 1 | 1 |
| 2 | 2 |
| 3 | 3 |
| 4 | 4 |
| 5 | 5 |
+--------+----------+
5 rows in set (0.06 sec)
mysql> UPDATE state SET state_no="78" where state_no='1';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> UPDATE state SET state_no="58" where state_no='2';
Query OK, 1 row affected (0.04 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> UPDATE state SET state_no="46" where state_no='3';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> UPDATE state SET state_no="489" where state_no='4';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> UPDATE state SET state_no="458" where state_no='5';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> insert into state values('05','MP','05','BHO');
Query OK, 1 row affected (0.03 sec)
mysql> select capital.cap_no, state.state_no from capital inner join state on
capital.cap_no=state.state_no;
+--------+----------+
| cap_no | state_no |
+--------+----------+
|
5 |
5 |
+--------+----------+
1 row in set (0.00 sec)
mysql> select capital.cap_no, state.state_no from capital left join state on
capital.cap_no=state.state_no;
+--------+----------+
| cap_no | state_no |
+--------+----------+
| 1 | NULL |
| 2 | NULL |
| 3 | NULL |
| 4 | NULL |
| 5 | 5 |
+--------+----------+
5 rows in set (0.00 sec)
mysql> select capital.cap_no, state.state_no from capital left join state on
capital.cap_no=state.state_name;
+--------+----------+
| cap_no | state_no |
+--------+----------+
| 1 | NULL |
| 2 | NULL |
| 3 | NULL |
| 4 | NULL |
| 5 | NULL |
+--------+----------+
5 rows in set, 20 warnings (0.00 sec)
mysql> select capital.cap_no, state.state_no from capital right join state on
capital.cap_no=state.state_no;
+--------+----------+
| cap_no | state_no |
+--------+----------+
|
5 |
5 || NULL | 46 |
| NULL | 58 |
| NULL | 78 |
| NULL | 458 |
| NULL | 489 |
+--------+----------+
6 rows in set (0.00 sec)
mysql> select * from capital;
+--------+----------+----------+
| cap_no | cap_name | state_no |
+--------+----------+----------+
| 1 | MH | 1 |
| 2 | RAJ | 2 |
| 3 | GOA | 3 |
| 4 | GUJ | 4 |
| 5 | KAR | 5 |
+--------+----------+----------+
5 rows in set (0.00 sec)
mysql> select * from state;
+----------+------------+------------+---------+
| state_no | state_name | state_code | capital |
+----------+------------+------------+---------+
| 5 | MP | 5 | BHO |
| 46 | GOA | 3 | PAN |
| 58 | RAJ | 2 | JAI |
| 78 | MH | 1 | MUM |
| 458 | KAR | 5 | BAN |
| 489 | GUJ | 4 | SUR |
+----------+------------+------------+---------+
6 rows in set (0.00 sec)
mysql> select * from capital;
+--------+----------+----------+
| cap_no | cap_name | state_no |
+--------+----------+----------+
| 1 | MH | 1 |
| 2 | RAJ | 2 |
| 3 | GOA | 3 |
| 4 | GUJ | 4 |
| 5 | KAR | 5 |
+--------+----------+----------+
5 rows in set (0.00 sec)
mysql> select capital.cap_no, state.state_no from capital inner join state on
capital.cap_no=state.state_no;
+--------+----------+
| cap_no | state_no |
+--------+----------+
|
5 |
5 |
+--------+----------+
1 row in set (0.00 sec)
mysql> select capital.cap_no,capital.cap_name,state.capital,state.state_no from
capital inner join state on capital.cap_no=state.state_no;
+--------+----------+---------+----------+
| cap_no | cap_name | capital | state_no |
+--------+----------+---------+----------+
|
5 | KAR
| BHO
|
5 |
+--------+----------+---------+----------+
1 row in set (0.00 sec)
mysql> select capital.cap_no,capital.cap_name,state.capital,state.state_no
from capital left join state on capital.cap_no=state.state_no;
+--------+----------+---------+----------+
| cap_no | cap_name | capital | state_no |
+--------+----------+---------+----------+
| 1 | MH | NULL | NULL |
| 2 | RAJ | NULL | NULL |
| 3 | GOA | NULL | NULL |
| 4 | GUJ | NULL | NULL |
| 5 | KAR | BHO | 5 |
+--------+----------+---------+----------+
5 rows in set (0.00 sec)
mysql> select capital.cap_no,capital.cap_name,state.capital,state.state_no
from capital right join state on capital.cap_no=state.state_no;
+--------+----------+---------+----------+
| cap_no | cap_name | capital | state_no |
+--------+----------+---------+----------+
|
5 | KAR
| BHO | 5 |
| NULL | NULL | PAN | 46 |
| NULL | NULL | JAI | 58 |
| NULL | NULL | MUM | 78 |
| NULL | NULL | BAN | 458 |
| NULL | NULL | SUR | 489 |
+--------+----------+---------+----------+
6 rows in set (0.00 sec)
mysql> select capital.cap_no,capital.cap_name,state.capital,state.state_no from
capital left join state on capital.cap_no=state.state_no union
selectcapital.cap_no,capital.cap_name,state.capital,state.state_no from capital
right join state on capital.cap_no=state.state_no;
+--------+----------+---------+----------+
| cap_no | cap_name | capital | state_no |
+--------+----------+---------+----------+
| 1 | MH | NULL | NULL |
| 2 | RAJ | NULL | NULL |
| 3 | GOA | NULL | NULL |
| 4 | GUJ | NULL | NULL |
| 5 | KAR | BHO | 5 |
| NULL | NULL | PAN | 46 |
| NULL | NULL | JAI | 58 |
| NULL | NULL | MUM | 78 |
| NULL | NULL | BAN | 458 |
| NULL | NULL | SUR | 489 |
+--------+----------+---------+----------+
10 rows in set (0.00 sec)
mysql> select * from capital c1, state s1 where c1.cap_no=s1.state_no;
+--------+----------+----------+----------+------------
+------------+---------+
| cap_no | cap_name | state_no | state_no | state_name |
state_code | capital |
+--------+----------+----------+----------+------------
+------------+---------+
|
5 | KAR
5 | BHO
|
|
5 |
5 | MP
|
+--------+----------+----------+----------+------------
+------------+---------+
1 row in set (0.00 sec)
mysql> select * from capital c1, state s1 where c1.cap_no! =s1.state_no;
+--------+----------+----------+----------+------------
+------------+---------+
| cap_no | cap_name | state_no | state_no | state_name |
state_code | capital |
+--------+----------+----------+----------+------------
+------------+---------+
|
1 | MH
5 | BHO
| | 1 | 5 | MP |
|
2 | RAJ
5 | BHO
| | 2 | 5 | MP |
|
3 | GOA
5 | BHO
| | 3 | 5 | MP |
|
4 | GUJ
5 | BHO
| | 4 | 5 | MP |
|
1 | MH
3 | PAN
| | 1 | 46 | GOA |
|
2 | RAJ
3 | PAN
| | 2 | 46 | GOA |
|
3 | GOA
3 | PAN
| | 3 | 46 | GOA |
|
4 | GUJ
3 | PAN
| | 4 | 46 | GOA |
|
5 | KAR
3 | PAN
| | 5 | 46 | GOA |
|
1 | MH
2 | JAI
| | 1 | 58 | RAJ |
|
2 | RAJ
2 | JAI
| | 2 | 58 | RAJ |
|
3 | GOA
2 | JAI
| | 3 | 58 | RAJ |
|
4 | GUJ
2 | JAI
| | 4 | 58 | RAJ |
|
5 | KAR
2 | JAI
| | 5 | 58 | RAJ |
|
1 | MH
1 | MUM
| | 1 | 78 | MH |
|
2 | RAJ
1 | MUM
| | 2 | 78 | MH ||
3 | GOA
1 | MUM
| | 3 | 78 | MH |
|
4 | GUJ
1 | MUM
| | 4 | 78 | MH |
|
5 | KAR
1 | MUM
| | 5 | 78 | MH |
|
1 | MH
5 | BAN
| | 1 | 458 | KAR |
|
2 | RAJ
5 | BAN
| | 2 | 458 | KAR |
|
3 | GOA
5 | BAN
| | 3 | 458 | KAR |
|
4 | GUJ
5 | BAN
| | 4 | 458 | KAR |
|
5 | KAR
5 | BAN
| | 5 | 458 | KAR |
|
1 | MH
4 | SUR
| | 1 | 489 | GUJ |
|
2 | RAJ
4 | SUR
| | 2 | 489 | GUJ |
|
3 | GOA
4 | SUR
| | 3 | 489 | GUJ |
|
4 | GUJ
4 | SUR
| | 4 | 489 | GUJ |
|
5 | KAR
4 | SUR
| | 5 | 489 | GUJ |
+--------+----------+----------+----------+------------
+------------+---------+
29 rows in set (0.00 sec)
mysql> select * from state where state_no=(select state_no from state where
state_name='MH');
+----------+------------+------------+---------+
| state_no | state_name | state_code | capital |
+----------+------------+------------+---------+
|
78 | MH
|
1 | MUM
|
+----------+------------+------------+---------+
1 row in set (0.06 sec)
mysql> select * from state where state_no=(select state_no from state where
state_name='GUJ');
+----------+------------+------------+---------+
| state_no | state_name | state_code | capital |
+----------+------------+------------+---------+
|
489 | GUJ
|
4 | SUR
|
+----------+------------+------------+---------+
1 row in set (0.00 sec)
mysql> select * from state where state_no=(select capital.state_no from capital
where cap_name='MH');
Empty set (0.00 sec)
mysql> select * from state where state_no=(select capital.state_no from capital
where cap_name='GUJ');
Empty set (0.00 sec)
mysql> select * from state where state_no=(select capital.state_no from capital
where cap_name='RAJ');
Empty set (0.00 sec)
mysql> select * from state where state_no=(select capital.state_no from capital
where cap_name='KAR');
+----------+------------+------------+---------+
| state_no | state_name | state_code | capital |
+----------+------------+------------+---------+
|
5 | MP
|
5 | BHO
|
+----------+------------+------------+---------+
1 row in set (0.00 sec)
