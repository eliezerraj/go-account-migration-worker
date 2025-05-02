-- Drop table

-- DROP TABLE public.transaction_limit;

CREATE TABLE public.transaction_limit (
	id             serial4		NOT NULL,
	transaction_id varchar		NULL,
    category	   varchar		NULL,
    card_number	   varchar		NULL,
    mcc            varchar		NULL,
	status         varchar		NULL,
	transaction_at timestamptz NULL,
    currency       varchar     NULL,
    amount         decimal(12,2) NULL,
	trace_id 		varchar	NULL,
	tenant_id      varchar     NULL,
	CONSTRAINT     transaction_limit_pkey PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE public.spend_limit;

CREATE TABLE public.spend_limit (
	id serial4  NOT NULL,
	category    varchar NULL,
    mcc         varchar  NULL,
    day         int NULL,
	hour        int NULL,
	minute      int NULL,
    amount      decimal(12,2) NULL,
	created_at timestamptz NULL,
	trace_id 	varchar	NULL,
	tenant_id   varchar NULL,
	CONSTRAINT  spending_limit_pkey PRIMARY KEY (id)
);

-- DROP TABLE public.breach_limit;

CREATE TABLE public.breach_limit (
	id                serial4  NOT NULL,
	fk_id_trans_limit int  NOT NULL,
	transaction_id 	  varchar  NULL,
    mcc               varchar  NULL,
	status            varchar NULL,
	amount			  decimal(12,2) NULL,	
	count			  int null,
	created_at        timestamptz NULL,
	trace_id 			varchar	NULL,
	tenant_id         varchar NULL,
	CONSTRAINT breach_limit_pkey PRIMARY KEY (id)
);

ALTER TABLE public.breach_limit 
ADD CONSTRAINT breach_limit_fk_id_trans_limit_fkey 
FOREIGN KEY (fk_id_trans_limit) REFERENCES public.transaction_limit(id);