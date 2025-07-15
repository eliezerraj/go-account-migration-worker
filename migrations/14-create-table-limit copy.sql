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
	trace_id 		  varchar	NULL,
	tenant_id         varchar NULL,
	CONSTRAINT breach_limit_pkey PRIMARY KEY (id)
);

ALTER TABLE public.breach_limit 
ADD CONSTRAINT breach_limit_fk_id_trans_limit_fkey 
FOREIGN KEY (fk_id_trans_limit) REFERENCES public.transaction_limit(id);

-- DROP TABLE public.type_limit;

CREATE TABLE public.type_limit (
	code			varchar		NOT NULL,
    category	   	varchar		NOT NULL,
	created_at 		timestamptz NULL,
	CONSTRAINT   	type_limit_pkey PRIMARY KEY (code)
);

-- DROP TABLE public.counter_limit;
CREATE TABLE public.counter_limit (
	code  			varchar		NOT NULL,
    name		   	varchar		NOT NULL,
	created_at 		timestamptz NULL,
	CONSTRAINT   	counter_limit_pkey PRIMARY KEY (code)
);

-- DROP TABLE public.order_limit;
CREATE TABLE public.order_limit (
	fk_type_limit_code  	varchar		NOT NULL,
	fk_counter_limit_code	varchar  	NOT NULL,
    type		   			varchar		NULL,
    amount		   			int			NOT NULL,
	created_at 				timestamptz NULL,
	CONSTRAINT  order_limit_pkey PRIMARY KEY (fk_counter_limit_code, fk_type_limit_code)
);

ALTER TABLE public.order_limit 
ADD CONSTRAINT ordem_limit_fk_type_limit_code
FOREIGN KEY (fk_type_limit_code) REFERENCES public.type_limit(code);

ALTER TABLE public.order_limit 
ADD CONSTRAINT ordem_limit_fk_counter_limit_code
FOREIGN KEY (fk_counter_limit_code) REFERENCES public.counter_limit(code);

-- DROP TABLE public.limit_transaction;
CREATE TABLE public.limit_transaction (
	id             			serial4		NOT NULL,
	transaction_id 			varchar		NOT NULL,
	key			   			varchar		NOT NULL,
    fk_type_limit_code		varchar		NOT NULL,
	fk_counter_limit_code	varchar		NOT NULL,
	fk_order_limit_type		varchar		NOT NULL,
	status         			varchar		NOT NULL,
	amount         			decimal(12,2) NULL,
	created_at 				timestamptz NULL,
	CONSTRAINT     			limit_transaction_pkey PRIMARY KEY (id)
);

ALTER TABLE public.limit_transaction 
ADD CONSTRAINT limit_transaction_fk_type_limit_code
FOREIGN KEY (fk_type_limit_code) REFERENCES public.type_limit(code);