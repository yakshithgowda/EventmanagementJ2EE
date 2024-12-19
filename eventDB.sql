create database event;

create table customer;


--customer-- 
CREATE TABLE `event`.`customer` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(20) NOT NULL,
  `phone` BIGINT NOT NULL,
  `mail` VARCHAR(25) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE INDEX `cid_UNIQUE` (`cid` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 501;

--client--
CREATE TABLE `event`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `mail` VARCHAR(30) NOT NULL,
  `phone` BIGINT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

--event type--



rollback

use event;
select * from customer;
select * from bookevent;
select * from eventlist;
select * from cancelledbookevent;
select * from feedback;

commit

select * from feedback where bookid=?

select f.bookid,cname,ename,rating,comment 
from feedback f
join bookevent b on b.bid=f.bookID
join eventlist e on b.eid=e.eid

select f.bookid,cname,ename,rating,comment 
from feedback f
join bookevent b on b.bid=f.bookID
join eventlist e on b.eid=e.eid
join customer c on b.cid=c.cid

--average rating of event
select e.ename,avg(rating)
from eventlist e
join bookevent b on b.eid=e.eid 
join feedback f on f.bookid=b.bid
group by e.ename

select * from bookevent where eventdate>now() and bid=5008

select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from bookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid

delete from eventlist
where eid=6;
select bid,e.ename,c.cname,mail,phone,date from bookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid

select * from bookevent b outer join eventlist e on e.eid=b.eid

--status update
UPDATE bookevent
SET status = 'Pending'
WHERE status = 'Completed'

truncate bookevent


status of event-- 
SHOW VARIABLES LIKE 'event_scheduler';


select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from bookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid where b.cid=503

update status--
UPDATE bookevent
SET status = 'Completed'
WHERE status != 'Completed' AND eventdate <= CURDATE();
 
event scheduler--

UpdateStatusToCompletedCREATE EVENT UpdateStatusDaily
ON SCHEDULE EVERY 1 DAY
STARTS '2024-06-20 23:59:00' -- Start date and time (4 PM)
DO
CALL UpdateStatusToCompleted();

ALTER EVENT UpdateStatusDaily
ON SCHEDULE EVERY 1 DAY
STARTS '2024-06-20 10:25:00' -- Start date and time (3:45 PM)
DO
CALL UpdateStatusToCompleted();

 commit;