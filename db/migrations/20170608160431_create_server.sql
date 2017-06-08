-- +micrate Up
CREATE TABLE servers (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  ip VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS servers;
