-- public.account definition

-- Drop table

-- DROP TABLE public.person;

CREATE TABLE public.person (
	id serial4 NOT NULL,
	person_id varchar(200) NOT NULL,
	name varchar(200) NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	tenant_id varchar(200) null,
	CONSTRAINT person_id_key UNIQUE (person_id),
	CONSTRAINT person_pkey PRIMARY KEY (id)
);

CREATE INDEX person_idx ON public.person USING btree (person_id);