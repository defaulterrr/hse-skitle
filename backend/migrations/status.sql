CREATE TABLE status {
    task_id BIGINT NOT NULL,
    status SMALLINT NOT NULL, 
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT status_pk PRIMARY KEY (task_id)
};
