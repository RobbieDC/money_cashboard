DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budget;

CREATE TABLE merchants (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id serial4 primary key,
  type VARCHAR(255)
);

CREATE TABLE budget (
  id serial4 primary key,
  weekly_budget int4,
  week_number int4
);

CREATE TABLE transactions (
  id serial4 primary key,
  value int4,
  date_conducted date,
  merchant_id int4 references merchants(id) ON DELETE CASCADE,
  tag_id int4 references tags(id) ON DELETE CASCADE
);