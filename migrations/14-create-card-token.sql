-- public.card_token definition

-- Drop table

-- DROP TABLE public.card_token;

CREATE TABLE public.card_token (
	id serial4 NOT NULL,
	fk_id_card int4 NULL,
    token varchar NULL,
	status varchar(200) NULL,
	expired_at timestamptz NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT card_token_pkey PRIMARY KEY (id)
);

CREATE INDEX card_token_idx ON public.card_token USING btree (token);

-- public.card foreign keys

ALTER TABLE public.card_token ADD CONSTRAINT card_fk_card_id_fkey FOREIGN KEY (fk_id_card) REFERENCES public.card(id);