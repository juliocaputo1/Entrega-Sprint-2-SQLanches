-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados
-- 1)
SELECT
    pe.id,
    pe.status,
    pe.cliente_id,
    pr.id,
    pr.nome,
    pr.tipo,
    pr."preço",
    pr.pts_de_lealdade
FROM
    produtos_pedidos pp
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id;

-- 2)
SELECT
    pe.id
FROM
    produtos_pedidos pp
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
WHERE
    pr.nome = 'Fritas';

-- 3)
SELECT
    cl.nome AS gostam_de_fritas
FROM
    produtos_pedidos pp
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
    INNER JOIN clientes cl ON cl.id = pe.cliente_id
WHERE
    pr.id = 6;

-- 4)
SELECT
    SUM(pr.preço)
FROM
    produtos_pedidos pp
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
    INNER JOIN clientes cl ON cl.id = pe.cliente_id
WHERE
    cl.nome = 'Laura';

-- 5)
SELECT
    pr.nome,
    COUNT(pp.produto_id)
FROM
    produtos_pedidos pp
    INNER JOIN pedidos pe ON pe.id = pp.pedido_id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
    INNER JOIN clientes cl ON cl.id = pe.cliente_id
GROUP BY
    pr.nome