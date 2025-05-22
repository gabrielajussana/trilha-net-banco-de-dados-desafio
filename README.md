# DIO - Trilha .NET - Banco de Dados
Este projeto consiste em executar consultas SQL no banco de dados de um site de filmes, onde estão armazenadas informações sobre filmes, atores e gêneros. O objetivo é praticar consultas para obter diferentes análises com base no modelo de dados fornecido.

O banco de dados foi criado e populado utilizando o script Script Filmes.sql, que deve ser executado em um ambiente SQL Server.

## Modelo do banco de dados 
O banco contém as seguintes tabelas principais:
- **Filmes** 
Tabela responsável por armazenar informações dos filmes.

- **Atores**
Tabela responsável por armazenar informações dos atores.

- **Generos**
Tabela responsável por armazenar os gêneros dos filmes.

- **ElencoFilme**
Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e atores, ou seja, um ator pode trabalhar em muitos filmes, e filmes
podem ter muitos atores.

- **FilmesGenero**
Tabela responsável por representar um relacionamento do tipo muitos para muitos entre filmes e gêneros, ou seja, um filme pode ter mais de um gênero, e um genêro pode fazer parte de muitos filmes.


## 1 - Buscar o nome e ano dos filmes
```sql
SELECT Nome, Ano
FROM Filmes;
```

## 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
```sql
SELECT Nome, Ano
FROM Filmes
ORDER BY Ano ASC;
```

## 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
```sql
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Nome = 'De volta para o futuro';
```

## 4 - Buscar os filmes lançados em 1997
```sql
SELECT Nome, Ano
FROM Filmes
WHERE Ano = 1997;
```
## 5 - Buscar os filmes lançados APÓS o ano 2000
```sql
SELECT Nome, Ano
FROM Filmes
WHERE Ano > 2000;
```

## 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
```sql
SELECT Nome, Duracao
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao ASC;
```

## 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
```sql
SELECT Ano, COUNT(*) AS QuantidadeFilmes
FROM Filmes
GROUP BY Ano
ORDER BY QuantidadeFilmes DESC;
```

## 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
```sql
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Masculino';
```

## 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
```sql
SELECT PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'Feminino'
ORDER BY PrimeiroNome ASC;
```

## 10 - Buscar o nome do filme e o gênero
```sql
SELECT f.Nome AS Filme, g.Nome AS Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.IdFilme = fg.IdFilme
JOIN Generos g ON fg.IdGenero = g.IdGenero;
```

## 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
```sql
SELECT f.Nome AS Filme, g.Nome AS Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.IdFilme = fg.IdFilme
JOIN Generos g ON fg.IdGenero = g.IdGenero
WHERE g.Nome = 'Mistério';
```

## 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
```sql
SELECT f.Nome AS Filme, a.PrimeiroNome, a.UltimoNome, ef.Papel
FROM Filmes f
JOIN ElencoFilme ef ON f.IdFilme = ef.IdFilme
JOIN Atores a ON ef.IdAtor = a.IdAtor;
```