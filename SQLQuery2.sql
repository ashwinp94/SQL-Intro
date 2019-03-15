
--1.Query all of the entries in the Genre table

SELECT Id, Label
FROM GENRE;


--2.Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist(ArtistName, YearEstablished) 
VALUES ('Megadeth', 1983);


--3.Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('Rust In Peace', '9/24/1990', 4044, 'Capitol Records', 28, 5);


--4.Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Hangar 18', 514, '9/24/1990', 5, 28, 23);

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Holy Wars', 636, '9/24/1990', 5, 28, 23);


--5.Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--  Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added

SELECT ar.ArtistName, a.Title, s.Title
 FROM Song s 
 LEFT JOIN Album a ON s.AlbumId = a.Id 
 LEFT JOIN Artist ar ON s.ArtistId = ar.Id
WHERE ar.ArtistName = 'Megadeth'; 
--If you want to specify further "AND s.Title = 'Hangar 18'"


--6.Write a SELECT statement to display how many songs exist for each album. 
--  You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.Title AS Album, Count(s.Title) AS #OfSongs
FROM Album a LEFT JOIN Song s 
ON s.AlbumId = a.Id
GROUP BY a.Title;


--7.Write a SELECT statement to display how many songs exist for each artist. 
--  You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.ArtistName AS Artist, Count(s.Title) AS #OfSongs
FROM Artist a LEFT JOIN Song s 
ON s.ArtistId = a.Id
GROUP BY a.ArtistName;


--8.Write a SELECT statement to display how many songs exist for each genre. 
--  You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label AS Genre, Count(s.Title) AS #OfSongs
FROM Genre g LEFT JOIN Song s 
ON s.GenreId = g.Id
GROUP BY g.Label;


--9.Using MAX() function, write a select statement to find the album with the longest duration. 
--  The result should display the album title and the duration.

SELECT Title AS AlbumName, AlbumLength
FROM Album
WHERE AlbumLength = (
    SELECT max(AlbumLength)
    FROM Album
)


--10.Using MAX() function, write a select statement to find the song with the longest duration. 
--   The result should display the song title and the duration.

SELECT Title AS SongName, SongLength
FROM Song
WHERE SongLength = (
    SELECT max(SongLength)
    FROM Song
)


--11.Modify the previous query to also display the title of the album.

SELECT a.Title AS AlbumName, s.Title AS SongName, SongLength
 FROM Song s LEFT JOIN Album a
 ON s.AlbumId = a.Id
 WHERE SongLength = ( SELECT MAX(SongLength)
 From Song
 )


 --for fun including all the info for the longest song

SELECT ar.ArtistName, a.Title as AlbumName, s.Title as SongName, SongLength
FROM Song s
JOIN Artist ar 
ON s.ArtistId = ar.Id
join album a
on s.AlbumId = a.id
WHERE SongLength = (
    SELECT max(SongLength)
    FROM Song
)


