-- public.payment definition
-- Drop table
-- DROP TABLE public.payment;

CREATE TABLE public.payment (
	id serial4 		NOT NULL,
	fk_card_id 		int4 NULL,
	card_number 	varchar NULL,
	fk_terminal_id 	int4 NULL,
	terminal	 	varchar NULL,
	card_type 		varchar NULL,
	card_model 		varchar NULL,
	payment_at 		timestamptz NULL,
	mcc 			varchar NULL,
	status 			varchar NULL,
	currency 		varchar NULL,
	amount float8 	NULL,
	request_id 		varchar null,
	transaction_id 	varchar null,
	fraud 			float8 NULL,
	created_at 		timestamptz NULL,
	updated_at 		timestamptz NULL,
	trace_id 		varchar	NULL,
	tenant_id 		varchar NULL,
	CONSTRAINT payment_pkey PRIMARY KEY (id)
);
CREATE INDEX payment_idx ON public.payment USING btree (card_number);

-- public.payment foreign keys
ALTER TABLE public.payment ADD CONSTRAINT payment_fk_card_id_fkey FOREIGN KEY (fk_card_id) REFERENCES public.card(id);
ALTER TABLE public.payment ADD CONSTRAINT payment_fk_terminal_id_fkey FOREIGN KEY (fk_terminal_id) REFERENCES public.terminal(id);