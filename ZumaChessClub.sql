create database chess
use chess


--Creating the club table 
create table Club (
club_id integer Primary Key,
club_name varchar(255),
club_owner varchar(255),
club_location varchar(255),
)

--Creating category table
create table category(
category_id integer Primary Key,
category_name varchar(255)
)

--Creating a refree table
create table refree(
refree_id integer Primary Key,
refree_name varchar(255),
fide_rating  integer
)

--Creating a Player Table 
Create table Player(
player_id integer Primary key,
ranking_level integer,
player_name varchar(255),
fide_rating integer,
banned varchar(255)
)


--Creating a sponsor table 
create table sponsor (
sponsor_id integer primary key,
sponsor_name varchar(255)
)

--Creating a game table 
create table game(
game_id integer primary key
)

--Creating a tournament table
create table tournament(
tour_id integer primary key,
venue varchar(255),
location varchar(255),
tour_name varchar(255)
)

--creating a sponsorship table
create table sponsorship(
sponsorship_id integer primary key,
amount integer
)

--creating table match-up
create table matchup (
date date,
rank_id integer,
total_points integer,
points  integer,
club_id integer,
player_id integer,
category_id integer,
refree_id integer,
game_id integer,
sponsorship_id integer,
tour_id integer,
sponsor_id integer,
Constraint  CPK Primary Key (player_id,game_id,tour_id),
Constraint FK_Club_id  Foreign key (club_id) References Club(club_id),
Constraint FK_Player_id  Foreign key (player_id) References Player(player_id),
Constraint FK_Category_id  Foreign key (category_id) References category(category_id),
Constraint FK_Refree_id  Foreign key (refree_id) References refree(refree_id),
Constraint FK_Game_id  Foreign key (game_id) References game(game_id),
Constraint FK_Sponsorship_id  Foreign key (sponsorship_id) References sponsorship(sponsorship_id),
Constraint FK_tour_id  Foreign key (tour_id) References tournament(tour_id),
Constraint FK_sponsor_id Foreign key (sponsor_id) References sponsor(sponsor_id)
)

--inserting values into club
Insert into Club values (111,'lotus','ram','dallas')
Insert into Club values (112,'rose','raj','dallas')
Insert into Club values (113,'lily','rohan','dallas')


--inserting values into Player 
insert into Player values (1,30,'Bindi',1400,'No')
insert into Player values (2,29,'Krishna',1300,'No')
insert into Player values (3,29,'Harini',1500,'No')
insert into Player values (4,29,'Aswin',1450,'No')
insert into Player values (5,28,'Sharath',1500,'No')
insert into Player values (6,29,'Shalini',1600,'No')
insert into Player values (7,30,'Riya',1700,'No')
insert into player values (8,31,'Naveen',1650,'No')
insert into player values (9,40,'Kishore',1700,'No')
insert into player values (10,41,'Kumar',1500,'No')
insert into player values (11,42,'Manoj',1550,'No')
insert into player values (12,45,'reeta',1900,'Yes')

--Inserting values into category table 
insert into category values(19,'under19')
insert into category values(24,'under24')
insert into category values(30,'Open')

--Inserting values into sponsor 
insert into sponsor values(1234,'Lions Club')
insert into sponsor values(1235,'Yes Club')

--inserting values into refree table 
insert into refree values(1234567,'Albert',1600)
insert into refree values (1234561,'Aaron',1700)
insert into refree values (1234562,'Amrita',1650)

--Inserting values into game table 
insert into game values(12345678)
insert into game values(12345671)
insert into game values(12345672)
insert into game values(12345673)
insert into game values(12345674)
insert into game values(12345675)
insert into game values(12345676)
insert into game values(12345677)
insert into game values(12345679)
insert into game values(12345680)
insert into game values(12345681)
insert into game values(12345682)
insert into game values(12345683)
insert into game values(12345684)
insert into game values(12345685)


--Inserting values into sponsorship 
insert into sponsorship values (123456,5000)
insert into sponsorship values (123457,6000)

--Inserting values into tournament 
insert into tournament values(12345,'dallas','UTD','Interstate')
insert into tournament values(12346,'Austin','UTA','Open Fide Rating')

