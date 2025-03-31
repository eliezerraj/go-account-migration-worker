-- public.terminal definition

-- Drop table

-- DROP TABLE public.terminal;

CREATE TABLE public.terminal (
	id serial4 NOT NULL,
	name varchar(200) NULL,
	coord_x float8 NULL,
	coord_y float8 NULL,
	status varchar(200) NULL,
	created_at timestamptz NULL,
	updated_at timestamptz NULL,
	CONSTRAINT terminal_pkey PRIMARY KEY (id)
);