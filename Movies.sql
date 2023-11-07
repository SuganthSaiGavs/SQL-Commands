CREATE TABLE Movie (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255),
    Language VARCHAR(100),
    Hero VARCHAR(255),
    Director VARCHAR(255),
    MusicDirector VARCHAR(255),
    ReleaseDate DATE,
    Cost DECIMAL(19,4),
    Collection DECIMAL(19,4),
    Review VARCHAR(255)
);

INSERT INTO Movie (Title, Language, Hero, Director, MusicDirector, ReleaseDate, Cost, Collection, Review)
VALUES ('The Great Movie', 'English', 'John Doe', 'Jane Smith', 'Michael Johnson', '2023-09-07', 50.00, 100.00, 'A fantastic movie with great performances.');

SELECT * FROM Movie;

INSERT INTO Movie (Title, Language, Hero, Director, MusicDirector, ReleaseDate, Cost, Collection, Review)
VALUES('Good Night','Tamil','Suganth','Sangeetha','Anirudh','2022-07-04',250000,400000,'Feel Good Film');