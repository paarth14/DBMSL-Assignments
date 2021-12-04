Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.27 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ass2               |
| ass3               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdb             |
+--------------------+
7 rows in set (0.00 sec)

mysql> create database ass4;
Query OK, 1 row affected (0.01 sec)

mysql> use ass4;
Database changed
mysql> create table borrower(rollin int(11), name char(20), dateofIssue date, bname char(20), status char(1));
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> desc borrower;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| rollin      | int      | YES  |     | NULL    |       |
| name        | char(20) | YES  |     | NULL    |       |
| dateofIssue | date     | YES  |     | NULL    |       |
| bname       | char(20) | YES  |     | NULL    |       |
| status      | char(1)  | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> alter table borrower
    -> modify column rollin int not null primary key;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table borrower
    -> modify column name char(20) not null;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc borrower;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| rollin      | int      | NO   | PRI | NULL    |       |
| name        | char(20) | NO   |     | NULL    |       |
| dateofIssue | date     | YES  |     | NULL    |       |
| bname       | char(20) | YES  |     | NULL    |       |
| status      | char(1)  | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
5 rows in set (0.01 sec)


mysql> create table fine(rollno int, fdate date, amt int);
Query OK, 0 rows affected (0.03 sec)

mysql> desc fine;
+--------+------+------+-----+---------+-------+
| Field  | Type | Null | Key | Default | Extra |
+--------+------+------+-----+---------+-------+
| rollno | int  | YES  |     | NULL    |       |
| fdate  | date | YES  |     | NULL    |       |
| amt    | int  | YES  |     | NULL    |       |
+--------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> select * from borrower;
Empty set (0.00 sec)


mysql> insert into borrower values(1, 'a', '2020-11-01', 'Java', 'I');
Query OK, 1 row affected (0.01 sec)

mysql> insert into borrower values(2, 'b', '2020-10-15', 'Java', 'I');
Query OK, 1 row affected (0.01 sec)

mysql> update borrower
    -> set bname = 'Networking'
    -> where rollin = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> insert into borrower values(3, 'c', '2020-10-01', 'DBMS', 'I');
Query OK, 1 row affected (0.01 sec)

mysql> insert into borrower values(4, 'd', '2020-09-22', 'CN', 'I');
Query OK, 1 row affected (0.01 sec)

mysql> desc borrower;
+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| rollin      | int      | NO   | PRI | NULL    |       |
| name        | char(20) | NO   |     | NULL    |       |
| dateofIssue | date     | YES  |     | NULL    |       |
| bname       | char(20) | YES  |     | NULL    |       |
| status      | char(1)  | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> select * from borrower;
+--------+------+-------------+------------+--------+
| rollin | name | dateofIssue | bname      | status |
+--------+------+-------------+------------+--------+
|      1 | a    | 2020-11-01  | Java       | I      |
|      2 | b    | 2020-10-15  | Networking | I      |
|      3 | c    | 2020-10-01  | DBMS       | I      |
|      4 | d    | 2020-09-22  | CN         | I      |
+--------+------+-------------+------------+--------+
4 rows in set (0.00 sec)

mysql> select * from fine;
Empty set (0.00 sec)


mysql> delimiter $
mysql> create procedure fine_calculation(IN rno int(3), bname char(20))
    -> begin
    -> declare i_date date;
    -> declare diff int;
    -> declare fine_amt int;
    -> declare exit handler for sqlexception select 'Table not Found';
    -> select dateofIssue into i_date from borrower where rollin = rno and bname=bname;
    -> select datediff(curdate(),i_date) into diff;
    -> if(diff>15 and diff<=30) then
    -> set fine_amt = diff*5;
    -> insert into fine values(rno, curdate(), fine_amt);
    -> elseif(diff>30) then
    -> set fine_amt = 15*5 + (diff-30)*50;
    -> insert into fine values(rno, curdate(), fine_amt);
    -> end if;
    -> update borrower set status = 'R' where rollin=rno and bname=bname;
    -> end;
    -> $
Query OK, 0 rows affected, 1 warning (0.05 sec)


mysql> delimiter ;
mysql> call fine_calculation(3,'DBMS');
Query OK, 1 row affected (0.04 sec)

mysql> select * from fine;
+--------+------------+-------+
| rollno | fdate      | amt   |
+--------+------------+-------+
|      3 | 2021-12-04 | 20025 |
+--------+------------+-------+
1 row in set (0.00 sec)

mysql> select * from borrower;
+--------+------+-------------+------------+--------+
| rollin | name | dateofIssue | bname      | status |
+--------+------+-------------+------------+--------+
|      1 | a    | 2020-11-01  | Java       | I      |
|      2 | b    | 2020-10-15  | Networking | I      |
|      3 | c    | 2020-10-01  | DBMS       | R      |
|      4 | d    | 2020-09-22  | CN         | I      |
+--------+------+-------------+------------+--------+
4 rows in set (0.00 sec)

mysql>
