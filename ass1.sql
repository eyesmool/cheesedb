-- Q1: oldest cheesemaker

create or replace view Q1(maker,founded)
AS
SELECT name AS maker, founded
FROM makers
WHERE founded = (SELECT min(founded)
								FROM makers)
;
-- Q2: cheese with same name as style

create or replace view Q2(cheese,maker)
AS
SELECT c.name AS cheese, m.name AS maker
FROM cheeses c
	JOIN styles s ON (c.style = s.id)
	JOIN makers m ON (c.made_by = m.id)
WHERE c.name = s.name
;
-- Q3: Crumbly cheeses

create or replace view Q3(cheese,maker)
AS
SELECT c.name AS cheese, m.name as maker
FROM cheeses c
	JOIN styles s ON (c.style = s.id)
	JOIN makers m ON (c.made_by = m.id)
WHERE s.notes ILIKE '%crumbly%'
;

-- Q4: How many of each hardness level

create or replace view Q4(hardness,ncheeses)
AS
SELECT s.hardness AS hardness, COUNT(c.name) AS ncheeses
FROM cheeses c
	JOIN styles s ON (c.style = s.id)
GROUP BY hardness
;

-- Q5: Most popular cheese style

create or replace view Q5(style)
as
-- your code here
WITH StylesNumCheeses AS
	(SELECT s.name as StyleName, COUNT(c.name) as ncheeses
	FROM cheeses c
		JOIN styles s ON (c.style = s.id)
	GROUP BY StyleName)
SELECT StyleName as style
FROM StylesNumCheeses
WHERE ncheeses = (SELECT max(ncheeses)
									FROM StylesNumCheeses)
;

-- Q6: Country that makes the most styles of cheese

create or replace view Q6(country)
as
-- your code here
WITH CountryStyles AS (
	SELECT DISTINCT p.country as country, c.style as style_id
	FROM cheeses c
		JOIN styles s on (c.style = s.id)
		JOIN makers m on (c.made_by = m.id)
		JOIN places p on (m.located_in = p.id)
	ORDER BY country
),
CountryNumStyles AS (
	SELECT country, COUNT(style_id) as NumStyles
	FROM CountryStyles
	GROUP BY country
)
SELECT country
FROM CountryNumStyles
WHERE NumStyles = (SELECT max(NumStyles) FROM CountryNumStyles)
;

-- Q7: Cheeses that are aged outside the "standard" aging period

create or replace view Q7(cheese,maker,aged,min_aging,max_aging)
as
-- your code here
WITH "CheeseAgeView" AS (
	SELECT c.name as cheese, m.name as maker, c.aged_for as aged, s.min_aging, s.max_aging
	FROM cheeses c
		JOIN makers m on (c.made_by = m.id)
		JOIN styles s on (c.style = s.id)
)
SELECT * from "CheeseAgeView"
WHERE aged < min_aging OR aged > max_aging
;

-- -- Q8: Return a list of cheesemakers matching a partial name, and their location

-- drop function if exists Q8;
-- drop type if exists MakerPlace;
-- create type MakerPlace as ( maker text, location text );

-- create or replace function Q8(partial_name text)
-- 	returns setof MakerPlace
-- as $$
-- -- your code here
-- $$ language plpgsql;

-- -- Q9: Lists of cheeses for cheesemakers matching a partial name

-- drop function if exists Q9;
-- drop type if exists OneCheese;
-- create type OneCheese as ( maker text, cheese text, style text );

-- create or replace function Q9(partial_name text)
-- 	returns setof OneCheese
-- as $$
-- -- your code here
-- $$ language plpgsql;
