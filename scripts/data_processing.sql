/* 

Hotfix: backfill sales.totalprice that was left NULL or 0.

This script recomputes and fills totalprice as products.price * sales.quantity (rounded to 2 decimals),
updating only rows with NULL/0 totalprice and wrapping the change to the database.

*/

BEGIN;

UPDATE sales s
SET totalprice = ROUND(p.price * s.quantity, 2)
FROM products p
WHERE p.productid = s.productid
  AND (s.totalprice IS NULL OR s.totalprice = 0);

COMMIT;
