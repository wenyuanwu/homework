CREATE TABLE plays (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  year TEXT NOT NULL,
  playwright_id INTEGER NOT NULL,

  FOREIGN KEY (playwright_id) REFERENCES playrights(id)
);

CREATE TABLE playrights (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  birth_year INTEGER
);


INSERT INTO
  playrights(name, birth_year)
VALUES
  ('Arthur Miller', 1915),
  ('Eugene O''Neill',1888);

INSERT INTO
  plays (title, year, playwright_id)
VALUES
  ('All my sons', 1947,(SELECT id FROM playrights WHERE name = 'Arthur Miller')),
  ('Long Day''s Journey Into Night', 1956, (SELECT id FROM playrights WHERE name = 'Eugene O''Neill'));
