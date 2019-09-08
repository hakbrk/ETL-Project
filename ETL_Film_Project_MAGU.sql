CREATE DATABASE movies_db

CREATE TABLE "movie" (
  "imdb_id" VARCHAR(9) PRIMARY KEY,
  "title" VARCHAR(150),
  "homepage" VARCHAR(250),
  "budget" NUMERIC(12,2),
  "original_language" VARCHAR(2),
  "overview" VARCHAR(1500),
  "popularity" NUMERIC(8,4),
  "poster_path" VARCHAR(100),
  "release_date" DATE,
  "revenue" NUMERIC(12,2),
  "runtime" INT,
  "status" VARCHAR(20),
  "tagline" VARCHAR(500),
  "original_title" VARCHAR(150),
  "vote_average" NUMERIC(8,2),
  "vote_count" INT,
  "adult" VARCHAR(5),
  "rated" VARCHAR(5),
  "awards" VARCHAR(200),
  "collection_id" INT DEFAULT NULL
);

CREATE TABLE "film_actor" (
  "actor_id" VARCHAR(10),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "actor" (
  "actor_id" VARCHAR(10) PRIMARY KEY,
  "first_name" VARCHAR(90),
  "last_name" VARCHAR(90)
);

CREATE TABLE "spoken_language" (
  "lang_id" VARCHAR(2) PRIMARY KEY,
  "name" VARCHAR(20)
);

CREATE TABLE "film_spoken_language" (
  "lang_id" VARCHAR(2),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "genre" (
  "genre_id" VARCHAR(5) PRIMARY KEY,
  "name" VARCHAR(25)
);

CREATE TABLE "film_genre" (
  "genre_id" VARCHAR(5),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "production_company" (
  "company_id" VARCHAR(5) PRIMARY KEY,
  "name" VARCHAR(250)
);

CREATE TABLE "film_production_company" (
  "company_id" VARCHAR(5),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "writer" (
  "writer_id" VARCHAR(10) PRIMARY KEY,
  "first_name" VARCHAR(90),
  "last_name" VARCHAR(90)
);

CREATE TABLE "film_writer" (
  "writer_id" VARCHAR(10),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "director" (
  "director_id" VARCHAR(10) PRIMARY KEY,
  "first_name" VARCHAR(90),
  "last_name" VARCHAR(90)
);

CREATE TABLE "film_director" (
  "director_id" VARCHAR(10),
  "imdb_id" VARCHAR(9)
);

CREATE TABLE "country" (
  "country_id" VARCHAR(2) PRIMARY KEY,
  "name" VARCHAR(50)
);

CREATE TABLE "film_country" (
  "country_id" VARCHAR(2),
  "imdb_id" VARCHAR(9) 
);

CREATE TABLE "collection" (
  "collection_id" INT PRIMARY KEY,
  "name" VARCHAR(150),
  "poster_path" VARCHAR(150),
  "backdrop_path" VARCHAR(50)
); 

CREATE TABLE "w_collec" (
  "collection_id" INT,
  "imdb_id" VARCHAR(9)
 );


ALTER TABLE "film_actor" ADD PRIMARY KEY ("actor_id", "imdb_id");

ALTER TABLE "film_spoken_language" ADD PRIMARY KEY ("lang_id", "imdb_id");

ALTER TABLE "film_genre" ADD PRIMARY KEY ("genre_id", "imdb_id");

ALTER TABLE "film_production_company" ADD PRIMARY KEY ("company_id", "imdb_id");

ALTER TABLE "film_writer" ADD PRIMARY KEY ("writer_id", "imdb_id");

ALTER TABLE "film_director" ADD PRIMARY KEY ("director_id", "imdb_id");

ALTER TABLE "film_country" ADD PRIMARY KEY ("country_id", "imdb_id");

ALTER TABLE "movie" ADD FOREIGN KEY ("collection_id") REFERENCES "collection" ("collection_id");

ALTER TABLE "film_actor" ADD FOREIGN KEY ("actor_id") REFERENCES "actor" ("actor_id");

ALTER TABLE "film_actor" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_spoken_language" ADD FOREIGN KEY ("lang_id") REFERENCES "spoken_language" ("lang_id");

ALTER TABLE "film_spoken_language" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_genre" ADD FOREIGN KEY ("genre_id") REFERENCES "genre" ("genre_id");

ALTER TABLE "film_genre" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_production_company" ADD FOREIGN KEY ("company_id") REFERENCES "production_company" ("company_id");

ALTER TABLE "film_production_company" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_writer" ADD FOREIGN KEY ("writer_id") REFERENCES "writer" ("writer_id");

ALTER TABLE "film_writer" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_director" ADD FOREIGN KEY ("director_id") REFERENCES "director" ("director_id");

ALTER TABLE "film_director" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");

ALTER TABLE "film_country" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE "film_country" ADD FOREIGN KEY ("imdb_id") REFERENCES "movie" ("imdb_id");
