-- Quantidade de casas por região 

SELECT houses_v1.region, 
COUNT(region) AS `Quantidade de casas por regiao`
FROM houses_v1 GROUP BY region;

-- Quais são os nomes dos episódios dirigidos por Michael Slovis?
SELECT 
got_episodes_v4.Title,
got_episodes_v4.Director
FROM got_episodes_v4
WHERE Director IN ('Michael Slovis');