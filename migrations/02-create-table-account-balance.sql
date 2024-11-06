-- public.account_balance definition

-- Drop table

-- DROP TABLE public.account_balance;

CREATE TABLE public.account_balance (
	id serial4 NOT NULL,
	fk_account_id int4 NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	user_last_update varchar(200) NULL,
	transaction_id uuid NULL,
	request_id varchar NULL,
	jwt_id varchar NULL,
	CONSTRAINT account_balance_pkey PRIMARY KEY (id)
);
