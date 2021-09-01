-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE songs_artists
(
    id SERIAL PRIMARY KEY,
    artist_name TEXT NOT NULL,
    song_id INT REFERENCES songs NOT NULL
);

CREATE TABLE songs_producers
(
    id SERIAL PRIMARY KEY,
    producer_name TEXT NOT NULL,
    song_id INT REFERENCES songs NOT NULL
);



INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream');


INSERT INTO songs_artists
(artist_name, song_id)
VALUES
('Hanson', 1),
('Queen', 2),
('Mariah Cary', 3),
('Boyz II Men', 3);


INSERT INTO songs_producers
(producer_name, song_id)
VALUES
('Dust Brothers', 1),
('Stephen Lironi', 1),
('Roy Thomas Baker', 2),
('Walter Afanasieff', 3);



