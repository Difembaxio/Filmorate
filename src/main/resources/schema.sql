DROP TABLE IF EXISTS LIKES CASCADE;
DROP TABLE IF EXISTS FRIENDSHIP CASCADE;
DROP TABLE IF EXISTS FILM_GENRES CASCADE;
DROP TABLE IF EXISTS GENRE CASCADE;
DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS FILMS CASCADE;
DROP TABLE IF EXISTS MPA CASCADE;

CREATE TABLE IF NOT EXISTS MPA (
  ID integer GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  MPA_RATING varchar(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS FILMS (
  ID integer GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  NAME varchar(255) NOT NULL,
  DESCRIPTION varchar(2000) NOT NULL,
  RELEASE_DATE date NOT NULL,
  DURATION int NOT NULL,
  MPA_ID int NOT NULL REFERENCES MPA(id)
);

CREATE TABLE IF NOT EXISTS USERS (
  ID integer GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  EMAIL varchar(255) NOT NULL,
  LOGIN varchar(255) NOT NULL,
  NAME varchar(255) NOT NULL,
  BIRTHDAY date NOT NULL
);

CREATE TABLE IF NOT EXISTS GENRE (
  ID integer GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
  GENRE_NAME varchar(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS FILM_GENRES (
  FILM_ID integer NOT NULL REFERENCES FILMS(id) ON DELETE CASCADE ON UPDATE NO ACTION,
  GENRE_ID integer NOT NULL REFERENCES GENRE(id) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS FRIENDSHIP (
  USER_ID integer NOT NULL REFERENCES USERS(id) ON DELETE CASCADE ON DELETE CASCADE ON UPDATE NO ACTION,
  FRIEND_ID integer NOT NULL REFERENCES USERS(id) ON DELETE CASCADE ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS LIKES (
  FILM_ID integer NOT NULL REFERENCES FILMS(id) ON DELETE CASCADE ON UPDATE NO ACTION,
  USER_ID integer NOT NULL REFERENCES USERS(id) ON DELETE CASCADE ON UPDATE NO ACTION
);