-- TABELA CLIENTE

CREATE TABLE cliente
(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(14) NOT NULL UNIQUE,
celular CHAR(14) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
senha VARCHAR(512) NOT NULL
);

DROP TABLE cliente;

INSERT INTO cliente (
nome, cpf, celular, email, senha
) VALUES
    ("Guilherme Godoy", "111-222-333.04", "cesarnoooooo67@gmail.com", "(41)99999-8888", "pedrodocapa6742aura+ego=rego");
    ("Thiago Mendes", "111.222.333-44", "thiago.mendes@outlook.com", "(11)96666-1234", "th1@g0_m3nd3s"),
    ("Larissa Rocha", "555.111.222-33", "larissa.rocha@gmail.com", "(21)97777-5678", "l@r1_r0ch4!"),
    ("Bruno Azevedo", "777.333.888-22", "bruno.azevedo@yahoo.com", "(31)98888-9012", "br_azvd#2026"),
    ("Amanda Vieira", "999.444.111-55", "amanda.vieira@gmail.com", "(51)99999-3456", "am@nd4_v131r@"),
    ("Rodrigo Nunes", "222.888.555-66", "rodrigo.nunes@hotmail.com", "(61)97777-7890", "rod_nunes$99"),
    ("Letícia Dias", "888.666.444-11", "leticia.dias@gmail.com", "(71)98888-2345", "l3t_d1as#2026"),
    ("Felipe Castro", "333.555.999-00", "felipe.castro@outlook.com", "(81)99999-6789", "fel1p3_c@str0"),
    ("Isabela Martins", "444.000.777-88", "isabela.martins@gmail.com", "(19)96666-4321", "1s@_martins!"),
    ("Leonardo Frota", "666.222.111-99", "leonardo.frota@hotmail.com", "(47)97777-8765", "leo_frota#123"),
    ("Clarice Santana", "000.444.888-55", "clarice.santana@yahoo.com", "(85)98888-0987", "cl@r1_s@nt")


SELECT email, senha FROM cliente;


SELECT email, senha FROM cliente WHERE email = "thiago.mendes@outlook.com";


SELECT * FROM cliente


SELECT * FROM cliente WHERE id <= 10 AND LENGTH(senha) > 20;


DELETE FROM cliente WHERE id = 11;


UPDATE cliente SET nome = "Guilherme Godoy", email = "cesarnoooooo67@gmail.com" WHERE id = 1;

-- TABELA ENDERECO

CREATE TABLE endereco
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    numero INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,

    FOREIGN KEY (idcliente) REFERENCES cliente(id)
);

-- TABELA PRODUTO

CREATE TABLE produto
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    caminho_img VARCHAR(255),
    quantidade_img INT NOT NULL
);

