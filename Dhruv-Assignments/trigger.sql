mysql> use info;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
Database changed
mysql> create table borrower2(roll_no int,name varchar(20),date_of_issue
date,book varchar2);
Query OK, 0 rows affected (0.44 sec)
mysql>insert into borrower2 values('1','nick','2018-06-
10','wings_of_fire','avaliable','APJ');
Query OK, 1 row affected (0.07 sec)
mysql> insert into borrower2 values('2','mira','2018-05-
11','leaves_life','not_avaliable','borwarkar');
Query OK, 1 row affected (0.05 sec)
mysql> insert into borrower2 values('3','rina','2018-02-
12','unusal','avaliable','johar');
Query OK, 1 row affected (0.04 sec)
mysql> insert into borrower2 values('4','harsha','2018-06-
20','skylimit','avaliable','ingale');
Query OK, 1 row affected (0.05 sec)
mysql> insert into borrower2 values('5','tej','2018-04-
20','highway','not_avaliable','klm');
Query OK, 1 row affected (0.05 sec)
mysql> select *from borrower1;
+---------+--------+---------------+---------------
+---------------+-----------+
| roll_no | name
| author
|
| date_of_issue | book_name
| status
+---------+--------+---------------+---------------
+---------------+-----------+
|
| APJ
1 | nick
|
| 2018-06-10
| wings_of_fire | avaliable
|
2 | mira
| 2018-05-11
not_avaliable | borwarkar | | leaves_life |
|
3 | rina
| johar
| | unusal | avaliable
|
4 | harsha | 2018-06-20
| ingale
| | skylimit | avaliable
|
5 | tej
| 2018-04-20
not_avaliable | klm
| | highway |
| 2018-02-12
+---------+--------+---------------+---------------
+---------------+-----------+
5 rows in set (0.00 sec)
//INSERT TRIGGER
mysql> delimiter //
mysql> create trigger library after insert on borrower1 for
each row
-> begin
-> insert into audit1
values(new.roll_no,new.name,new.date_of_issue,new.book_name,ne
w.status,new.author,current_timestamp);
-> end;
-> //Query OK, 0 rows affected (0.10 sec)
mysql> insert into borrower1 values('6','xyz','2018-09-
06','aaa','avaliable','xxx');
-> //
Query OK, 1 row affected (0.07 sec)
mysql> select * from borrower1;
-> //
+---------+--------+---------------+---------------
+---------------+-----------+
| roll_no | name
| author
|
| date_of_issue | book_name
| status
+---------+--------+---------------+---------------
+---------------+-----------+
|
| APJ
1 | nick
|
| 2018-06-10
| wings_of_fire | avaliable
|
2 | mira
| 2018-05-11
not_avaliable | borwarkar | | leaves_life |
|
3 | rina
| johar
| | unusal | avaliable
|
4 | harsha | 2018-06-20
| ingale
| | skylimit | avaliable
|
5 | tej
| 2018-04-20
not_avaliable | klm
| | highway |
|
| xxx | aaa | avaliable
6 | xyz
|
| 2018-02-12
| 2018-09-06
+---------+--------+---------------+---------------
+---------------+-----------+
6 rows in set (0.00 sec)
mysql> select * from audit1;
-> //
+---------+------+---------------+-----------+-----------
+--------+---------------------+| roll_no | name | date_of_issue |
book_name | status
author | ts
|
|
+---------+------+---------------+-----------+-----------
+--------+---------------------+
|
6 | xyz | 2018-09-06
| 2018-08-29 15:46:13 |
| aaa
| avaliable | xxx
+---------+------+---------------+-----------+-----------
+--------+---------------------+
1 row in set (0.00 sec)
// UPDATE TRIGGER
mysql> delimiter //
mysql> create trigger library1 after update on borrower1 for
each row
->
begin
->
insert into audit1
values(new.roll_no,new.name,new.date_of_issue,new.book_name,ne
w.status,new.author,current_timestamp);
-> end;
-> //
Query OK, 0 rows affected (0.08 sec)
mysql> update borrower1 set roll_no='8',book_name='leaf' where name='xyz';
-> //
Query OK, 1 row affected (0.04 sec)
Rows matched: 1
Changed: 1
Warnings: 0
mysql> select *from borrower1;
-> //
+---------+--------+---------------+---------------
+---------------+-----------+
| roll_no | name
| author
|
| date_of_issue | book_name
| status+---------+--------+---------------+---------------
+---------------+-----------+
|
| APJ
1 | nick
|
| 2018-06-10
| wings_of_fire | avaliable
|
2 | mira
| 2018-05-11
not_avaliable | borwarkar | | leaves_life |
|
3 | rina
| johar
| | unusal | avaliable
|
4 | harsha | 2018-06-20
| ingale
| | skylimit | avaliable
|
5 | tej
| 2018-04-20
not_avaliable | klm
| | highway |
|
| xxx | leaf | avaliable
8 | xyz
|
| 2018-02-12
| 2018-09-06
+---------+--------+---------------+---------------
+---------------+-----------+
6 rows in set (0.00 sec)
