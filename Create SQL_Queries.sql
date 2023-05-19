-- SECTION A PROFIT ANALYSIS

-- Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?

SELECT SUM(profit) AS total_profit
FROM international breweries
WHERE years BETWEEN 2017 AND 2019
LIMIT 1;

-- Compare the total profit between these two territories in order for the territory manager,Mr. Stone to make a strategic decision that will aid profit maximization in 2020.
SELECT CASE
WHEN countries IN ('Nigeria', 'Ghana') THEN 'Anglophone
ELSE 'Francophone' END AS territory, SUM(profit) AS territory_profit 
FROM International breweries
GROUP BY territory
ORDER BY territory_profit DESC;

-- What country generated the highest profit in 2019
SELECT countries AS highest_profit_country, SUM(profit) AS total_profit
FROM International breweries
WHERE years 2019
GROUP BY countries
ORDER BY total_profit DESC
LIMIT 1;

-- Help him find the year with the highest profit.
SELECT years AS highest_profit_year, SUM(profit) AS total_profit
FROM international breweries
GROUP BY years
ORDER BY total_profit DESC
LIMIT 1;

-- Which month in the three years was the least profit generated?
SELECT months, years, SUM(profit) AS
least _profit_generated FROM international breweries
GROUP BY months, years
ORDER BY least_profit_generated
LIMIT 1;

-- What was the minimum profit in the month of December 2018?
SELECT months, MIN(profit) AS min_profit
FROM international breweries
WHERE months 'December' AND years = 2018
GROUP BY months
ORDER BY min_profit DESC;

-- Compare the profit for each of the months in 2019
SELECT months, SUM(profit) AS total_profit
FROM international breweries
WHERE years 2019
GROUP BY months
ORDER BY CASE
WHEN months January' THEN 1
WHEN months 'February' THEN 2
WHEN months 'March' THEN 3
WHEN months 'April' THEN 4
WHEN months 'May'  THEN 5
WHEN months 'June' THEN 6
WHEN months 'July'  THEN 7
WHEN months 'August'  THEN 8
WHEN months 'September'  THEN 9
WHEN months 'October ' THEN 10
WHEN months 'November' THEN 11
WHEN months 'December '  THEN 12 ;

-- Which particular brand generated the highest profit in Senegal?
SELECT brands, SUM(profit) AS total_profit
FROM international breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY total_profit DESC
LIMIT 1;

-- SECTION B BRAND ANALYSIS

-- Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
SELECT brands AS francophone_top_three, SUM(quantity) AS total_quantity
FROM international breweries
WHERE countries IN ('Senegal', 'Benin', 'Togo') AND years 2017
GROUP BY brands
ORDER BY total, quantity DESC
LIMIT 3;

-- Find out the top two choice of consumer brands in Ghana
SELECT brands AS Ghana_top_two, SUM(quantity) AS total_quantity
FROM International breweries
WHERE countries 'Ghana'
GROUP BY brands
ORDER BY total_quantity DESC
LIMIT 2;

-- Find out the details of beers consumed in the past three years in the most oil reached country in West Africa.
SELECT years, brands AS beer, region, SUM(quantity) AS amt_cousumed SUM(profit) AS total_profit 
FROM international_breweries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt'
GROUP BY years,brands, region
ORDER BY years, amt_cousumed;

-- Favorites malt brand in Anglophone region between 2018 and 2019
SELECT brands AS fav_malt_brand, SUM(quantity) AS total_consumed 
FROM international_breweries
WHERE countries IN ('Nigeria', 'Ghana') AND years BETWEEN 2018 AND 2019 AND brands LIKE '%malt'
GROUP BY brands
ORDER BY total_consumed DESC;

-- Which brands sold the highest in 2019 in Nigeria?
SELECT brands AS highest_brand, SUM(quantity) AS total_consumed
FROM international_breweries
WHERE countries = Nigeria AND years = 2019
GROUP BY brands
ORDER BY total_consumed DESC
LIMIT 1;

-- Favorites brand in South_South region in Nigeria
SELECT brands AS fav_brand, SUM (quantity) AS total_consumed
FROM international_breweries 
WHERE countries = 'Nigeria' AND region = 'southsouth'
GROUP BY brands
ORDER BY total_cousumed DESC
LIMIT 1;

-- Bear consumption in Nigeria
SELECT brands AS beer, SUM(quantity) AS quantity_consumed
FROM international_breweries
WHERE countries = 'Nigeria' AND brands NOT LIKE '%malt'
GROUP BY brands
ORDER BY quantity_consumed DESC;

-- Level of consumption of Budweiser in the regions in Nigeria
SELECT region, SUM (quantity) AS quatity_consumed
FROM international_breweries
WHERE countries = 'Nigeria' AND brands LIKE 'budweiser'
GROUP BY brands, region
ORDER BY quatity_consumed DESC;

-- Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on promo)
SELECT region, SUM (quantity) AS quatity_consumed
FROM international_breweries
WHERE countries = 'Nigeria' AND brands LIKE 'budweiser' AND year = 2019
GROUP BY brands, region
ORDER BY quatity_consumed DESC;

-- SECTION C COUNTRIES ANALYSIS

-- Country with the highest consumption of beer.
SELECT countries AS country, SUM (quantity) AS quantity_consumed 
FROM international_breweries
WHERE brands NOT LIKE '%malt'
GROUP BY countries
ORDER BY quantity_consumed DESC
LIMIT 1;

-- Highest sales personnel of Budweiser in Senegal
SELECT sales_rep AS highest_sales_rep, SUM (quantity) AS quantity_consumed
FROM international_breweries
WHERE countries = 'Senegal' AND brands LIKE 'budweiser' 
GROUP BY sales_rep
ORDER BY quantity_consumed DESC
LIMIT 1;

-- Country with the highest profit of the fourth quarter in 2019
SELECT countries AS country, SUM(profit) AS Highest_profit
FROM international_breweries
WHERE months IN ('September','October','November','December') AND years = 2019 
GROUP BY countries
ORDER BY Highest_profit DESC
LIMIT 1;
