CREATE TABLE reviews (
    -- task id
    task_id BIGSERIAL NOT NULL,
    -- type of the review, mainly for direction 
    -- of the feedback
    type SMALLINT NOT NULL,
    -- id of the master assigned to the task
    master_id BIGSERIAL NOT NULL,
    -- id of the client who requested the task
    client_id BIGSERIAL NOT NULL,
    -- normalized_score, all scores are topped at 1
    normalized_score REAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX reviews_task_id_type ON reviews (task_id, type);
