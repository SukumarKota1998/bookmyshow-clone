-- Movie Booking Database Script (MySQL)

-- shema
CREATE schema bookmyshow;

-- use schema
use bookmyshow;

-- Drop tables if exist (for clean import)
DROP TABLE IF EXISTS show_details;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS theatres;
DROP TABLE IF EXISTS languages;

-- Theatres Table
CREATE TABLE theatres (
    id INT PRIMARY KEY,
    theatre_name VARCHAR(100) NOT NULL,
    location_details VARCHAR(255) NOT NULL
);

-- Movies Table
CREATE TABLE movies (
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    duration INT NOT NULL
);

-- Languages Table
CREATE TABLE languages (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    short_name VARCHAR(10) NOT NULL
);

-- Show Details Table
CREATE TABLE show_details (
    id INT PRIMARY KEY,
    theatres_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    language_id INT NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (theatres_id) REFERENCES theatres(id),
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    INDEX idx_theatre (theatres_id),
    INDEX idx_movie (movie_id),
    INDEX idx_language (language_id),
    INDEX idx_start_time (start_time)
);

-- Insert into theatres
INSERT INTO theatres (id, theatre_name, location_details) VALUES
(1, 'satyam', 'Thousandlights, Chennai'),
(2, 'PVR - palaso', 'Vadapalani, Chennai'),
(3, 'PVR - VR', 'Anna Nagar East, Chennai');

-- Insert into movies
INSERT INTO movies (id, name, duration) VALUES
(1, 'Mirai', 150),
(2, 'Mahavatar Narsimha', 165),
(3, 'Madharaasi', 149),
(4, 'Demon Slayer: Kimetsu no Yaiba Infinity Castle', 198);

-- Insert into languages
INSERT INTO languages (id, name, short_name) VALUES
(1, 'Telugu', 'TL'),
(2, 'Tamil', 'TM'),
(3, 'English', 'EN'),
(4, 'Hindi', 'HN');

-- Insert into show_details
INSERT INTO show_details (id, theatres_id, start_time, language_id, movie_id) VALUES
(1, 1, '2025-09-19 09:00:00', 1, 1),
(2, 1, '2025-09-19 12:00:00', 2, 2),
(3, 1, '2025-09-19 15:30:00', 3, 4),
(4, 2, '2025-09-19 09:30:00', 2, 3),
(5, 2, '2025-09-19 13:00:00', 4, 1),
(6, 3, '2025-09-19 10:00:00', 3, 4),
(7, 3, '2025-09-19 14:15:00', 2, 2),
(8, 1, '2025-09-20 09:00:00', 1, 1),
(9, 1, '2025-09-20 12:00:00', 2, 2),
(10, 1, '2025-09-20 15:30:00', 3, 4),
(11, 2, '2025-09-20 09:30:00', 2, 3),
(12, 2, '2025-09-20 13:00:00', 4, 1),
(13, 3, '2025-09-20 10:00:00', 3, 4),
(14, 3, '2025-09-20 14:15:00', 2, 2),
(15, 1, '2025-09-21 09:00:00', 1, 1),
(16, 1, '2025-09-21 12:00:00', 2, 2),
(17, 1, '2025-09-21 15:30:00', 3, 4),
(18, 2, '2025-09-21 09:30:00', 2, 3),
(19, 2, '2025-09-21 13:00:00', 4, 1),
(20, 3, '2025-09-21 10:00:00', 3, 4),
(21, 3, '2025-09-21 14:15:00', 2, 2),
(22, 1, '2025-09-22 09:00:00', 1, 1),
(23, 1, '2025-09-22 12:00:00', 2, 2),
(24, 1, '2025-09-22 15:30:00', 3, 4),
(25, 2, '2025-09-22 09:30:00', 2, 3),
(26, 2, '2025-09-22 13:00:00', 4, 1),
(27, 3, '2025-09-22 10:00:00', 3, 4),
(28, 3, '2025-09-22 14:15:00', 2, 2),
(29, 1, '2025-09-23 09:00:00', 1, 1),
(30, 1, '2025-09-23 12:00:00', 2, 2),
(31, 1, '2025-09-23 15:30:00', 3, 4),
(32, 2, '2025-09-23 09:30:00', 2, 3),
(33, 2, '2025-09-23 13:00:00', 4, 1),
(34, 3, '2025-09-23 10:00:00', 3, 4),
(35, 3, '2025-09-23 14:15:00', 2, 2),
(36, 1, '2025-09-24 09:00:00', 1, 1),
(37, 1, '2025-09-24 12:00:00', 2, 2),
(38, 1, '2025-09-24 15:30:00', 3, 4),
(39, 2, '2025-09-24 09:30:00', 2, 3),
(40, 2, '2025-09-24 13:00:00', 4, 1),
(41, 3, '2025-09-24 10:00:00', 3, 4),
(42, 3, '2025-09-24 14:15:00', 2, 2),
(43, 1, '2025-09-25 09:00:00', 1, 1),
(44, 1, '2025-09-25 12:00:00', 2, 2),
(45, 1, '2025-09-25 15:30:00', 3, 4),
(46, 2, '2025-09-25 09:30:00', 2, 3),
(47, 2, '2025-09-25 13:00:00', 4, 1),
(48, 3, '2025-09-25 10:00:00', 3, 4),
(49, 3, '2025-09-25 14:15:00', 2, 2);


-- sql query to get show details
SELECT 
    t.theatre_name,
    t.location_details,
    sd.start_time,
    m.name AS movie_name,
    l.name AS language
FROM theatres t
LEFT JOIN show_details sd ON t.id = sd.theatres_id
LEFT JOIN movies m ON sd.movie_id = m.id
LEFT JOIN languages l ON sd.language_id = l.id
WHERE t.id = 1
  AND DATE(sd.start_time) = Date("2025-09-20");