USE albums_db;
SHOW TABLES;

SELECT id FROM albums;
#31 Rows
SELECT DISTINCT artist FROM albums;
#23 Unique artists
DESCRIBE albums;
#Primary key is 'id' column
SELECT * FROM albums
WHERE release_date <= 1970 OR release_date >= 2000;
#Oldest release date = "Sgt. Pepper's Lonely Hearts Club Band by The Beatles in 1967"
#Newest = Adele's "21" released in 2011
SELECT name FROM albums
WHERE artist = 'Pink Floyd';
#'The Wall' and 'The Dark Side of the Moon' are present in 'albums'
SELECT genre FROM albums
WHERE name = 'Nevermind';
#The album 'Nevermind' is listed as having genre = 'Grunge, Alternative rock'
SELECT name FROM albums
WHERE release_date <= 1999 AND release_date >= 1990;
#Albums released between 1990 and 2000 include: 
#The Bodyguard
#Jagged Little Pill
#Come On Over
#Falling into You
#Let's Talk About Love
#Dangerous
#The Immaculate Collection
#Titanic: Music from the Motion Picture
#Metallica
#Nevermind
#Supernatural
SELECT name FROM albums
WHERE sales < 20;
#Albums with less than 20m sales                         |
#--------------------------------------------------------|
#Grease: The Original Soundtrack from the Motion Picture |
#Bad                                                     |
#Sgt. Pepper's Lonely Hearts Club Band                   |
#Dirty Dancing                                           |
#Let's Talk About Love                                   |
#Dangerous                                               |
#The Immaculate Collection                               |
#Abbey Road                                              |
#Born in the U.S.A.                                      |
#Brothers in Arms                                        |
#Titanic: Music from the Motion Picture                  |
#Nevermind                                               |
#The Wall                                                |
SELECT name FROM albums
WHERE genre = 'Rock';
#Albums labeled as 'Rock'             |
/*------------------------------------|
Sgt. Pepper's Lonely Hearts Club Band |
1                                     |
Abbey Road                            |
Born in the U.S.A.                    |
Supernatural                          | 
Albums listed are not categorized as "Prog. rock" or 'Alt. rock' so this explicitly lists albums WHERE genre ='Rock'*/

SELECT year FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';