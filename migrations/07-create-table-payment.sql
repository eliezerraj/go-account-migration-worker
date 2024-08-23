-- public.payment definition
-- Drop table
-- DROP TABLE public.payment;

CREATE TABLE public.payment (
	id serial4 NOT NULL,
	fk_card_id int4 NULL,
	card_number varchar(200) NULL,
	fk_terminal_id int4 NULL,
	terminal_name varchar(200) NULL,
	card_type varchar(200) NULL,
	card_model varchar(200) NULL,
	payment_at timestamptz NULL,
	mcc varchar(10) NULL,
	status varchar(200) NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	fraud float8 NULL,
	CONSTRAINT payment_pkey PRIMARY KEY (id)
);
CREATE INDEX payment_idx ON public.payment USING btree (card_number);

-- public.payment foreign keys
ALTER TABLE public.payment ADD CONSTRAINT payment_fk_card_id_fkey FOREIGN KEY (fk_card_id) REFERENCES public.card(id);
ALTER TABLE public.payment ADD CONSTRAINT payment_fk_terminal_id_fkey FOREIGN KEY (fk_terminal_id) REFERENCES public.terminal(id);