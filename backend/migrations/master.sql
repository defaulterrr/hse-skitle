CREATE TABLE master {
    master_id BIGINT NOT NULL,
    task_id BIGINT NOT NULL,
    status SMALLINT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
};

CREATE INDEX master_id_idx ON master (master_id);
CREATE INDEX master_task_id_idx ON master (task_id);
