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

    -- use task_id as the primary key for lookups
    CONSTRAINT payment_statuses_pk PRIMARY KEY (task_id)
};
