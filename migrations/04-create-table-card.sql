-- public.card definition

-- Drop table

-- DROP TABLE public.card;

CREATE TABLE public.card (
	id 				serial4 NOT NULL,
	fk_account_id 	int4 NULL,
	card_number 	varchar NULL,
	holder 			varchar NULL,
	card_type 		varchar	NULL,
	card_model 		varchar NULL,
	atc 			int NULL,
	status 			varchar NULL,
	expired_at 		timestamptz NULL,
	created_at 		timestamptz NULL,
	updated_at 		timestamptz NULL,
	trace_id 		varchar	NULL,
	tenant_id 		varchar NULL,
	CONSTRAINT card_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX card_idx ON public.card USING btree (card_number);

-- public.card foreign keys

ALTER TABLE public.card ADD CONSTRAINT card_fk_account_id_fkey FOREIGN KEY (fk_account_id) REFERENCES public.account(id);