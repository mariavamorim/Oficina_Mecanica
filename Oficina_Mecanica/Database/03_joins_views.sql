USE Oficina_mecanica;


-- 1. INNER JOIN: total gasto com pecas por ordem
SELECT
    os.id_os AS Ordem,
    v.Modelo AS Veiculo,
    c.Nome AS Cliente,
    SUM(i.Quantidade * i.Valor_Unitario) AS Total_Pecas
FROM ordens_servico os
INNER JOIN veiculos v
    ON os.idVeiculos = v.idVeiculos
INNER JOIN clientes c
    ON v.idClientes = c.idClientes
INNER JOIN itens_os i
    ON os.id_os = i.Ordens_servico_id_os
GROUP BY os.id_os, v.Modelo, c.Nome;


-- 2. INNER JOIN: quantidade de ordens por mecanico
SELECT
    m.Nome AS Mecanico,
    m.Especialidade,
    s.Nome AS Servico,
    COUNT(os.id_os) AS Quantidade_Ordens
FROM mecanicos m
INNER JOIN ordens_servico os
    ON m.idMecanicos = os.idMecanicos
INNER JOIN servicos s
    ON os.idServicos = s.idServicos
GROUP BY m.idMecanicos, m.Nome, m.Especialidade, s.Nome;


-- 3. LEFT JOIN: clientes e seus veiculos
SELECT
    c.Nome AS Cliente,
    v.Marca,
    v.Modelo,
    v.Placa
FROM clientes c
LEFT JOIN veiculos v
    ON c.idClientes = v.idClientes;


-- 4. VIEW: clientes e veiculos
CREATE OR REPLACE VIEW vw_clientes_veiculos AS
SELECT
    c.Nome AS Cliente,
    v.Marca,
    v.Modelo,
    v.Placa
FROM clientes c
LEFT JOIN veiculos v
    ON c.idClientes = v.idClientes;