#table prices with day integer not null, price integer not null
avg bitcoin priceper day per period of time
daysin range
find anomalies during period of time. find days when price spiked (price larger than on the day before and day after). the first day and last day can not be spikes. 
return sql query with days of bitcoin price spiles. order by day increasing. 
SELECT day
FROM prices
WHERE 
SELECT day
FROM prices
WHERE price > (
    SELECT price
    FROM prices AS p1
    WHERE p1.day = prices.day - 1
) AND price > (
    SELECT price
    FROM prices AS p2
    WHERE p2.day = prices.day + 1
) AND day > (
    SELECT MIN(day)
    FROM prices
) AND day < (
    SELECT MAX(day)
    FROM prices
)
ORDER BY day ASC;