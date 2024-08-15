-- liquibase formatted sql

-- changeset architecture:01

CREATE TABLE public.card (
	id serial4 NOT NULL,
	fk_account_id int4 NULL,
	card_number varchar(200) NULL,
	card_type varchar(200) NULL,
	card_pin varchar(200) NULL,
	status varchar(200) NULL,
	expire_at timestamptz NULL,
	create_at timestamptz NULL,
	update_at timestamptz NULL,
	tenant_id varchar(200) NULL,
	CONSTRAINT card_pkey PRIMARY KEY (id)
);

-- rollback DROP TABLE public.card CASCADE;