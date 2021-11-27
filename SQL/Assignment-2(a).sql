mysql> use Abhi;


Database changed


mysql> show tables;


Empty set (0.02 sec)


mysql> create table client_master(client_no int,client_name varchar(20),address


varchar(50),city varchar(10),pincode int,state varchar(20), bal_due float,primary


key(client_no));


Query OK, 0 rows affected (0.51 sec)


mysql> select * from client_master;


Empty set (0.02 sec)


mysql> insert into client_master


values('001','abhi','nasik','nasik','422004','MH','5000');


Query OK, 1 row affected (0.14 sec)


mysql> insert into client_master values('002','piyu','nasik','nasik','422004','MH','10000');


Query OK, 1 row affected (0.09 sec)


mysql> insert into client_master values('003','abd','nasik','nasik','422003','MH','5000');


Query OK, 1 row affected (0.06 sec)


mysql> insert into client_master values('004','abd','nasik','nasik','422003','MH','5000');


Query OK, 1 row affected (0.05 sec)


mysql> insert into client_master values('005','abc','nasik','nasik','422003','MH','5000');


Query OK, 1 row affected (0.06 sec)


mysql> select * from client_master;


+-----------+-------------+---------+-------+---------+-------


+---------+


| client_no | client_name | address | city


| bal_due |


| pincode | state


+-----------+-------------+---------+-------+---------+-------


+---------+


|


| 1 | abhi


5000 | | nasik | nasik | 422004 | MH


|


| 2 | piyu


10000 | | nasik | nasik | 422004 | MH


|


| 3 | abd


5000 | | nasik | nasik | 422003 | MH


|


| 4 | abd


5000 | | nasik | nasik | 422003 | MH


|


| 5 | abc


5000 | | nasik | nasik | 422003 | MH


+-----------+-------------+---------+-------+---------+-------


+---------+


5 rows in set (0.00 sec)


mysql> select client_name,client_no from client_master;


+-------------+-----------+


| client_name | client_no |


+-------------+-----------+


| abhi | 1 |


| piyu | 2 |


| abd | 3 |


| abd | 4 |


| abc | 5 |+-------------+-----------+


5 rows in set (0.00 sec)


mysql> insert into client_master values('006','xyz','nasik','nasik','422004','MH','6000');


Query OK, 1 row affected (0.15 sec)


mysql> select client_name,client_no from client_master;


+-------------+-----------+


| client_name | client_no |


+-------------+-----------+


| abhi | 1 |


| piyu | 2 |


| abd | 3 |


| abd | 4 |


| abc | 5 |


| xyz | 6 |


6 rows in set (0.08 sec)


mysql> create table product_master(product_no int,description varchar(20),profit_per


float,unit_measure varchar(10),quantity int,reorder int,sell_price float,cost_price


float,primary key(product_no));


Query OK, 0 rows affected (0.77 sec)


mysql> insert into product_master values('001','shampoo','1','one','4','2','10','15');


Query OK, 1 row affected (0.17 sec)


mysql> insert into product_master values('002','oil','13','one','4','2','11','16');


Query OK, 1 row affected (0.06 sec)


mysql> alter table client_master add telephone_no int;


Query OK, 0 rows affected (1.04 sec)


Records: 0


Duplicates: 0


Warnings: 0


mysql> select * from client_master;


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


| client_no | client_name | address | city


| bal_due | telephone_no |


| pincode | state


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


|


| 1 | abhi


5000 |


|


| 2 | piyu


10000 |


|


| 3 | abd


5000 |


|


| 4 | abd


5000 |


|


| 5 | abc


5000 |


|


| 6 | xyz


6000 |


| nasik


| nasik | 422004 | MH


| nasik | 422004 | MH


| nasik | 422003 | MH


| nasik | 422003 | MH


| nasik | 422003 | MH


| nasik | 422004 | MH


NULL |


| nasik


NULL |


| nasik


NULL |


| nasik


NULL |


| nasik


NULL |


| nasik


NULL |


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


6 rows in set (0.00 sec)


mysql> select * from product_master;


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


| product_no | description | profit_per | unit_measure |


quantity | reorder | sell_price | cost_price |


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


|


4 |


1 | shampoo


|


2 |


10 |


1 | one


15 |


||


4 |


2 | oil


2 |


|


11 |


13 | one


16 |


|


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


2 rows in set (0.00 sec)


mysql> create index client_search on client_master(client_no);


Query OK, 0 rows affected (0.42 sec)


Records: 0


Duplicates: 0


Warnings: 0


mysql> create table auto(roll_no int NOT NULL AUTO_INCREMENT,name


varchar(20),primary key(roll_no));


Query OK, 0 rows affected (0.36 sec)


mysql> select * from auto;


Empty set (0.01 sec)


mysql> insert into auto values('1','abc');


Query OK, 1 row affected (0.07 sec)


mysql> insert into auto values('2','adc');


Query OK, 1 row affected (0.08 sec)


