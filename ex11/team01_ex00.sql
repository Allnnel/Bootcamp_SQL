WITH bal AS  (SELECT balance.user_id, balance.type, SUM(balance.money) AS volume, balance.currency_id
              FROM balance 
              GROUP BY balance.user_id, balance.type, balance.currency_id),
    
      cur AS (SELECT currency.id, currency.name, currency.rate_to_usd
              FROM currency 
              JOIN (SELECT id, MAX(updated) AS updated FROM currency
              GROUP BY id) AS temp
              ON currency.updated = temp.updated AND currency.id = temp.id),
    
     total AS (SELECT COALESCE("user".name, 'not defined')  AS name,
              COALESCE("user".lastname, 'not defined')  AS lastname,
              bal.type, bal.volume,
              COALESCE(cur.name, 'not defined') AS currency_name,
              COALESCE(cur.rate_to_usd, 1) AS last_rate_to_usd,
              CAST(ROUND(bal.volume * COALESCE(cur.rate_to_usd, 1), 6) AS real) AS total_volume_in_usd
              FROM bal
              LEFT JOIN "user"  ON "user".id = bal.user_id
              LEFT JOIN cur ON bal.currency_id = cur.id
              ORDER BY name DESC, lastname, type)
SELECT *
FROM total;

