CREATE TABLE payment_statuses {
    -- task id
    task_id BIGINT NOT NULL,
    -- amount of the funds
    payment REAL NOT NULL,
    -- structured data describing the source of the funds
    from_metadata TEXT NOT NULL,
    -- structured data describing the destination of the funds
    to_metadata TEXT NOT NULL,
    -- transation status
    status SMALLINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
};

CREATE UNIQUE INDEX payment_statuses_task_id_unique_idx ON payment_statuses (task_id);
