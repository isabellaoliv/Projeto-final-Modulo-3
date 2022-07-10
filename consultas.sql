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

-- Todos os episódios com a nota acima da média
SELECT 
	Season  `Temporada`,
    Episode `Episódio`,
    Title   `Título`,
    Rating  `Nota`,
    Summary `Resumo`
FROM got_episodes_v4
    WHERE Rating > (
        SELECT AVG(Rating) 
        FROM got_episodes_v4
        )
ORDER BY Rating DESC;

-- Todos episódios com a nota abaixo da média

SELECT 
	Season  `Temporada`,
    Episode `Episódio`,
    Title   `Título`,
    Rating  `Nota`,
    Summary `Resumo`
FROM got_episodes_v4
    WHERE Rating < (
        SELECT AVG(Rating) 
        FROM got_episodes_v4
        )
ORDER BY Rating ASC;

-- Personagens principais da série e o número de aparições em cada episódio

SELECT 
	characters_v4.Character `Personagens`,
	COUNT(Star_1) `N.º de aparição como personagem principal em cada episódio`
FROM characters_v4
    INNER JOIN got_episodes_v4
        ON `Actor/ess` = Star_1
        GROUP BY Star_1
ORDER BY COUNT(Star_1) DESC;

-- Média da nota por temporada

SELECT 
	Season `Temporada`,
    ROUND(AVG(Rating), 1) `Média da nota`
FROM got_episodes_v4
    GROUP BY Season
ORDER BY ROUND(AVG(Rating), 1) DESC;

-- Duração total da série

SELECT 
    SEC_TO_TIME(SUM(Duration*60)) `Duração total da série`
FROM got_episodes_v4;

-- Quantos episódios cada diretor dirigiu?

SELECT Director `Diretor`, 
COUNT(director) AS `Quantidade de episódios`
FROM got_episodes_v4 GROUP BY director;

-- Quais foram os episódios mais bem votados na serie?

SELECT  Season `Temporada`, Episode `Episódio`,
(
SELECT MAX (got_episodes_v4.Rating) 
AS Votos FROM got_episodes_v4
)
FROM got_episodes_v4;

SELECT * FROM characters_v4 ORDER BY episodes_appeared DESC; # Atores/Personagens que mais apareceram por episódio

SELECT count(Episode) FROM got.got_episodes_v4; #Total de episódios

select season,episode,max(duration) from got_episodes_v4; # Episódio mais longo 

SELECT * FROM characters_v4 ORDER BY episodes_appeared asc; # Atores/Personagens que menos apareceram por episódio