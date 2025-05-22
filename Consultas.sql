
-- 1 - Nome e ano dos filmes
SELECT Nome, Ano FROM Filmes;

-- 2 - Nome e ano ordenados por ano crescente
SELECT Nome, Ano FROM Filmes ORDER BY Ano ASC;

-- 3 - Buscar "De Volta para o Futuro" com nome, ano e duração
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'De Volta para o Futuro';

-- 4 - Filmes lançados em 1997
SELECT Nome, Ano FROM Filmes WHERE Ano = 1997;

-- 5 - Filmes lançados após 2000
SELECT Nome, Ano FROM Filmes WHERE Ano > 2000;

-- 6 - Filmes com duração entre 100 e 150, ordenados pela duração
SELECT Nome, Duracao FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao ASC;

-- 7 - Quantidade de filmes lançados por ano, ordenados por ano descrescente
SELECT Ano, COUNT(*) AS Quantidade FROM Filmes GROUP BY Ano ORDER BY Ano DESC;

-- 8 - Atores do gênero masculino
SELECT PrimeiroNome, UltimoNome FROM Atores WHERE Genero = 'M';

-- 9 - Atores do gênero feminino ordenados pelo primeiro nome
SELECT PrimeiroNome, UltimoNome FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome ASC;

-- 10 - Nome do filme e seu gênero
SELECT f.Nome AS Filme, g.Nome AS Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.FilmeId = fg.FilmeId
JOIN Generos g ON fg.GeneroId = g.GeneroId;

-- 11 - Nome do filme e gênero "Mistério"
SELECT f.Nome AS Filme, g.Nome AS Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.FilmeId = fg.FilmeId
JOIN Generos g ON fg.GeneroId = g.GeneroId
WHERE g.Nome = 'Mistério';

-- 12 - Nome do filme e atores com papel
SELECT f.Nome AS Filme, a.PrimeiroNome, a.UltimoNome, ef.Papel
FROM Filmes f
JOIN ElencoFilme ef ON f.FilmeId = ef.FilmeId
JOIN Atores a ON ef.AtorId = a.AtorId
ORDER BY f.Nome, a.PrimeiroNome;
