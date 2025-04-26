--a) Dados completos de pessoas físicas.
SELECT * 
FROM Pessoa 
WHERE tipo = 'F';

--b)Dados completos de pessoas jurídicas.
SELECT * 
FROM Pessoa 
WHERE tipo = 'J';

--c)Movimentações de entrada, com produto, fornecedor, quantidade, preço unitário e valor total.
SELECT 
    p.nome AS Fornecedor,
    pr.nome AS Produto,
    c.quantidade,
    c.preco_unitario,
    c.quantidade * c.preco_unitario AS Valor_Total
FROM Compra c
JOIN Pessoa p ON c.id_fornecedor = p.id_pessoa
JOIN Produto pr ON c.id_produto = pr.id_produto;

--d)Movimentações de saída, com produto, comprador, quantidade, preço unitário e valor total.
SELECT 
    p.nome AS Cliente,
    pr.nome AS Produto,
    v.quantidade,
    c.preco_unitario,
    v.quantidade * c.preco_unitario AS Valor_Total
FROM Venda v
JOIN Pessoa p ON v.id_cliente = p.id_pessoa
JOIN Produto pr ON v.id_produto = pr.id_produto
JOIN Compra c ON c.id_produto = pr.id_produto;

--e)Valor total das entradas agrupadas por produto.
SELECT 
    pr.nome AS Produto,
    SUM(c.quantidade * c.preco_unitario) AS Total_Entrada
FROM Compra c
JOIN Produto pr ON c.id_produto = pr.id_produto
GROUP BY pr.nome;

--f)Valor total das saídas agrupadas por produto.
SELECT 
    pr.nome AS Produto,
    SUM(v.quantidade * c.preco_unitario) AS Total_Saida
FROM Venda v
JOIN Produto pr ON v.id_produto = pr.id_produto
JOIN Compra c ON c.id_produto = pr.id_produto
GROUP BY pr.nome;

--g)Operadores que não efetuaram movimentações de entrada (compra).
SELECT u.nome AS Operador
FROM Usuario u
WHERE NOT EXISTS (
    SELECT 1 
    FROM Compra c 
    WHERE c.id_usuario = u.id_usuario
);

--h)Valor total de entrada, agrupado por operador.
SELECT 
    u.nome AS Operador,
    SUM(c.quantidade * c.preco_unitario) AS Total_Entrada
FROM Compra c
JOIN Usuario u ON c.id_usuario = u.id_usuario
GROUP BY u.nome;

--i)Valor total de saída, agrupado por operador.
SELECT 
    u.nome AS Operador,
    SUM(v.quantidade * c.preco_unitario) AS Total_Saida
FROM Venda v
JOIN Usuario u ON v.id_usuario = u.id_usuario
JOIN Compra c ON c.id_produto = v.id_produto
GROUP BY u.nome;

--j)Valor médio de venda por produto, utilizando média ponderada.
SELECT 
    pr.nome AS Produto,
    SUM(v.quantidade * c.preco_unitario) * 1.0 / NULLIF(SUM(v.quantidade), 0) AS Media_Ponderada
FROM Venda v
JOIN Produto pr ON v.id_produto = pr.id_produto
JOIN Compra c ON c.id_produto = pr.id_produto
GROUP BY pr.nome;