INSERT INTO produto
(nome, descricao, categoria, preco, caminho_img, quantidade_img)
VALUES
('Óleo Sintético 5W30', 'Lubrificante sintético de alta performance para motores.', 'Lubrificantes', 45.90, 'img/oleo_5w30.png', 50),
('Filtro de Óleo Blindado', 'Filtro de óleo para proteção contra impurezas no motor.', 'Filtros', 28.50, 'img/filtro_oleo.png', 40),
('Filtro de Ar Esportivo', 'Filtro de ar lavável de alto fluxo para maior potência.', 'Filtros', 149.90, 'img/filtro_ar_esp.png', 15),
('Pastilha de Freio Dianteira', 'Jogo de pastilhas de cerâmica sem ruído e alta durabilidade.', 'Freios', 119.90, 'img/pastilha_freio.png', 25),
('Disco de Freio Ventilado', 'Par de discos dianteiros ventilados de aço carbono.', 'Freios', 249.90, 'img/disco_freio.png', 12),
('Vela de Ignição Iridium', 'Jogo com 4 velas de iridium para queima eficiente.', 'Ignição', 189.90, 'img/vela_iridium.png', 20),
('Cabo de Vela Silicone', 'Jogo de cabos de ignição supressivos de 8mm.', 'Ignição', 89.90, 'img/cabo_vela.png', 18),
('Amortecedor Dianteiro', 'Amortecedor pressurizado a gás para maior estabilidade.', 'Suspensão', 329.90, 'img/amortecedor.png', 10),
('Kit Embreagem Completo', 'Platô, disco e rolamento para transmissão manual.', 'Transmissão', 489.90, 'img/embreagem.png', 8),
('Correia Dentada', 'Correia sincronizadora reforçada em borracha nitrílica.', 'Motor', 79.90, 'img/correia_dentada.png', 30),
('Bateria Automotiva 60Ah', 'Bateria selada livre de manutenção com 18 meses de garantia.', 'Elétrica', 389.90, 'img/bateria_60ah.png', 14),
('Lâmpada Super LED H4', 'Par de lâmpadas LED 6000K branco frio para farol principal.', 'Iluminação', 129.90, 'img/led_h4.png', 22),
('Palheta Limpador Silicone', 'Par de palhetas flexíveis de encaixe universal.', 'Acessórios', 49.90, 'img/palheta.png', 35),
('Aditivo Radiador Concentrado', 'Fluido orgânico anticorrosivo rosa de 1 litro.', 'Arrefecimento', 34.90, 'img/aditivo_rad.png', 45),
('Bomba de Água', 'Bomba d água com rotor de alumínio e junta de vedação.', 'Arrefecimento', 139.90, 'img/bomba_agua.png', 16),
('Fluido de Freio DOT 4', 'Frasco de 500ml de fluido sintético para freios ABS.', 'Freios', 24.90, 'img/fluido_dot4.png', 40),
('Sensor de Oxigênio', 'Sonda lambda universal de 4 fios para injeção eletrônica.', 'Injeção', 179.90, 'img/sonda_lambda.png', 12),
('Bico Injetor Flex', 'Válvula injetora de combustível de alta vazão.', 'Injeção', 159.90, 'img/bico_injetor.png', 15),
('Tapete Automotivo Borracha', 'Jogo com 4 tapetes impermeáveis e antiderrapantes.', 'Acessórios', 84.90, 'img/tapete_carro.png', 20),
('Cera Cristalizadora', 'Cera protetora de carnaúba para brilho intenso na pintura.', 'Estética', 42.90, 'img/cera_auto.png', 28),
('Pretinho Pneu Gel', 'Gel revitalizador de brilho molhado e longa duração.', 'Estética', 19.90, 'img/pretinho_pneu.png', 50),
('Calota Esportiva Aro 14', 'Jogo com 4 calotas em ABS preto fosco de fixação firme.', 'Rodas', 99.90, 'img/calota_14.png', 18),
('Pivô de Suspensão', 'Pivô inferior reforçado para bandeja dianteira.', 'Suspensão', 64.90, 'img/pivo_susp.png', 24),
('Terminal de Direção', 'Terminal articulado para alinhamento preciso da direção.', 'Direção', 58.90, 'img/terminal_dir.png', 26),
('Alternador 90A', 'Alternador completo remanufaturado com regulador de voltagem.', 'Elétrica', 549.90, 'img/alternador.png', 5),
('Motor de Partida', 'Arranque de alta rotação 12V para partida rápida.', 'Elétrica', 459.90, 'img/motor_partida.png', 6),
('Rolamento Roda Dianteira', 'Rolamento blindado de esferas para cubo de roda.', 'Suspensão', 74.90, 'img/rolamento_roda.png', 20),
('Extintor Incêndio ABC', 'Extintor automotivo veicular padrão obrigatório 5 anos.', 'Segurança', 69.90, 'img/extintor_abc.png', 30),
('Macaco Sanfona 2 Ton', 'Macaco mecânico articulado com manivela reforçada.', 'Ferramentas', 109.90, 'img/macaco_2t.png', 15),
('Kit Revisão Básica', 'Kit com 4L de óleo 5W30, filtro de óleo e filtro de combustível.', 'Kits', 199.90, 'img/kit_revisao.png', 12);


-- TABELA COMPRA

CREATE TABLE compra
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT NOT NULL,
    idEndereco INT NOT NULL,
    data DATE NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (idcliente) REFERENCES cliente(id),
    FOREIGN KEY (idendereco) REFERENCES endereco(id)
);

-- TABELA PRODUTO COMPRA

CREATE TABLE produtocompra
(
    idproduto INT NOT NULL,
    idcompra INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (idproduto, idcompra),

    FOREIGN KEY (idproduto) REFERENCES produto(id),
    FOREIGN KEY (idcompra) REFERENCES compra(id)
);