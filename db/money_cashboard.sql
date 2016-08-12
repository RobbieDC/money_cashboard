DROP TABLE transactions;
DROP TABLE merchants;

CREATE TABLE merchants (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id serial4 primary key,
  value int4,
  tag VARCHAR(255),
  merchant_id int4 references merchants(id)
);