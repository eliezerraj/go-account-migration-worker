-- public.transfer_moviment definition

-- Drop table

-- DROP TABLE public.transfer_moviment;

CREATE TABLE public.transfer_moviment (
	id serial4 NOT NULL,
	fk_account_id_from int4 NULL,
	fk_account_id_to int4 NULL,
	type_charge varchar(200) NULL,
	transfer_at timestamptz NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	status varchar(200) NULL,
	transaction_id varchar NULL,
	CONSTRAINT transfer_moviment_pkey PRIMARY KEY (id)
);

-- public.account_statement_fee foreign keys
ALTER TABLE public.transfer_moviment ADD CONSTRAINT trans_mov_fk_account_id_from FOREIGN KEY (fk_account_id_from) REFERENCES public.account(id);

-- public.account_statement_fee foreign keys
ALTER TABLE public.transfer_moviment ADD CONSTRAINT trans_mov_fk_account_id_to FOREIGN KEY (fk_account_id_to) REFERENCES public.account(id);