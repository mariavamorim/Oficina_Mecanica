USE Oficina_mecanica;


-- CLIENTES
INSERT INTO clientes
(Nome, Telefone, Email, Endereco)
VALUES
('Dilma Roussef', '14999990001', 'Dilma@email.com', 'Rua A, 13'),
('Erika Hilton', '14999990002', 'Erika@email.com', 'Rua B, 24'),
('André Mendonça', '14999990003', 'André@email.com', 'Rua C, 30'),
('Jair Bolsonaro', '14999990004', 'Jair@email.com', 'Rua D, 22');


-- VEICULOS
INSERT INTO veiculos
(Marca, Modelo, Ano, Placa, idClientes)
VALUES
('Chevrolet', 'Corsa', 2016, 'ABC1D23', 1),
('BYD', 'Dolphin', 2026, 'DEF4G56', 2),
('Volkswagen', 'Jetta GLI', 2026, 'HIJ7K89', 3),
('Toyota', 'SW4', 2026, 'PLB2J17', 4);


-- MECANICOS
INSERT INTO mecanicos
(Nome, Especialidade, Telefone)
VALUES
('Flavio Bolsonaro', 'Motor', '14988880001'),
('Nikolas Ferreira', 'Freios', '14988880002'),
('Alexandre de Morais', 'Suspensão', '14988880003'),
('Luis Inacio Lula da Silva', 'Eletrica', '14988880004');


-- SERVICOS
INSERT INTO servicos
(Nome, Descricao, Valor)
VALUES
('Troca de óleo', 'Troca de óleo do motor', 150.00),
('Revisão de freios', 'Verificação e manutenção dos freios', 250.00),
('Alinhamento', 'Alinhamento da direção e suspensão', 100.00),
('Revisão do ar-condicionado', 'Manutenção do ar-condicionado', 300.00);


-- PECAS
INSERT INTO pecas
(Nome, Descricao, Preco, Quantidade_estoque)
VALUES
('Óleo 5W30', 'Óleo para motor', 45.00, 30),
('Pastilha de freio', 'Pastilha de freio dianteira', 120.00, 20),
('Filtro de óleo', 'Filtro para motor', 35.00, 25),
('Vela de ignição', 'Vela para motor', 28.00, 40),
('Filtro de ar-condicionado', 'Filtro de cabine', 55.00, 15);


-- ORDENS DE SERVICO
INSERT INTO ordens_servico
(Data_abertura, Data_conclusao, Status,
 idVeiculos, idMecanicos, idServicos)
VALUES
('2026-10-30 08:00:00', NULL, 'Em andamento', 1, 1, 1),
('2026-10-30 09:00:00', NULL, 'Aberta', 2, 2, 2),
('2026-10-30 10:00:00', NULL, 'Em andamento', 3, 3, 3),
('2026-10-30 11:00:00', NULL, 'Aberta', 4, 4, 4);


-- ITENS DAS ORDENS
INSERT INTO itens_os
(Quantidade, Valor_Unitario, Ordens_servico_id_os, idPecas)
VALUES
(2, 45.00, 1, 1),
(1, 120.00, 2, 2),
(1, 35.00, 3, 3),
(2, 55.00, 4, 5);