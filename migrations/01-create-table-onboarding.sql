-- public.account definition

-- Drop table

-- DROP TABLE public.person;

CREATE TABLE public.person (
	id 			serial4 NOT NULL,
	person_id	varchar NOT NULL,
	name 		varchar NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	trace_id 	varchar	NULL,
	tenant_id 	varchar	NULL,
	CONSTRAINT person_id_key UNIQUE (person_id),
	CONSTRAINT person_pkey PRIMARY KEY (id)
);

CREATE INDEX person_idx ON public.person USING btree (person_id);