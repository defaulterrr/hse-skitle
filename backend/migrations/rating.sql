CREATE TABLE reviews (
    -- task id
    task_id BIGINT NOT NULL,
    -- type of the review, mainly for direction 
    -- of the feedback
    type SMALLINT NOT NULL,
    -- id of the master assigned to the task
    master_id BIGINT NOT NULL,
    -- id of the client who requested the task
    client_id BIGINT NOT NULL,
    -- normalized_score, all scores are topped at 1
    normalized_score REAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE UNIQUE INDEX reviews_task_id_type_unique_idx ON reviews (task_id, type);
