INSERT INTO public.transaction_type
(transaction_id, description)
VALUES('DEPOSIT', 'DEPOSIT');

INSERT INTO public.transaction_type
(transaction_id, description)
VALUES('WITHDRAW', 'WITHDRAW');

INSERT INTO public.transaction_type
(transaction_id, description)
VALUES('WIRE_TRANSFER', 'WIRE_TRANSFER');

INSERT INTO public.transaction_type
(transaction_id, description)
VALUES('FINANCIAL_FEE', 'FINANCIAL_FEE');
----------
INSERT INTO public.account_type
(account_type_id, description)
VALUES('ASSET', 'ASSET');

INSERT INTO public.account_type
(account_type_id, description)
VALUES('LIABILITY', 'LIABILITY');

INSERT INTO public.account_type
(account_type_id, description)
VALUES('GAIN', 'GAIN');

INSERT INTO public.account_type
(account_type_id, description)
VALUES('LOSS', 'LOSS');
---------------------------
INSERT INTO public.ledger
(ledger_id, fk_account_type_id, description)
VALUES('ACC-BANK:ASSET', 'ASSET', 'ACCOUNT-BANK:ASSET');

INSERT INTO public.ledger
(ledger_id, fk_account_type_id, description)
VALUES('ACC-BANK:LIABILITY', 'LIABILITY', 'ACCOUNT-BANK:LIABILITY');

INSERT INTO public.ledger
(ledger_id, fk_account_type_id, description)
VALUES('INTER-BANK:ASSET', 'ASSET', 'INTER-BANK:ASSET');

INSERT INTO public.ledger
(ledger_id, fk_account_type_id, description)
VALUES('INTER-BANK:LIABILITY', 'LIABILITY', 'INTER-BANK:LIABILITY');

---------------------

INSERT INTO public."transaction"
(id, currency, description, transaction_at)
VALUES(nextval('transaction_id_seq'::regclass), 'BRL', 'DEPOSIT', now());

INSERT INTO public.transaction_detail
(fk_transaction_id, id, fk_ledger_id, fk_account_id, debit_amount, credit_amount)
VALUES(1, nextval('transaction_detail_id_seq'::regclass), 'ACC-BANK:LIABILITY', 'ACC-1', -10, 0);

INSERT INTO public.transaction_detail
(fk_transaction_id, id, fk_ledger_id, fk_account_id, debit_amount, credit_amount)
VALUES(1, nextval('transaction_detail_id_seq'::regclass), 'ACC-BANK:LIABILITY', 'ACC-1', 0, 10);