--Insert values into match up 
insert into matchup values ('2019-02-05',1,1,1,111,1,19,1234567,12345678,123456,12345,1234)
insert into matchup values ('2019-02-05',3,0,0,111,2,19,1234567,12345678,123456,12345,1234)
insert into matchup values ('2019-02-06',2,1,0,111,1,19,1234567,12345671,123456,12345,1234)
insert into matchup values ('2019-02-06',1,2,1,112,3,19,1234567,12345671,123456,12345,1234)
insert into matchup values ('2019-02-07',2,1.5,0.5,111,1,19,1234567,12345672,123456,12345,1234)
insert into matchup values ('2019-02-07',3,0.5,0.5,113,4,19,1234567,12345672,123456,12345,1234)
insert into matchup values ('2019-02-05',2,1,1,112,3,19,1234567,12345673,123456,12345,1234)
insert into matchup values ('2019-02-05',4,0,0,113,4,19,1234567,12345673,123456,12345,1234)
insert into matchup values ('2019-02-08',4,0,0,111,2,19,1234567,12345674,123456,12345,1234)
insert into matchup values ('2019-02-08',3,1.5,1,113,4,19,1234567,12345674,123456,12345,1234)
insert into matchup values ('2019-02-08',4,0,0,111,2,19,1234567,12345675,123456,12345,1234)
insert into matchup values ('2019-02-08',1,3,1,112,3,19,1234567,12345675,123456,12345,1234)
insert into matchup values ('2019-02-05',1,0.5,0.5,112,5,24,1234561,12345676,123456,12345,1234)
insert into matchup values ('2019-02-05',2,0.5,0.5,112,6,24,1234561,12345676,123456,12345,1234)
insert into matchup values ('2019-02-06',4,0,0,111,7,24,1234561,12345677,123456,12345,1234)
insert into matchup values ('2019-02-06',1,1,1,113,8,24,1234561,12345677,123456,12345,1234)
insert into matchup values ('2019-02-08',3,1.5,1,112,5,24,1234561,12345679,123456,12345,1234)
insert into matchup values ('2019-02-08',4,0,0,111,7,24,1234561,12345679,123456,12345,1234)
insert into matchup values ('2019-02-07',2,1.5,0,112,5,24,1234561,12345680,123456,12345,1234)
insert into matchup values ('2019-02-07',1,2,1,113,8,24,1234561,12345680,123456,12345,1234)
insert into matchup values ('2019-02-07',3,1.5,1,112,6,24,1234561,12345681,123456,12345,1234)
insert into matchup values ('2019-02-07',4,0,0,111,7,24,1234561,12345681,123456,12345,1234)
insert into matchup values ('2019-02-08',1,2.5,1,112,6,24,1234561,12345682,123456,12345,1234)
insert into matchup values ('2019-02-08',2,2,0,113,8,24,1234561,12345682,123456,12345,1234)
insert into matchup values ('2020-03-12',1,1,1,111,9,30,1234562,12345683,123457,12346,1235)
insert into matchup values ('2020-03-12',2,0,0,111,10,30,1234562,12345683,123457,12346,1235)
insert into matchup values ('2020-03-13',1,2,1,111,9,30,1234562,12345684,123457,12346,1235)
insert into matchup values ('2020-03-13',3,0,0,112,11,30,1234562,12345684,123457,12346,1235)
insert into matchup values ('2020-03-13',2,1,1,111,10,30,1234562,12345685,123457,12346,1235)
insert into matchup values ('2020-03-13',3,0,0,112,11,30,1234562,12345685,123457,12346,1235)

--Showing table records
Select * from  Club
Select * from category
SELECT * From refree
SELECT * from Player
SELECT * from sponsor
Select * from sponsorship
select * from game 
select * from tournament
select * from matchup

--inner join to find the refree name who monitored the match and the players played in the match
select r.refree_id,r.refree_name,m.game_id,p.player_name from refree as r 
inner join matchup as m
on r.refree_id=m.refree_id
inner join Player as p 
on p.player_id=m.player_id
group by m.game_id, r.refree_id,r.refree_name,p.player_name;

--inner join to find out which player played against which player and who won the match
select m.game_id,m.points,p.player_id,p.player_name from player as p 
inner join matchup as m 
on p.player_id= m.player_id
group by m.game_id, m.points,p.player_id,p.player_name;

--full outer join to get the players who are banned from the tournament along with players who are not banned
select * from player as p 
full join matchup as m 
on p.player_id=m.player_id

-- we can use the where clause to list only the player who is baned from the tournament 
select * from player as p 
full join matchup as m 
on p.player_id=m.player_id
where p.banned='Yes'

--Left join 
-- amount sponsored by sponsors to tournament 
select * from matchup as m
left join sponsorship as sp
on sp.sponsorship_id=m.sponsorship_id
inner join sponsor as s 
on s.sponsor_id=m.sponsor_id

select * from matchup as m
left join  Player as p 
on  p.player_id=m.player_id
where p.player_id=1;


--category is left joined with match up table 
Insert into category values (7,'Under 7')

select c.category_id,c.category_name,m.club_id,m.sponsor_id from category as c 
left join matchup as m 
on c.category_id=m.category_id


--Right Join 
insert into Club values(6,'Pink','Rishi','Canada')

select * from matchup as m 
right join Club as c 
on c.club_id=m.club_id


-- Intersect
-- This intersect command gets only the players id who are not banned and who played in the tournament
insert into Player values(20,40,'Max',1400,'No')

SELECT p.player_id from Player as p
intersect 
Select m.player_id from matchup as m

--Selecting the player name from the table using the subquery and intersect
select q.player_id,q.player_name  from player as q where q.player_id in (SELECT p.player_id from Player as p
intersect 
Select m.player_id from matchup as m
)

--Union 
-- The below union combines the player id from players table and those who participated in the tournament 
SELECT p.player_id from player as p
union
select m.player_id from matchup as m
order by p.player_id asc ;

--Except 
-- This gives the list of player id who didnt participate in the tournament 
Select p.player_id from player as p
except
select m.player_id from matchup as m

 --Using the subquery and the except
-- This gives the list of players who didnt participate in the tournament
select q.player_id,q.player_name,q.banned  from player as q where q.player_id in (Select p.player_id from player as p
except
select m.player_id from matchup as m
)
 
 Drop database Chess 