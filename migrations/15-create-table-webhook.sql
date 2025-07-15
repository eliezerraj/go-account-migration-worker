-- Drop table

-- DROP TABLE public.webhook_transaction;

CREATE TABLE public.webhook_transaction (
	id        	serial4		NOT NULL,
	receiver	varchar		NULL,
	host      	varchar		NULL,
	url      	varchar		NULL,
	method      varchar		NULL,
	payload     jsonb 		NULL,
	status      varchar		NULL,
	created_at	timestamptz NULL,
	updated_at	timestamptz NULL,
	CONSTRAINT	pk_webhook_transaction PRIMARY KEY (id)
);


-- DROP TABLE public.webhook_config;

CREATE TABLE public.webhook_config (
	id        	serial4		NOT NULL,
	receiver	varchar		NULL,
	type		varchar		NULL,
	host      	varchar		NULL,
	url      	varchar		NULL,
	method      varchar		NULL,
	created_at	timestamptz NULL,
	updated_at	timestamptz NULL,
	CONSTRAINT	pk_webhook_config PRIMARY KEY (id)
);
