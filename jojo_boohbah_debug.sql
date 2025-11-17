-- Q1
select * from boohbah_stand_link;
select * from boohbah;

SELECT boohbah_id, (select AVG(sync_level) from boohbah_stand_link) "avereage", name -- group function is not allowed so you need a sub query
FROM boohbah_stand_link l
JOIN boohbah USING (boohbah_id);

-- Q2
select * from boohbah;
select * from jojo_stand;
select * from boohbah_stand_link;

SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l -- have to use a bridge table baceuse boohbah_id and stand_id have no connections
where l.boohbah_id = b.boohbah_id
and l.stand_id = s.stand_id;

-- Q3
select * from boohbah;

SELECT name, color -- boohbah_name is not a column name
FROM boohbah
WHERE energy_level > 80;

--Q4
select * from boohbah;
select * from boohbah_stand_link;

SELECT b.boohbah_id, l.stand_id -- have to and the table name.column 
FROM boohbah b
JOIN boohbah_stand_link l
ON b.boohbah_id = l.boohbah_id
WHERE b.boohbah_id = 2;

-- Q5
SELECT name
FROM boohbah b
WHERE energy_level > (SELECT AVG(energy_level)
                      FROM boohbah); -- You don't need the were

-- Q6
select * from jojo_stand;
select * from boohbah;

SELECT name
FROM boohbah
WHERE energy_level > (SELECT avg(power)
                      FROM jojo_stand
                      where season = 3
                      group by season); -- You are returning multiple value and comparing it to only one

-- Q7
select * from jojo_stand;
select * from boohbah;

SELECT b.name, s.stand_name
FROM boohbah b, jojo_stand s, boohbah_stand_link l
WHERE b.energy_level > 80 and l.boohbah_id = b.boohbah_id -- there was a cartesian join and needed a bridge table
and l.stand_id = s.stand_id;

-- Q8
select * from boohbah_stand_link;

SELECT boohbah_id, sync_level
FROM boohbah_stand_link
WHERE sync_level > (select AVG(sync_level) 
                    from boohbah_stand_link); -- group function is not allowed so you need a sub query

-- Q9
SELECT boohbah_id, stand_id
FROM boohbah_stand_link
WHERE (boohbah_id, stand_id) IN
      (SELECT boohbah_id, stand_id FROM boohbah_stand_link); -- incorrect order switch selected columns in sub query

-- Q10
select * from jojo_stand;
select * from boohbah;

MERGE INTO boohbah b
USING  boohbah_stand_link l
ON (l.boohbah_id = b.boohbah_id)
WHEN MATCHED THEN
  UPDATE SET b.energy_level = b.energy_level+10;
-- we dont want to link the jojo_stand user