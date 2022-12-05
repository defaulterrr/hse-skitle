CREATE TYPE task_status AS ENUM (
    'created', 
    'review', 
    'published',
    'rejected',
    'accepted',
    'client_approved',
    'master_approved',
    'closed'
);

CREATE TABLE task (
    -- unique task id
    task_id BIGSERIAL NOT NULL,
    -- unique task info id
    info_id BIGSERIAL NOT NULL,
    -- unique task info id
    user_id BIGSERIAL NOT NULL,
    -- transation status
    status task_status NOT NULL,
);

CREATE TABLE task_info {
    -- unique task info id
    task_info_id BIGSERIAL NOT NULL
    -- unique task id
    task_id BIGSERIAL NOT NULL,
    -- tag with one-word description of the task
    tag TEXT NOT NULL,
    -- description of the problem
    description TEXT NOT NULL,
    -- reward for completing the task
    price REAL NOT NULL,
    -- URL of the uploading photo
    photo TEXT NULL,
    -- user's address
    address TEXT NOT NULL

    -- use task_id as the primary key for lookups
    CONSTRAINT task_info_pk PRIMARY KEY (task_id)
};