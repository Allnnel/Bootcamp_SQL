SELECT address,  
ROUND((MAX(age)-(CAST(MIN(age) AS FLOAT) / MAX(age)))::numeric, 2) AS formula,
ROUND(AVG(age)::numeric, 2) AS average,
CASE WHEN AVG(age) < (MAX(age)-(CAST(MIN(age) AS FLOAT) /MAX(age))) THEN 'true'
ELSE 'false'
END AS comparison FROM person
GROUP BY address
ORDER BY address;
