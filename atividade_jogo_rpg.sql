-- =========================================================
-- ATIVIDADE SENAI - BANCO DE DADOS JOGO RPG
-- SGBD: MySQL 8.0
-- Criação do banco de dados e das tabelas conforme o diagrama
-- =========================================================

CREATE DATABASE IF NOT EXISTS jogo_rpg
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE jogo_rpg;

-- ---------------------------------------------------------
-- Tabela: USUARIOS
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS USUARIOS (
    UsuarioId INT AUTO_INCREMENT,
    Email VARCHAR(255),
    Senha VARCHAR(255),
    CONSTRAINT PK_USUARIOS PRIMARY KEY (UsuarioId)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- Tabela: CLASSES
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS CLASSES (
    ClasseId INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao TEXT,
    CONSTRAINT PK_CLASSES PRIMARY KEY (ClasseId)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- Tabela: PERSONAGENS
-- Cada personagem pertence a um usuário e a uma classe.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS PERSONAGENS (
    PersonagemId INT AUTO_INCREMENT,
    NomePersonagem VARCHAR(100),
    UsuarioId INT,
    ClasseId INT,
    CONSTRAINT PK_PERSONAGENS PRIMARY KEY (PersonagemId),
    CONSTRAINT FK_PERSONAGENS_USUARIOS
        FOREIGN KEY (UsuarioId)
        REFERENCES USUARIOS (UsuarioId),
    CONSTRAINT FK_PERSONAGENS_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES (ClasseId)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- Tabela: HABILIDADES
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS HABILIDADES (
    HabilidadeId INT AUTO_INCREMENT,
    Nome VARCHAR(100),
    CONSTRAINT PK_HABILIDADES PRIMARY KEY (HabilidadeId)
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- Tabela: CLASSES_HABILIDADES
-- Tabela associativa entre CLASSES e HABILIDADES.
-- A chave primária é composta pelas duas chaves estrangeiras.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS CLASSES_HABILIDADES (
    ClasseId INT,
    HabilidadeId INT,
    CONSTRAINT PK_CLASSES_HABILIDADES
        PRIMARY KEY (ClasseId, HabilidadeId),
    CONSTRAINT FK_CLASSES_HABILIDADES_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES (ClasseId),
    CONSTRAINT FK_CLASSES_HABILIDADES_HABILIDADES
        FOREIGN KEY (HabilidadeId)
        REFERENCES HABILIDADES (HabilidadeId)
) ENGINE=InnoDB;

-- =========================================================
-- FIM DO SCRIPT
-- =========================================================
