CREATE TYPE user_role AS ENUM ('master', 'client');

CREATE TYPE user_status AS ENUM ('pending', 'accepted', 'blocked');

CREATE TABLE users (
    -- unique id of the user
    user_id BIGSERIAL NOT NULL,
    -- name, surname of the user
    username TEXT NOT NULL,,
    -- user's login
    login TEXT NOT NULL,
    -- user's password
    password_hash TEXT NOT NULL,
    -- user's role
    role user_role NOT NULL,
    -- user's after registration
    status user_status NOT NULL,
    -- creation timestamp
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    -- user's address
    address TEXT NOT NULL,
    -- payment credential for future use
    payments_credentials TEXT NOT NULL
    CONSTRAINT userID_pk PRIMARY KEY (user_id)
);

CREATE UNIQUE INDEX username_unique_idx ON users (login);
