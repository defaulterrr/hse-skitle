CREATE review_type AS ENUM (
    'client_side',
    'master_side'
)

CREATE TABLE reviews (
    -- unique id of the review
    review_id BIGSERIAL NOT NULL,
    -- unique task id
    task_id BIGSERIAL NOT NULL,
    -- type of the review, mainly for direction 
    -- of the feedback
    type review_type NOT NULL,
    -- id of the master assigned to the task
    master_id BIGSERIAL NOT NULL,
    -- id of the client who requested the task
    client_id BIGSERIAL NOT NULL,
    -- normalized_score, all scores are topped at 1
    normalized_score REAL NOT NULL,
)