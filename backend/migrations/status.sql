CREATE TABLE status {
    task_id BIGINT NOT NULL,
    status SMALLINT NOT NULL, 
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
};

CREATE UNIQUE INDEX status_task_id_unique_idx ON master (task_id);
