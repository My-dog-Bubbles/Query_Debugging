-- Q1
select * from boohbah_stand_link;
select * from boohbah;

SELECT boohbah_id, AVG(sync_level) "avereage", name
FROM boohbah_stand_link l
JOIN boohbah USING (boohbah_id)
group by boohbah_id, name;

-- Q2
select * from boohbah;
select * from jojo_stand;
select * from boohbah_stand_link;

SELECT b.name, s.stand_name
FROM boohbah b 
join boohbah_stand_link l on l.boohbah_id = b.boohbah_id
join jojo_stand s on l.stand_id = s.stand_id;

-- Q3
select * from boohbah;

SELECT name, color
FROM boohbah
WHERE energy_level > 80;

--Q4
select * from boohbah;
select * from boohbah_stand_link;

SELECT b.boohbah_id, l.stand_id
FROM boohbah b
JOIN boohbah_stand_link l ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;

-- Q5
SELECT name
FROM boohbah b
WHERE energy_level > (SELECT AVG(energy_level)
                      FROM boohbah);

-- Q6
select * from jojo_stand;
select * from boohbah;

SELECT name
FROM boohbah
WHERE energy_level > (SELECT max(power) 
                      FROM jojo_stand
                      where season = 3
                      group by season);  

-- Q7
select * from jojo_stand;
select * from boohbah;

SELECT b.name, s.stand_name
FROM boohbah b
join  boohbah_stand_link l on l.boohbah_id = b.boohbah_id 
join jojo_stand s on l.stand_id = s.stand_id
WHERE b.energy_level > 80;

-- Q8
select * from boohbah_stand_link;

SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (select AVG(sync_level) 
                    from boohbah_stand_link); 

-- Q9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT boohbah_id, stand_id FROM boohbah_stand_link);

-- Q10
select * from jojo_stand;
select * from boohbah;

MERGE INTO boohbah b
USING  boohbah_stand_link l
ON (l.boohbah_id = b.boohbah_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = b.energy_level+10;