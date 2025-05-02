-- public.account definition

-- Drop table

-- DROP TABLE public.account;

CREATE TABLE public.account (
	id serial4 			NOT NULL,
	account_id 			varchar NULL,
	person_id 			varchar NULL,
	tenant_id 			varchar NULL,
	user_last_update 	varchar NULL,
	created_at 			timestamptz NULL,
	updated_at 			timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT account_account_id_key UNIQUE (account_id),
	CONSTRAINT account_pkey PRIMARY KEY (id)
);