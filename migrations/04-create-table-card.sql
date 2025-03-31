-- public.card definition

-- Drop table

-- DROP TABLE public.card;

CREATE TABLE public.card (
	id serial4 NOT NULL,
	fk_account_id int4 NULL,
	card_number varchar(200) NULL,
	card_type varchar(200) NULL,
	card_model varchar(200) NULL,
	card_pin varchar(200) NULL,
	status varchar(200) NULL,
	expired_at timestamptz NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT card_pkey PRIMARY KEY (id)
);
CREATE INDEX card_idx ON public.card USING btree (card_number);

-- public.card foreign keys

ALTER TABLE public.card ADD CONSTRAINT card_fk_account_id_fkey FOREIGN KEY (fk_account_id) REFERENCES public.account(id);