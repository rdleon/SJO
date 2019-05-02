CREATE EXTENSION pgcrypto; -- gen_random_uuid function

CREATE TABLE users (
    uuid VARCHAR(60) PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(250) NOT NULL,
    password VARCHAR(60),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp
);
