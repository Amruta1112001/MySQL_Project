-- first create the database
create database athletes;

-- use athletes database
use athletes;

-- create table olympics2
create table olympics2(
Id int,
Name varchar(500),
Sex varchar(400),
Age int,
Height int,
Weight int,
Team varchar(400),
NOC varchar(400),
Games varchar(400),
Year int,
Season varchar(400),
City varchar(450),
Sport varchar(400),
Event varchar(450),
Medal varchar(400)
);

-- view table
select * from olympics2;

-- it show path of your file
SHOW VARIABLES LIKE "secure_File_priv";

-- to load the table data csv file
load data infile 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/athletes_cleaned.csv'
into table olympics2
fields terminated by ","
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

-- 1.Show how many medal counts present for entire data
select medal, count(medal) as medal_count
from olympics2
group by medal
order by medal_count asc;

-- 2.Show count of unique Sports are present in olympics
select count(distinct sport) as unique_sports_count
from olympics2;

-- 3.Show how many different medals won by Team India in data
select medal, count(medal) as medal_Count
from olympics2
where team ="India"
group by medal
order by medal_count asc;

-- 4.Show event wise medals won by india show from highest to lowest medals won
select event,count(medal) as medal_count
from olympics2
where team = 'India' and medal <> 'Nomedal'
group by event
order by medal_count desc;

-- 5.Show event and yearwise medals won by india in order of year
select event,year,count(medal) as medal_count
from olympics2
where team='India' and medal<>'Nomedal'
group by event,year
order by year desc;

-- 6.Show the country with maximum medals won gold, silver, bronze
select team, count(medal) as medal_count
from olympics2
where medal<>'Nomedal'
group by team
order by medal_count desc;

-- 7.Show the top 10 countries with respect to gold medals
select team,count(medal) as medal_count
from olympics2
where medal='Gold' and medal<>'Nomedal'
group by team
order by medal_count desc limit 10;

-- 8.Show in which year did United States won most medals
select year,count(medal) as medal_count
from olympics2
where team='United States' and medal<>'Nomedal'
group by year
order by medal_count desc limit 1;

-- 9.In which sports United States has most medals
select sport, count(medal) as medal_count
from olympics2
where team = 'United States' and medal<>'Nomedal'
group by sport
order by medal_count desc 
limit 1;

-- 10.Find top 3 players who have won most medals along with their sports and country
select name,sport,team, count(medal) as medal_count
from olympics2
where medal<>'Nomedal'
group by name,sport,team
order by medal_count desc limit 3;

-- 11.Find player with most gold medals in cycling along with his country
select name,team,sport, count(medal) as medal_count
from olympics2
where sport='cycling' and medal='gold'
group by name,team,sport
order by medal_count desc limit 1;

-- 12.Find player with most medals (Gold +Silver + Bronze) in Basketball also show his country
select name,team,sport,count(medal) as medal_count
from olympics2
where sport='basketball' and medal<>'Nomedal'
group by name,team,sport
order by medal_count desc limit 1;

-- 13.Find out the count of different medals of the top basketball player
select name,medal,count(medal) as medal_count
from olympics2
where name='teresa edwards' and medal<>'Nomedal'
group by medal
order by medal_count desc;

-- 14.Find out medals won by male, female each year . Export this data and plot graph in excel
select sex,year,count(medal) as medal_count
from olympics2
group by year,sex
order by year asc;

-- 15.Graph for male vs female medals
-- answer in attached xl file 