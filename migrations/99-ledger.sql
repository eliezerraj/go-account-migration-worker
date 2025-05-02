CREATE TABLE public.account (
	id                  serial4  NOT NULL,
	account_id          varchar NULL,
	person_id           varchar NULL,
	tenant_id           varchar NULL,
	user_last_update    varchar NULL,
	created_at          timestamptz NULL,
	updated_at          timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT acc_account_id_unkey UNIQUE (account_id)
);

ALTER TABLE public.account 
ADD CONSTRAINT acc_fk_acc_typ_id_fkey 
FOREIGN KEY (fk_account_type_id) REFERENCES public.account_type(id);

----------------------------

DROP TABLE public.account_type;

CREATE TABLE public.account_type (
	account_type_id varchar NOT NULL,
	description     varchar NOT NULL,
	created_at      timestamptz NULL,
	trace_id 		varchar	NULL,
	CONSTRAINT acc_type_id_pkey PRIMARY KEY (account_type_id)
);

---------------------------

DROP TABLE public.ledger;

CREATE TABLE public.ledger (
	ledger_id           varchar NOT NULL,
	fk_account_type_id  varchar NOT NULL,    
	description         varchar NOT NULL,
	created_at          timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT led_id_pkey PRIMARY KEY (ledger_id)
);

ALTER TABLE public.ledger 
ADD CONSTRAINT led_fk_led_typ_id_fkey 
FOREIGN KEY (fk_account_type_id) REFERENCES public.account_type(account_type_id);

--------------------------

DROP TABLE public.transaction_type;

CREATE TABLE public.transaction_type (
	transaction_id  varchar NOT NULL,
	description     varchar NOT NULL,
	created_at      timestamptz NULL,
	trace_id 		varchar	NULL,
	CONSTRAINT tx_type_pkey PRIMARY KEY (transaction_id)
);

---------------------------

DROP TABLE public.transaction;

CREATE TABLE public.transaction (
	id              serial4 NOT NULL,
	currency        varchar NOT NULL,
	description     varchar NOT NULL,
	transaction_at  timestamptz NULL,
	trace_id 		varchar	NULL,
	CONSTRAINT tx_pkey PRIMARY KEY (id)
);

---------------------------

DROP TABLE public.transaction_detail;

CREATE TABLE public.transaction_detail (
	fk_transaction_id   int     NOT NULL,
	id                  serial4 NOT NULL,
	fk_ledger_id 		varchar NOT NULL,
	fk_account_id       varchar NOT NULL,
	debit_amount        int     NOT NULL,
	credit_amount       int     NOT NULL,
	created_at          timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT tx_detail_pkey PRIMARY KEY (id, fk_transaction_id)
);

ALTER TABLE public.transaction_detail 
ADD CONSTRAINT acc_fk_acc_typ_id_fkey 
FOREIGN KEY (fk_account_id) REFERENCES public.account(account_id);

ALTER TABLE public.transaction_detail 
ADD CONSTRAINT acc_fk_tx_id_fkey 
FOREIGN KEY (fk_transaction_id) REFERENCES public.transaction(id);

---------------------------

DROP TABLE public.pix_transaction;

CREATE TABLE public.pix_transaction (
	id 					serial4 NOT NULL,
	fk_account_id_from 	int NULL,
	account_id_from 	varchar NULL,
	fk_account_id_to 	int NULL,
	account_id_to 		varchar NULL,
	transaction_id 		varchar NULL,
	transaction_at 		timestamptz NULL,
	currency 			varchar NULL,
	amount 				float8 NULL,
	status 				varchar NULL,
	request_id			varchar NULL,
	created_at 			timestamptz NULL,
	updated_at 			timestamptz NULL,
	trace_id 			varchar	NULL,
	CONSTRAINT pix_trx_pkey PRIMARY KEY (id)
);
