
-- public.event_moviment definition

-- Drop table

-- DROP TABLE public.event_moviment;

CREATE TABLE public.event_moviment (
	id 					serial4 NOT NULL,
	fk_account_id_from 	int NULL,
	account_id_from 	varchar NULL,
	fk_account_id_to 	int NULL,
	account_id_to 		varchar NULL,
	type_transaction 	varchar NULL,
	transaction_id 		varchar NULL,
	transaction_at 		timestamptz NULL,
	currency 			varchar NULL,
	amount 				float8 NULL,
	status 				varchar NULL,
	created_at 			timestamptz NULL,
	updated_at 			timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT event_moviment_pkey PRIMARY KEY (id)
);

-- public.account_statement_fee foreign keys
ALTER TABLE public.event_moviment ADD CONSTRAINT evt_mov_fk_account_id_from FOREIGN KEY (fk_account_id_from) REFERENCES public.account(id);

-- public.account_statement_fee foreign keys
ALTER TABLE public.event_moviment ADD CONSTRAINT evt_mov_fk_account_id_to FOREIGN KEY (fk_account_id_to) REFERENCES public.account(id);