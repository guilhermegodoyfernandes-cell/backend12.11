const db = require("./db")

const ESTRUTURA_CLIENTE = `
DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
id int NOT NULL AUTO_INCREMENT,
nome varchar(50) NOT NULL,
cpf char(14) NOT NULL,
celular char(14) NOT NULL,
email varchar(50) NOT NULL,
senha varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY cpf (cpf),
UNIQUE KEY email (email)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;`

const DADOS_CLIENTE = `
INSERT INTO cliente VALUES 
(2,'guilherme godoy','111.222.333-44','(41)98888-1111','guilherme.godoy@email.com','godoy123'),(3,'pedro nathan','222.333.444-55','(42)97777-2222','pedro.nathan@email.com','nathanneris456'),(4,'antonio wesley','333.444.555-66','(43)96666-3333','antonio wesley@email.com','$2b$10$dl68TJDYI9QGfygH.zSP7uuDo.YkQAabrBlmbW4LY3ZrdfpKqRXZ.'),
(5,'kayke','444.555.666-77','(44)95555-4444','kayke.ramos@email.com','ramos321'),(6,'Ana liva','555.666.777-88','(45)94444-5555','ana.livia@email.com','analivia987'),(7,'Pedro','777.888.999-00','(46)93333-6666','pedro.rocha@email.com','pedro654'),(8,'Beatriz','888.999.000-11','(47)92222-7777','beatriz.soares@email.com','biazinha2026'),(9,'Gabriel','999.000.111-22','(48)91111-8888','gabriel.lima@email.com','gabriel111'),(10,'Larissa','123.456.789-10','(49)90000-9999','larissa.souza@email.com','larissa555'),(12,'Ianzeen','11.322.322-44','(43)98888-1111','ianzeen.isadora@email.com','$2b$10$Mo.W9JRtsCskWxse/pNWuuM0q8IGwyNyFw/usAQ3rT/OEK7KZnDda');`
 
 const ESTRUTURA_PRODUTO = `
 DROP TABLE IF EXISTS produto;
 CREATE TABLE produto (
    id int NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    descricao varchar(255) NOT NULL,
    categoria varchar(50) NOT NULL,
    preco decimal(10,2) NOT NULL,
    caminho_img varchar(255) DEFAULT NULL,
    quantidade_img int NOT NULL,
    PRIMARY KEY (id)
  ) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;`

  const DADOS_PRODUTO = `
  INSERT INTO produto VALUES
  (1,'Óleo Sintético 5W30','Lubrificante sintético de alta performance para motores.','Lubrificantes',45.90,'img/oleo_5w30.png',50),(2,'Filtro de Óleo Blindado','Filtro de óleo para proteção contra impurezas no motor.','Filtros',28.50,'img/filtro_oleo.png',40),(3,'Filtro de Ar Esportivo','Filtro de ar lavável de alto fluxo para maior potência.','Filtros',149.90,'img/filtro_ar_esp.png',15),(4,'Pastilha de Freio Dianteira','Jogo de pastilhas de cerâmica sem ruído e alta durabilidade.','Freios',119.90,'img/pastilha_freio.png',25),(5,'Disco de Freio Ventilado','Par de discos dianteiros ventilados de aço carbono.','Freios',249.90,'img/disco_freio.png',12),(6,'Vela de Ignição Iridium','Jogo com 4 velas de iridium para queima eficiente.','Ignição',189.90,'img/vela_iridium.png',20),(7,'Cabo de Vela Silicone','Jogo de cabos de ignição supressivos de 8mm.','Ignição',89.90,'img/cabo_vela.png',18),(8,'Amortecedor Dianteiro','Amortecedor pressurizado a gás para maior estabilidade.','Suspensão',329.90,'img/amortecedor.png',10),(9,'Kit Embreagem Completo','Platô, disco e rolamento para transmissão manual.','Transmissão',489.90,'img/embreagem.png',8),(10,'Correia Dentada','Correia sincronizadora reforçada em borracha nitrílica.','Motor',79.90,'img/correia_dentada.png',30),(11,'Bateria Automotiva 60Ah','Bateria selada livre de manutenção com 18 meses de garantia.','Elétrica',389.90,'img/bateria_60ah.png',14),(12,'Lâmpada Super LED H4','Par de lâmpadas LED 6000K branco frio para farol principal.','Iluminação',129.90,'img/led_h4.png',22),(13,'Palheta Limpador Silicone','Par de palhetas flexíveis de encaixe universal.','Acessórios',49.90,'img/palheta.png',35),(14,'Aditivo Radiador Concentrado','Fluido orgânico anticorrosivo rosa de 1 litro.','Arrefecimento',34.90,'img/aditivo_rad.png',45),(15,'Bomba de Água','Bomba d água com rotor de alumínio e junta de vedação.','Arrefecimento',139.90,'img/bomba_agua.png',16),
  (16,'Fluido de Freio DOT 4','Frasco de 500ml de fluido sintético para freios ABS.','Freios',24.90,'img/fluido_dot4.png',40),(17,'Sensor de Oxigênio','Sonda lambda universal de 4 fios para injeção eletrônica.','Injeção',179.90,'img/sonda_lambda.png',12),(18,'Bico Injetor Flex','Válvula injetora de combustível de alta vazão.','Injeção',159.90,'img/bico_injetor.png',15),(19,'Tapete Automotivo Borracha','Jogo com 4 tapetes impermeáveis e antiderrapantes.','Acessórios',84.90,'img/tapete_carro.png',20),(20,'Cera Cristalizadora','Cera protetora de carnaúba para brilho intenso na pintura.','Estética',42.90,'img/cera_auto.png',28),(21,'Pretinho Pneu Gel','Gel revitalizador de brilho molhado e longa duração.','Estética',19.90,'img/pretinho_pneu.png',50)
  ,(22,'Calota Esportiva Aro 14','Jogo com 4 calotas em ABS preto fosco de fixação firme.','Rodas',99.90,'img/calota_14.png',18),(23,'Pivô de Suspensão','Pivô inferior reforçado para bandeja dianteira.','Suspensão',64.90,'img/pivo_susp.png',24),(24,'Terminal de Direção','Terminal articulado para alinhamento preciso da direção.','Direção',58.90,'img/terminal_dir.png',26),(25,'Alternador 90A','Alternador completo remanufaturado com regulador de voltagem.','Elétrica',549.90,'img/alternador.png',5),(26,'Motor de Partida','Arranque de alta rotação 12V para partida rápida.','Elétrica',459.90,'img/motor_partida.png',6),(27,'Rolamento Roda Dianteira','Rolamento blindado de esferas para cubo de roda.','Suspensão',74.90,'img/rolamento_roda.png',20),(28,'Extintor Incêndio ABC','Extintor automotivo veicular padrão obrigatório 5 anos.','Segurança',69.90,'img/extintor_abc.png',30),(29,'Macaco Sanfona 2 Ton','Macaco mecânico articulado com manivela reforçada.','Ferramentas',109.90,'img/macaco_2t.png',15),(30,'Kit Revisão Básica','Kit com 4L de óleo 5W30, filtro de óleo e filtro de combustível.','Kits',199.90,'img/kit_revisao.png',12);`;

    
 
  async function criar_tabelas() {
    const connection = await db.pool.getConnection();
    try {
        await connection.beginTransaction();

        console.log("Criando tabela 'cliente'...");
        await connection.query(ESTRUTURA_CLIENTE);
        await connection.query(DADOS_CLIENTE);

        console.log("Criando tabela 'produto'...");
        await connection.query(ESTRUTURA_PRODUTO);
        await connection.query(DADOS_PRODUTO);         

        await connection.commit();
        console.log("Migration executada com sucesso!");
        process.exit(0);
    } catch (error) {
        await connection.rollback();
        console.log(error)
        process.exit(1);
    } finally {
        connection.release();
    }
}
criar_tabelas()