/*

USE DREAMHOME;

-- SIMPLE SELECT

SELECT * FROM branch;


-- SELECT distinct

SELECT DISTINCT propertyNo FROM viewing;

-- CALCULATED FIELDS     

SELECT salary/12 AS monthly_salary FROM staff;

-- GROUPING, WE HAVE TO USE HAVING INSTEAD OF WHERE

SELECT branchNo, COUNT(*) AS STAFF
FROM staff
GROUP BY branchNo
HAVING STAFF > 1

SELECT * FROM STAFF;

SELECT position, count(position) as pos_count, avg(salary) as avg_sal FROM staff 
group by position
order by avg_sal desc

*/

select * from hotel;

select * from hotel where city = 'boston';

select guest_name, guest_address from guest where guest_address like '%london%' order by guest_name;

select * from room where type in ('family' , 'double') and price < 300 order by price;

select * from booking where date_to is null;

select count(*) from hotel;

select avg(price) as avg_price from room;

select sum(price) as sum from room where type = 'double';

select count(*) from booking where cast(date_from as date) >= '2014-09-01' and cast(date_from as date) <= '2014-09-30';

select hotel_no, count(*) from room
group by hotel_no;

select h.hotel_no, count(*) from room r
left join hotel h on r.hotel_no = h.hotel_no
where h.city = 'amsterdam';