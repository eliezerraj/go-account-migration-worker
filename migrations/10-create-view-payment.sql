-- public.fraud_dataset_view definition
-- DROP VIEW public.fraud_dataset_view;

    CREATE VIEW fraud_dataset_view as
        select  ROW_NUMBER() OVER (ORDER BY p.payment_at) as id,
                p.fk_card_id,	
                p.card_number,
                p.terminal,
                t.coord_x,
                t.coord_y, 
                p.card_type,
                p.card_model,
                p.payment_at,
                p.mcc,
                p.amount,
                CASE WHEN p.payment_at::time <  '08:00' THEN 'night'
                    WHEN p.payment_at::time >= '20:00' THEN 'night'
                    ELSE 'day' END AS night_day,
                CASE WHEN p.payment_at::time <  '08:00' THEN '1'
                    WHEN p.payment_at::time >= '20:00' THEN '1'
                    ELSE '0' END AS ic_night_day,
                CASE WHEN extract(DOW from p.payment_at) in(0,6) then 'wkend' 
                    ELSE 'wkday' end as wkend_wkday,
                CASE WHEN extract(DOW from p.payment_at) in(0,6) then '1' 
                    ELSE '0' end as ic_wkend_wkday,
                EXTRACT('doy' FROM p.payment_at)
                AS  day_of_year,
                (select count(*) as tx_1d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date = p.payment_at::date
                    group by p1.card_number, p1.payment_at::date),
                (select to_char(avg(p1.amount),'FM999999999.00') as avg_1d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date = p.payment_at::date
                    group by p1.card_number, p1.payment_at::date),
                (select count(*) as tx_7d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date between (p.payment_at::date - interval '6 days') and p.payment_at::date
                    group by p1.card_number	),
                (select to_char(avg(p1.amount),'FM999999999.00') as avg_7d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date between (p.payment_at::date - interval '6 days') and p.payment_at::date
                    group by p1.card_number	),
                (select count(*) as tx_30d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date between (p.payment_at::date - interval '31 days') and p.payment_at::date
                    group by p1.card_number	),
                (select to_char(avg(p1.amount),'FM999999999.00') as avg_30d
                    from payment p1
                    where p1.card_number = p.card_number
                    and p1.payment_at::date between (p.payment_at::date - interval '31 days') 
                    and p.payment_at::date
                    group by p1.card_number	),
                to_char(coalesce ( extract(epoch from p.payment_at - (lag(p.payment_at) over (ORDER BY p.payment_at desc))),0) *-1,'FM999999999') as time_btw_tx,
                to_char(coalesce ( (select extract(epoch from p.payment_at - p1.payment_at )
                    from payment p1 
                    where p1.card_number = p.card_number
                    and p1.payment_at < p.payment_at
                    and p1.payment_at::date = p.payment_at::date
                    order by p1.payment_at desc
                    limit 1),0),'FM999999999') as time_btw_cc_tx,
                    to_char(p.fraud,'FM999999999') as fraud
        from payment p,
            terminal t
        where p.fk_terminal_id = t.id
        and p.fk_card_id < 1000
        order by p.payment_at asc;