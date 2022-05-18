## SQL basic statment Exercise
#Set up database
use albums_db;

Select *
From albums;
## 3.a how many rows are in the albums table? 31
## 3.b how many unique artist names are in the albums table? 23
Select DISTINCT artist
from albums;
## 3.c What is the primary key for the albums table? id
## 3.d What is the oldest release date for any album in the albums table? what is the most recent release date?
Select name, artist, release_date
from albums
ORDER BY release_date ASC;
## 3.d Answer - oldest: Sgt. Pepper's Lonely hearts club band by the beatles (1967); Newest: 21 by Adele (2011)
##
## 4.a The name of all albums by pink floyd.  The Dark Side of the Moon and The Wall.
select *
from albums
where artist = 'Pink Floyd';
##  4.b The year Sgt Pepper's Lonely Hearts club band was released - 1967
select * 
From albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";
## 4.c the genre for the album nevermind: grunge, Alternative rock
Select artist, name, genre
from albums
where name = 'Nevermind';
## 4.e Which albums had less than $20M certified sales? 13 total - grease, bad, sgt pepper's, Dirty dance, let's talk about, dangerous, the immaculate, abbey road, born in usa, brothers in arms, titanic, nevermind, & the wall.
select name, artist, sales
from albums
where sales < 20;
## 4.d which albums were released in the 1990's? 12 total - the body guard, jagged little pill, come on over, falling into you, let's talk about love, Dangerous, the immmaculate collection, Titanic, metallica, nevermind, supernatural.
SELECT name, artist, release_date
from albums
where release_date between 1989 and 1999; 
## 4f all the albums with the genre of "Rock".  Why do these queries not include albums with a gnre of "Hard Rock" or "Progressive rock"? 5 items: Sgt Pepper, 1, abbey road, born in USA, Supernatural.  To get "hard rock or "progresive rock, you need to say LIKE %rock% Example Below
Select name, artist, genre
from albums
where genre = "Rock";

## Bonus Rock including "Hard Rock" and "progressive Rock" - Returns 23 rows with "Rock", "Hard Rock", "progressive Rock", "Folk/soft Rock" etc
Select name, artist, genre
from albums
where genre LIKE '%rock%';