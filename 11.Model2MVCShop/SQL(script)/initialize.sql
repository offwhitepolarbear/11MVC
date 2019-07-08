DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)	NOT NULL,
	user_name 	VARCHAR2(50)	NOT NULL,
	password 		VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 		VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 						NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day		VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	demailaddr 			VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3),
	order_data 			DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','소니 바이오 노트북 신동품','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'자전거','자전거 좋아요~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'보르도','최고 디자인 신품','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'인라인','좋아욥','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'삼성센스 2G','sens 메모리 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'연꽃','정원을 가꿔보세요','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'삼성센스','노트북','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));


commit;



//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize



////////////////////////재고관리 추가합니다.////////////////////////


CREATE TABLE stock ( 
prod_no NUMBER	NOT NULL REFERENCES product(prod_no),
stock	NUMBER NOT NULL CHECK ( stock >= 0 ),
sales_volume	NUMBER	NOT NULL CHECK ( sales_volume >= 0 ),
PRIMARY KEY(prod_no)
);

INSERT INTO stock
VALUES ( 10000, 1000, 0);

ALTER TABLE transaction ADD (stock NUMBER CHECK ( stock >= 0 ));
update transaction set stock=1;
commit;

update stock set stock = (stock+10), sales_volume = (sales_volume+10) where prod_no=10000


CREATE TABLE cart ( 
user_id VARCHAR2(4000) NOT NULL REFERENCES users(user_id),
cart VARCHAR2(4000) DEFAULT 'empty',
PRIMARY KEY(user_id)
);

INSERT INTO 
cart (user_id)
VALUES ('user01');

INSERT INTO 
cart (user_id)
VALUES ('user02');

SELECT
cart
FROM cart
WHERE user_id = 'user01';

INSERT INTO cart (user_id) VALUES ('user03');
INSERT INTO cart (user_id) VALUES ('user04');
INSERT INTO cart (user_id) VALUES ('user05');
INSERT INTO cart (user_id) VALUES ('user06');
INSERT INTO cart (user_id) VALUES ('user07');
INSERT INTO cart (user_id) VALUES ('user08');
INSERT INTO cart (user_id) VALUES ('user09');
INSERT INTO cart (user_id) VALUES ('user10');
INSERT INTO cart (user_id) VALUES ('user11');
INSERT INTO cart (user_id) VALUES ('user12');
INSERT INTO cart (user_id) VALUES ('user13');
INSERT INTO cart (user_id) VALUES ('user14');
INSERT INTO cart (user_id) VALUES ('user15');
INSERT INTO cart (user_id) VALUES ('user16');
INSERT INTO cart (user_id) VALUES ('user17');
INSERT INTO cart (user_id) VALUES ('user18');
INSERT INTO cart (user_id) VALUES ('user19');

ALTER TABLE transaction ADD(products VARCHAR2(4000) NOT NULL);.

ALTER TABLE transaction ADD(products VARCHAR2(4000));

UPDATE 
transaction
set products='10140a333n'
WHERE tran_no=10100;

UPDATE 
transaction
set products='10160a4n'
WHERE tran_no=10101;

UPDATE 
transaction
set products='10140a5n'
WHERE tran_no=10102;

UPDATE 
transaction
set products='10120a18n'
WHERE tran_no=10080;

UPDATE 
transaction
set products='10029a1n'
WHERE tran_no=10001;

UPDATE 
transaction
set products='10081a1n'
WHERE tran_no=10020;

UPDATE 
transaction
set products='10057a1n'
WHERE tran_no=10021;

UPDATE 
transaction
set products='10100a9n'
WHERE tran_no=10041;

UPDATE 
transaction
set products='10052a1n'
WHERE tran_no=10005;

UPDATE 
transaction
set products='10000a1n'
WHERE tran_no=10000;

UPDATE 
transaction
set products='10056a1n'
WHERE tran_no=10011;

UPDATE 
transaction
set products='10000a1n'
WHERE tran_no=10006;

UPDATE 
transaction
set products='10032a1n'
WHERE tran_no=10003;

UPDATE 
transaction
set products='10033a1n'
WHERE tran_no=10004;

UPDATE 
transaction
set products='10060a1n'
WHERE tran_no=10007;

UPDATE 
transaction
set products='10120a6n'
WHERE tran_no=10060;

UPDATE 
transaction
set products='10100a17n'
WHERE tran_no=10061;

UPDATE 
transaction
set products='10093a223n'
WHERE tran_no=10062;

UPDATE 
transaction
set products='10096a111n'
WHERE tran_no=10063;

UPDATE 
transaction
set products='10100a3n'
WHERE tran_no=10064;

//리뷰 테이블 생성 거래번호가 프라이머리 키 레이팅은 0~10점까지
CREATE TABLE review (
review_no NUMBER(20) NOT NULL,
prod_no NUMBER(20) NOT NULL REFERENCES product(prod_no),
tran_no NUMBER(20) NOT NULL REFERENCES transaction(tran_no),
user_id VARCHAR2(4000) NOT NULL REFERENCES users(user_id),
review VARCHAR2(4000) NOT NULL,
rating NUMBER(2) NOT NULL CHECK ( rating >= 0) CHECK(rating < 11),
img_file VARCHAR2(4000),
reg_date DATE ,
show NUMBER(1) ,
PRIMARY KEY(review_no)
);
ALTER TABLE review ADD(reg_date DATE);

ALTER TABLE review ADD(show NUMBER(1));


SELECT avg(rating)
FROM review
WHERE prod_no=?

SELECT pd.prod_name, avg(r.rating)
FROM product pd, review r
WHERE pd.prod_no = r.prod_no
AND r.prod_no=10000
GROUP BY r.prod_no;



INSERT INTO
review (prod_no, tran_no, user_id, review, rating, img_file, reg_date)
values (#{prodNo},#{tranNo},#{userId},#{review},#{rating},#{img_file},SYSDATE)

INSERT INTO
review (prod_no, tran_no, user_id, review, rating, img_file, reg_date)
values (10000,10000,'user01','리뷰내용입니다.',0,'abdc.jpg',SYSDATE)



select  to_char(reg_DATE , 'YYYYMMDDHH24MISS') from review 
select  to_char(reg_DATE , 'YYYY/MM/DD HH24:MI:SS') from review;