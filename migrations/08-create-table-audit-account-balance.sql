-- public.audit_account_balance definition

-- Drop table

-- DROP TABLE public.audit_account_balance;

CREATE TABLE public.audit_account_balance (
	id serial4 NOT NULL,
	request_id varchar NULL,
	jwt_id varchar NULL,
	user_session varchar NOT NULL,
	create_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	account_balance_id int4 NOT NULL,
	currency varchar NULL,
	old_amount float8 NOT NULL,
	new_amount float8 NOT NULL
);