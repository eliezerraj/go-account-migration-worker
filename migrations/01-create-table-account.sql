-- public.account definition
-- Drop table
-- DROP TABLE public.account;

CREATE TABLE public.account (
	id serial4 NOT NULL,
	account_id varchar(200) NULL,
	person_id varchar(200) NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	user_last_update varchar(200) NULL,
	CONSTRAINT account_account_id_key UNIQUE (account_id),
	CONSTRAINT account_pkey PRIMARY KEY (id)
);