
DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games(
  id SERIAL4 PRIMARY KEY,
  platform VARCHAR(255),
  title VARCHAR(255),
  genre VARCHAR(255),
  available BOOLEAN NOT NULL

);

CREATE TABLE rentals(
  id SERIAL PRIMARY KEY,
  game_id INT REFERENCES games(id) ON DELETE CASCADE,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);
