-- public."order" definition

-- Drop table

-- DROP TABLE public."order";

CREATE TABLE public."order" (
	id serial4 NOT NULL,
	order_id varchar(200) NULL,
	person_id varchar(200) NULL,
	status varchar(200) NULL,
	currency varchar(10) NULL,
	amount float8 NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT order_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX order_idx ON public."order" USING btree (order_id);
CREATE INDEX order_person_idx ON public."order" USING btree (person_id);