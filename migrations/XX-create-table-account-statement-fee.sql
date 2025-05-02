-- public.account_statement_fee definition
-- Drop table
-- DROP TABLE public.account_statement_fee;

CREATE TABLE public.account_statement_fee (
	id serial4 NOT NULL,
	fk_account_statement_id int4 NULL,
	charged_at timestamptz NULL,
	type_fee varchar(200) NULL,
	value_fee float8 NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT account_statement_fee_pkey PRIMARY KEY (id)
);

-- public.account_statement_fee foreign keys
ALTER TABLE public.account_statement_fee ADD CONSTRAINT account_statement_fee_fk_account_statement_id_fkey FOREIGN KEY (fk_account_statement_id) REFERENCES public.account_statement(id);