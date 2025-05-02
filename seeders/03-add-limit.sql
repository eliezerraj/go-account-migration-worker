INSERT INTO public.spend_limit
(id, category, mcc , "day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'CREDIT', 'FOOD' ,10, 100, 10, 1000, NOW(), 'TENANT-1');
INSERT INTO public.spend_limit
(id, category, mcc ,"day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'DEBIT', 'FOOD',10, 100, 10, 1000, NOW(), 'TENANT-1');
INSERT INTO public.spend_limit
(id, category, mcc ,"day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'CREDIT:TOKEN', 'FOOD',10, 100, 10, 1000, NOW(), 'TENANT-1');