mysql> alter table auto auto_increment=100;


Query OK, 0 rows affected (0.07 sec)


Records: 0


Duplicates: 0


mysql> select * from auto;


+---------+------+


| roll_no | name |


+---------+------+


| 1 | abc |


| 2 | adc |


Warnings: 0+---------+------+


2 rows in set (0.00 sec)


mysql> insert into auto values(null,'abd');


Query OK, 1 row affected (0.05 sec)


mysql> select * from auto;


+---------+------+


| roll_no | name |


+---------+------+


| 1 | abc |


| 2 | adc |


| 100 | abd |


+---------+------+


3 rows in set (0.00 sec)


mysql> insert into auto values(null,'reh');


Query OK, 1 row affected (0.06 sec)


mysql> select * from auto;


+---------+------+


| roll_no | name |


+---------+------+


| 1 | abc |


| 2 | adc |


| 100 | abd |


| 101 | reh |


+---------+------+


4 rows in set (0.00 sec)


mysql> update client_master set client_name="nut" where client_no='4';


Query OK, 1 row affected (0.09 sec)


Rows matched: 1


Changed: 1


Warnings: 0


mysql> select * from client_master;


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


| client_no | client_name | address | city


| bal_due | telephone_no |


| pincode | state


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


|


| 1 | abhi


5000 | NULL |


| nasik


|


| 2 | piyu


10000 | NULL |


|


| 3 | abd


5000 | NULL |


|


| 4 | nut


5000 | NULL |


|


| 5 | abc


5000 | NULL |


|


| 6 | xyz


6000 | NULL |


| nasik


| nasik


| nasik


| nasik


| nasik


| nasik | 422004 | MH


| nasik | 422004 | MH


| nasik | 422003 | MH


| nasik | 422003 | MH


| nasik | 422003 | MH


| nasik | 422004 | MH


+-----------+-------------+---------+-------+---------+-------


+---------+--------------+


6 rows in set (0.00 sec)


mysql> create index client_find on client_master(client_name,city);


affected (0.41 sec)


Records: 0


Duplicates: 0


mysql> show tables;


+----------------+


| Tables_in_Abhi |


+----------------+


| auto


|


Warnings: 0


Query OK, 0 rows| client_master


|


| product_master |


+----------------+


3 rows in set (0.08 sec)


mysql> select * from product_master;


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


| product_no | description | profit_per | unit_measure |


quantity | reorder | sell_price | cost_price |


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


|


4 | 1 | shampoo


|


2 |


10 | 1 | one


15 | |


|


4 | 2 | oil


2 | 13 | one


16 | |


|


11 |


+------------+-------------+------------+--------------


+----------+---------+------------+------------+


2 rows in set (0.00 sec)


mysql> desc product_master;


+--------------+-------------+------+-----+---------+-------+


| Field


| Type


| Null | Key | Default | Extra |


+--------------+-------------+------+-----+---------+-------+


| product_no | int(11)


| description | profit_per


| NO


| PRI | NULL | |


| varchar(20) | YES | | NULL | |


| float | YES | | NULL | |


| unit_measure | varchar(10) | YES | | NULL | |


| quantity | int(11) | YES | | NULL | |


| reorder | int(11) | YES | | NULL | |


| sell_price | float | YES | | NULL | |


| cost_price | float | YES | | NULL | |


+--------------+-------------+------+-----+---------+-------+


8 rows in set (0.05 sec)


mysql> alter table client_master rename to c_master;


Query OK, 0 rows affected (0.25 sec)


mysql> insert into product_master values('003','nutela','15','three','40','5','110','123');


Query OK, 1 row affected (0.05 sec)


mysql> alter table product_master modify sell_price float(10,2);


Query OK, 0 rows affected (0.06 sec)


Records: 0


Duplicates: 0


Warnings: 0


mysql> desc product_master;


+--------------+-------------+------+-----+---------+-------+


| Field


| Type


| Null | Key | Default | Extra |


+--------------+-------------+------+-----+---------+-------+


| product_no | int(11)


| description | profit_per


| NO


| PRI | NULL | |


| varchar(20) | YES | | NULL | |


| float | YES | | NULL | |


| unit_measure | varchar(10) | YES | | NULL | |


| quantity | int(11) | YES | | NULL | |


| reorder | int(11) | YES | | NULL | |


| sell_price | float(10,2) | YES | | NULL | |


| cost_price | float | | NULL | |


| YES


+--------------+-------------+------+-----+---------+-------+


8 rows in set (0.00 sec)


mysql> create view client as select client_no,client_name from c_master;


Query OK, 0 rows affected (0.05 sec)


mysql> select * from client;


+-----------+-------------+| client_no | client_name |


+-----------+-------------+


| 5 | abc |


| 3 | abd |


| 1 | abhi |


| 4 | nut |


| 2 | piyu |


| 6 | xyz |


+-----------+-------------+


6 rows in set (0.23 sec)


