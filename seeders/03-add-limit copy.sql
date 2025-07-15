INSERT INTO public.spend_limit
(id, category, mcc , "day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'CREDIT', 'FOOD' ,10, 100, 10, 1000, NOW(), 'TENANT-1');
INSERT INTO public.spend_limit
(id, category, mcc ,"day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'DEBIT', 'FOOD',10, 100, 10, 1000, NOW(), 'TENANT-1');
INSERT INTO public.spend_limit
(id, category, mcc ,"day", "hour", "minute", amount, created_at, tenant_id)
VALUES(nextval('spend_limit_id_seq'::regclass), 'CREDIT:TOKEN', 'FOOD',10, 100, 10, 1000, NOW(), 'TENANT-1');


INSERT INTO public.type_limit
(code, category, created_at)
VALUES('CREDIT', 'CREDIT', NOW());

INSERT INTO public.type_limit
(code, category, created_at)
VALUES('DEBIT', 'DEBIT', NOW());

INSERT INTO public.type_limit
(code, category, created_at)
VALUES('TRANSFER', 'TRANSFER', NOW());

INSERT INTO public.counter_limit
(code, name, created_at)
VALUES('HOUR', 'HOUR', NOW());

INSERT INTO public.counter_limit
(code, name, created_at)
VALUES('MINUTE', 'MINUTE', NOW());

INSERT INTO public.counter_limit
(code, name, created_at)
VALUES('QUANTITY', 'QUANTITY', NOW());

INSERT INTO public.counter_limit
(code, name, created_at)
VALUES('VALUE', 'VALUE', NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('CREDIT', 'VALUE', 'MCC:FOOD' , 100 , NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('CREDIT', 'QUANTITY', 'MCC:FOOD' , 4 , NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('CREDIT', 'MINUTE', 'MCC:FOOD' , 1 , NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('TRANSFER', 'VALUE', 'WIRE' , 500 , NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('TRANSFER', 'QUANTITY', 'WIRE' , 4 , NOW());

INSERT INTO public.order_limit
(fk_type_limit_code, fk_counter_limit_code, type, amount,created_at)
VALUES('TRANSFER', 'MINUTE', 'WIRE' , 1 , NOW());