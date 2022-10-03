-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD
-- Criação
-- 1)
INSERT INTO
    clientes (nome, lealdade)
VALUES
    ('Geórgia', 0)
INSERT INTO
    pedidos (status, cliente_id)
VALUES
    ('Recebido', 6)
INSERT INTO
    produtos_pedidos (pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);

-- Leitura
-- 2)
SELECT
    cl.id,
    cl.nome,
    cl.lealdade,
    pe.id,
    pe.status,
    pe.cliente_id,
    pr.id,
    pr.nome,
    pr.tipo,
    pr."preço",
    pr.pts_de_lealdade
FROM
    clientes cl
    INNER JOIN pedidos pe ON pe.cliente_id = cl.id
    INNER JOIN produtos_pedidos pp ON pp.pedido_id = pe.id
    INNER JOIN produtos pr ON pr.id = pp.produto_id
WHERE
    cl.id = 6;

-- Atualização
-- 3)
UPDATE
    clientes
SET
    lealdade = (
        SELECT
            SUM(pr.pts_de_lealdade) as pts
        FROM
            produtos_pedidos pp
            INNER JOIN pedidos pe ON pe.id = pp.pedido_id
            INNER JOIN produtos pr ON pr.id = pp.produto_id
            INNER JOIN clientes cl ON cl.id = pe.cliente_id
        WHERE
            pe.cliente_id = 6
    )
WHERE
    nome = 'Geórgia' RETURNING *;

-- Deleção
-- 4)
DELETE FROM
    clientes
WHERE
    nome = 'Marcelo' RETURNING *;