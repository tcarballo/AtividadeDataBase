
CREATE TABLE IF NOT EXISTS usuarios (
  id_user INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(70) NOT NULL,
  documento VARCHAR(45) NOT NULL,
  habilitado TINYINT NULL DEFAULT 1);

CREATE TABLE IF NOT EXISTS nivel_de_acesso (
  id_nvl_acesso INT PRIMARY KEY AUTO_INCREMENT,
  nome_nvl_acesso VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_nvl_acesso)
  );

CREATE TABLE IF NOT EXISTS user_nvl_acesso_pair (
  id_nvl_acesso INT PRIMARY KEY NOT NULL,
  id_user INT PRIMARY KEY NOT NULL,
  CONSTRAINT 
    FOREIGN KEY (id_nvl_acesso)
    REFERENCES nivel_de_acesso (id_nvl_acesso),
  CONSTRAINT 
    FOREIGN KEY (id_user)
    REFERENCES usuarios (id_user)
    );

CREATE TABLE IF NOT EXISTS cracha (
  id_cracha INT PRIMARY KEY AUTO_INCREMENT,
  numero_cracha INT
);

CREATE TABLE IF NOT EXISTS user_cracha_pair (
  id_cracha INT(11) NOT NULL,
  id_user INT(11) NOT NULL,
  PRIMARY KEY (id_cracha, id_user),
  CONSTRAINT
    FOREIGN KEY (id_cracha)
    REFERENCES cracha (id_cracha),
  CONSTRAINT
    FOREIGN KEY (id_user)
    REFERENCES usuarios (id_user)
);

CREATE TABLE IF NOT EXISTS portas (
  id_porta INT PRIMARY KEY ,
  nome_porta VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS nvl_porta_pair (
  id_porta INT PRIMARY KEY NOT NULL,
  id_nvl_acesso INT PRIMARY KEY NOT NULL,
  CONSTRAINT
    FOREIGN KEY (id_porta)
    REFERENCES portas (id_porta),
  CONSTRAINT
    FOREIGN KEY (id_nvl_acesso)
    REFERENCES nivel_de_acesso (id_nvl_acesso)
    );

CREATE TABLE IF NOT EXISTS historico_acessos (
  id_historico_acesso INT PRIMARY KEY AUTO_INCREMENT,
  data_hora_acesso DATETIME NULL DEFAULT NULL,
  mensagem VARCHAR(150) NULL DEFAULT NULL,
  cracha_id_cracha INT,
  usuarios_id_user INT,
  portas_id_porta INT,
  CONSTRAINT
    FOREIGN KEY (cracha_id_cracha)
    REFERENCES cracha (id_cracha),
  CONSTRAINT
    FOREIGN KEY (usuarios_id_user)
    REFERENCES usuarios (id_user),
  CONSTRAINT 
    FOREIGN KEY (portas_id_porta)
    REFERENCES portas (id_porta)
);

