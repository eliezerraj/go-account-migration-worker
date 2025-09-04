INSERT INTO public.webhook_config
(id, receiver, "type", host, url, "method", created_at, updated_at)
VALUES(nextval('webhook_config_id_seq'::regclass), 'ACCOUNT:ACC-1', 'TOPIC:PIX', 'https://teste2.com', '/teste', 'POST', NOW(), NULL);

INSERT INTO public.webhook_config
(id, receiver, "type", host, url, "method", created_at, updated_at)
VALUES(nextval('webhook_config_id_seq'::regclass), 'ACCOUNT:ACC-2', 'TOPIC:PIX', 'https://teste2.com', '/teste', 'GET', NOW(), NULL);

INSERT INTO public.webhook_config
(id, receiver, "type", host, url, "method", created_at, updated_at)
VALUES(nextval('webhook_config_id_seq'::regclass), 'ACCOUNT:ACC-3', 'TOPIC:PIX', 'https://teste2.com', '/teste', 'GET', NOW(), NULL);

INSERT INTO public.webhook_config
(id, receiver, "type", host, url, "method", created_at, updated_at)
VALUES(nextval('webhook_config_id_seq'::regclass), 'ACCOUNT:ACC-4', 'TOPIC:PIX', 'https://teste2.com', '/teste', 'GET', NOW(), NULL);