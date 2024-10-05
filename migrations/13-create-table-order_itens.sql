-- public.order_item definition
-- Drop table
-- DROP TABLE public.order_item;

CREATE TABLE public.order_item (
	id serial4 NOT NULL,
	fk_order_id int4 NULL,
	order_item_id int NULL,
	product varchar(200) NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) null,
	CONSTRAINT order_item_pkey PRIMARY KEY (id)
);

CREATE INDEX order_item_idx ON public.order_item USING btree (fk_order_id);

ALTER TABLE public.order_item ADD CONSTRAINT order_item_fk_order_id_fkey FOREIGN KEY (fk_order_id) REFERENCES public.order(id);
