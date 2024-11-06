-- public.account_statement definition

-- Drop table

-- DROP TABLE public.account_statement;

CREATE TABLE public.account_statement (
	id serial4 NOT NULL,
	fk_account_id int4 NULL,
	type_charge varchar(200) NULL,
	charged_at timestamptz NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT account_statement_pkey PRIMARY KEY (id)
);