CREATE TABLE task (
    -- unique task id
    task_id BIGSERIAL NOT NULL,
    -- unique user id
    user_id BIGINT NOT NULL,
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
)