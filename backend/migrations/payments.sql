CREATE TYPE payment_status AS ENUM (
    'pending', 
    'submitted', 
    'processed',
);

CREATE TABLE payment_statuses {
    -- unique transaction id
    payment_id BIGSERIAL NOT NULL,
    -- unique task id
    task_id BIGSERIAL NOT NULL,
    -- structured data describing the source of the funds
    from_metadata TEXT NOT NULL,
    -- structured data describing the destination of the funds
    to_metadata TEXT NOT NULL,
    -- amount of the funds
    payment REAL NOT NULL,
    -- transation status
    status payment_status NOT NULL,

    -- use task_id as the primary key for lookups
    CONSTRAINT payment_statuses_pk PRIMARY KEY (task_id)
};