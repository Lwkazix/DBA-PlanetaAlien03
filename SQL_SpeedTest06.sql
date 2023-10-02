CREATE DATABASE  planetaAlien;

USE planetaAlien;


CREATE TABLE missao_historiamissao (
    id INTEGER PRIMARY KEY auto_increment,
    titulo VARCHAR(30),
    forca VARCHAR(30),
    fk_historia_id INTEGER
);

CREATE TABLE historia (
    id INTEGER PRIMARY KEY auto_increment,
    titulo VARCHAR(30),
    descricao LONGTEXT,
    final TEXT
);

CREATE TABLE competencia (
    id INTEGER PRIMARY KEY auto_increment,
    descricao LONGTEXT,
    fk_verbo_id INTEGER
);

CREATE TABLE bloom (
    id INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(30)
);

CREATE TABLE verbo (
    id INTEGER PRIMARY KEY auto_increment,
    nomeverbo VARCHAR(30),
    fk_bloom_id INTEGER
);

CREATE TABLE etapa (
    id INTEGER PRIMARY KEY auto_increment,
    instrucao TEXT,
    tipo VARCHAR(30),
    ponto VARCHAR(30)
);

CREATE TABLE etapaCompetencia (
    fk_etapa_id INTEGER
);

CREATE TABLE Relacionamento_3 (
    fk_competencia_id INTEGER
);

CREATE TABLE Relacionamento_5 (
    fk_etapa_id INTEGER,
    fk_missao_historiamissao_id INTEGER
);
 
ALTER TABLE missao_historiamissao ADD CONSTRAINT FK_missao_historiamissao_2
    FOREIGN KEY (fk_historia_id)
    REFERENCES historia (id)
    ON DELETE RESTRICT;
 
ALTER TABLE competencia ADD CONSTRAINT FK_competencia_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE verbo ADD CONSTRAINT FK_verbo_2
    FOREIGN KEY (fk_bloom_id)
    REFERENCES bloom (id)
    ON DELETE CASCADE;
 
ALTER TABLE etapaCompetencia ADD CONSTRAINT FK_etapaCompetencia_1
    FOREIGN KEY (fk_etapa_id)
    REFERENCES etapa (id)
    ON DELETE CASCADE;
 
ALTER TABLE Relacionamento_3 ADD CONSTRAINT FK_Relacionamento_3_1
    FOREIGN KEY (fk_competencia_id)
    REFERENCES competencia (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_5 ADD CONSTRAINT FK_Relacionamento_5_1
    FOREIGN KEY (fk_etapa_id)
    REFERENCES etapa (id)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_5 ADD CONSTRAINT FK_Relacionamento_5_2
    FOREIGN KEY (fk_missao_historiamissao_id)
    REFERENCES missao_historiamissao (id)
    ON DELETE SET NULL;