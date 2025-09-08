-- Movie Ratings Assignment SQL Schema for MySQL

-- Create and use database
CREATE DATABASE IF NOT EXISTS movieratings;
USE movieratings;

-- Drop tables if they exist (order matters for FKs)
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS friends;
DROP TABLE IF EXISTS movies;

-- Table for friends (raters)
CREATE TABLE friends (
    friend_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Table for movies
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

-- Ratings table (many-to-many relationship)
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    friend_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5), -- CHECK works for MySQL 8.0.16+, ignored on older
    FOREIGN KEY (friend_id) REFERENCES friends(friend_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Optional: Indexes for performance (not required for small datasets)
-- CREATE INDEX idx_ratings_friend_id ON ratings(friend_id);
-- CREATE INDEX idx_ratings_movie_id ON ratings(movie_id);

-- Insert friends
INSERT INTO friends (name) VALUES ('Alice');
INSERT INTO friends (name) VALUES ('Bob');
INSERT INTO friends (name) VALUES ('Carol');
INSERT INTO friends (name) VALUES ('David');
INSERT INTO friends (name) VALUES ('Eve');

-- Insert movies
INSERT INTO movies (title, year) VALUES ('Oppenheimer', 2023);
INSERT INTO movies (title, year) VALUES ('Barbie', 2023);
INSERT INTO movies (title, year) VALUES ('Spider-Man: Across the Spider-Verse', 2023);
INSERT INTO movies (title, year) VALUES ('Guardians of the Galaxy Vol. 3', 2023);
INSERT INTO movies (title, year) VALUES ('Mission: Impossible – Dead Reckoning Part One', 2023);
INSERT INTO movies (title, year) VALUES ('John Wick: Chapter 4', 2023);

-- Insert ratings (only movies each friend has rated)
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (1, 1, 5); -- Alice - Oppenheimer
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (1, 2, 4); -- Alice - Barbie
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (1, 3, 5); -- Alice - Spider-Man
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (2, 1, 4); -- Bob - Oppenheimer
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (2, 2, 5); -- Bob - Barbie
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (2, 4, 3); -- Bob - Guardians
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (3, 3, 3); -- Carol - Spider-Man
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (3, 5, 2); -- Carol - Mission Impossible
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (4, 2, 2); -- David - Barbie
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (4, 3, 4); -- David - Spider-Man
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (4, 4, 5); -- David - Guardians
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (4, 6, 5); -- David - John Wick
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (5, 1, 3); -- Eve - Oppenheimer
INSERT INTO ratings (friend_id, movie_id, rating) VALUES (5, 6, 4); -- Eve - John Wick

-- Sample Query: Ratings Matrix (all friend/movie pairs)
-- SELECT f.name AS friend, m.title AS movie, r.rating
-- FROM friends f
-- CROSS JOIN movies m
-- LEFT JOIN ratings r ON r.friend_id = f.friend_id AND r.movie_id = m.movie_id
-- ORDER BY f.name, m.title;