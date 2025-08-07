select* from netflix_titles;

-- netflix project

CREATE TABLE  netflix_ (
show_id varchar(10),
type_ varchar(20),
title  varchar(150),
director varchar(210),
cast varchar(800) ,
country varchar(150),
date_added varchar(50),
release_year int,
rating varchar(10),
duration varchar(15),
listed_in varchar(30),
description varchar(250)

);

select count(*) from netflix_titles
;
select distinct type
from netflix_titles

-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows
;
select type, count(*) as total_content
from netflix_titles
group by type
;

-- 2. Find the most common rating for movies and TV shows

select type, rating,count(*)
from netflix_titles
group by 1,2
order by 1,3 desc

;

-- 3. List all movies released in a specific year (e.g., 2020)
select type,title,release_year
from netflix_titles 
where type = "Movie" and release_year = 2020
;

-- 4. Find the top 5 countries with the most content on Netflix

select country,count(*)
from netflix_titles
where country is not null and trim(country) <> ''
group by country
order by 2 desc
limit 5
;

-- 5. Identify the longest movie

select type,title,duration
from netflix_titles
where 
type = "Movie" and
duration=(select max(duration) from netflix_titles)
limit 2
;

-- 6. Find content added in the last 5 years
 
SELECT *
FROM netflix_titles
WHERE 
  date_added IS NOT NULL
  AND STR_TO_DATE(date_added, '%M %d, %Y') >= CURDATE() - INTERVAL 5 YEAR
ORDER BY STR_TO_DATE(date_added, '%M %d, %Y') ASC, show_id, type;

-- 7. Find all the movies/TV shows by director 'Toshiya Shinohara'!

select* from netflix_titles
where director like "%Toshiya Shinohara%"
;

-- 8. List all TV shows with more than 5 seasons
select *
from netflix_titles
where  type = 'TV Show' 
and
duration like '%Season%'
and cast(substring_index(duration,' ',1) as unsigned ) >=5
order by duration asc
;


-- 9.Find numbers of content release in India on netflix. 
select 
year(str_to_date(date_added, '%M %d, %Y')) as Year,
count(*) as releases
from netflix_titles
where country = "India"
and date_added is not null
group by Year
order by Year
;
-- 10. List all movies that are crime tv shows

select * 
from netflix_titles
where listed_in like "%Crime TV Shows%"
;



