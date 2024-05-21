
-- Creation of database
CREATE DATABASE LEAGUE_OF_LEGENDS_WORLD_CHAMPIONSHIP;
GO

-- Use of db
USE LEAGUE_OF_LEGENDS_WORLD_CHAMPIONSHIP

-- * ------------------*
-- | TABLAS DE ENTIDAD |
-- * ------------------*

-- [PERSONA]
CREATE TABLE PERSONA (
Codigo INT NOT NULL,
-- Datos de Persona
Nombre VARCHAR(30) NOT NULL,
Apellido_1 VARCHAR(30) NOT NULL,
Apellido_2 VARCHAR(30) NULL,
Fecha_nacimiento DATE NOT NULL,
Tipo_doc VARCHAR(5) NOT NULL,
Num_doc VARCHAR(15) NOT NULL,
Telefono_1 VARCHAR(9) NULL, -- VARCHAR porque no planeamos hacer calculos. 
Telefono_2 VARCHAR(9) NULL,
-- Direccion
TipoVia_direccion VARCHAR(15) NOT NULL,
Calle_direccion VARCHAR (30) NOT NULL,
Numero_direccion INT NOT NULL,
Piso_direccion INT NOT NULL,
Letra_direccion CHAR,
Escalera_direccion TINYINT,
-- Tipo
Tipo_Persona CHAR(5), -- CELEB, EMPRT, EMPRQ. Celebridad, Empleado de Riot, Empleado de Equipo. 
 
-- Campos Foreaneos
Cod_division_territorial INT NOT NULL

-- PK CONSTRAINT 
CONSTRAINT PK_PERSONA_CODIGO PRIMARY KEY (codigo)
);

-- PERSONA > TIPO
-- [CELEBRIDAD]
CREATE TABLE CELEBRIDAD (
Cod_Celebridad INT NOT NULL,
Alias VARCHAR(30) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_CELEBRIDAD_COD_CELEBRIDAD PRIMARY KEY (Cod_Celebridad)
);


-- [EMPLEADOS DE RIOT Y NARRADORES]
CREATE TABLE EMPLEADO_DE_RIOT (
Cod_empleado_de_riot INT NOT NULL,
Tipo CHAR(5) NOT NULL, -- (CASTR, OTHER)
-- PK CONSTRAINT 
CONSTRAINT PK_EMPLEADO_DE_RIOT_COD_EMPLEADO_DE_RIOT PRIMARY KEY (Cod_empleado_de_riot)
);

CREATE TABLE NARRADOR (
Cod_narrador INT NOT NULL
 
-- PK CONSTRAINT 
CONSTRAINT PK_NARRADOR_COD_NARRADOR PRIMARY KEY (Cod_narrador)
);

-- [EMPLEADOS DE EQUIPO]
CREATE TABLE EMPLEADO_DE_EQUIPO (
Cod_empleado_de_equipo INT NOT NULL,
Tipo CHAR(5) NOT NULL, -- (PLYER, COACH)
Cod_equipo INT NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_EMPLEADO_DE_EQUIPO_COD_EMPLEADO_DE_EQUIPO PRIMARY KEY (Cod_empleado_de_equipo)
);

CREATE TABLE JUGADOR (
Cod_jugador INT NOT NULL,
Alias VARCHAR(30) NOT NULL,
Cod_rol VARCHAR(4) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_JUGADOR_COD_JUGADOR PRIMARY KEY (Cod_jugador)
);

-- [LOCALIZACION] 

CREATE TABLE PAIS (
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_PAIS_CODIGO PRIMARY KEY (Codigo)
);

-- NOTA: Esta tabla puede ser simplificada, sólo aporta información adicional.
-- en realidad no hace falta al 100%. Pero para el proyecto que la BBDD esta
-- pensado, tiene sentido.

CREATE TABLE DIVISION_TERRITORIAL(
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Tipo VARCHAR(16) NOT NULL, -- Este es el tipo de division territorial, se podria extraer a otra entidad pero eso ya es demasiado.
Cod_pais INT NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_DIVISION_TERRITORIAL PRIMARY KEY (Codigo)
);

-- [RED SOCIAL]

CREATE TABLE RED_SOCIAL (
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
 
-- PK CONSTRAINT 
CONSTRAINT PK_RED_SOCIAL_CODIGO PRIMARY KEY (Codigo)
);

-- [EQUIPO]

CREATE TABLE EQUIPO (
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Cod_region VARCHAR(5) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_EQUIPO_CODIGO PRIMARY KEY (Codigo)
);

-- [REGION]
CREATE TABLE REGION (
Codigo VARCHAR(5) NOT NULL, -- Limitado a ciertos acroninoms, AKA: LCK, LPL, LEC
Nombre VARCHAR(50) NOT NULL,
-- PK CONSTRAINT 
CONSTRAINT PK_REGION_CODIGO PRIMARY KEY (Codigo)
);

-- [RECINTO]

CREATE TABLE RECINTO (
-- Datos del recinto
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Aforo INT NOT NULL,
-- Direccion
TipoVia_direccion VARCHAR(6) NOT NULL,
Calle_direccion VARCHAR (30) NOT NULL,
Numero_direccion VARCHAR (30) NOT NULL,
Piso_direccion VARCHAR(5) NOT NULL,
Letra_direccion CHAR,
Escalera_direccion TINYINT,
-- Foreign Values
Cod_division_territorial INT NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_RECINTO_CODIGO PRIMARY KEY (Codigo)
);

-- [PARTIDA]

CREATE TABLE PARTIDA (
Codigo INT NOT NULL,
Fecha_Hora_prevista DATE NOT NULL,
Fecha_Hora_inicio DATE NULL,
Fecha_Hora_fin DATE NULL,
Serie CHAR, -- ( S | N ) dependiendo si pertenece o no a una serie. Las series son jugadas el mismo dia. Basta con ver la fecha Hora prevista para saber si dos partidas forman parte de una misma serie si continen los dos equipos y se encuentran en el mismo dia.
cod_recinto INT NOT NULL,
ganada_por  CHAR, -- ( B | R ) De alguna forma olvidé de especificar en el EERR quien gana. Es como hacer una BBDD de la champions y anotar los minutos donde el bicho recibió un pase. Bastante jocoso la verdad.
-- PK CONSTRAINT 
CONSTRAINT PK_PARTIDA_CODIGO PRIMARY KEY (Codigo)
);

-- [PERSONAJE]

CREATE TABLE PERSONAJE (
Codigo INT NOT NULL,
Nombre VARCHAR(16),  
-- PK CONSTRAINT 
CONSTRAINT PK_PERSONAJE_CODIGO PRIMARY KEY (Codigo)
);

-- [ROL]

CREATE TABLE ROL (
Codigo VARCHAR(4) NOT NULL, -- Codigo será la abreviación usualmente utilizada para referirse al rol.
Nombre VARCHAR(15) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_ROL_CODIGO PRIMARY KEY (Codigo)
);

-- [RUNAS]
CREATE TABLE RUNA (
Codigo INT NOT NULL,
Nombre VARCHAR(30),
Categoria VARCHAR(15) NOT NULL, -- Esto puede ser abstraido a otra entidad llamada CATEGORIAS donde sea: ID, NOMBRE y la RUNA pertenece a CATEGORIA.
Descripcion VARCHAR(255) NOT NULL
 
-- PK CONSTRAINT 
CONSTRAINT PK_RUNA_CODIGO PRIMARY KEY (Codigo)
);

-- [OBJETOS]
CREATE TABLE OBJETO (
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Precio INT NOT NULL,
 
-- PK CONSTRAINT 
CONSTRAINT PK_OBJETO_CODIGO PRIMARY KEY (Codigo)
);


-- [OBJETIVOS]
CREATE TABLE OBJETIVO (
Codigo INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Tipo CHAR(5) -- STRUC, DRAKE, 

-- PK CONSTRAINT 
CONSTRAINT PK_OBJETIVO_CODIGO PRIMARY KEY (Codigo)
);

CREATE TABLE ESTRUCTURA (
Cod_estructura INT NOT NULL,
Nivel TINYINT NOT NULL,
-- PK CONSTRAINT 
CONSTRAINT PK_ESTRUCTURA_COD_ESTRUCTURA PRIMARY KEY (Cod_estructura)
);

CREATE TABLE DRAGON (
Cod_dragon INT NOT NULL,
Elemento VARCHAR(15) NOT NULL,

-- PK CONSTRAINT 
CONSTRAINT PK_DRAGON_COD_DRAGON PRIMARY KEY (Cod_dragon)
);

-- *-----------------------*
-- *-     TABLAS N:M       *
-- *-----------------------*

CREATE TABLE RED_SOCIAL_ES_USADA_POR_PERSONA (
Cod_red_social INT NOT NULL,
Cod_persona INT NOT NULL
 
-- PK CONSTRAINT 
CONSTRAINT PK_RED_SOCIAL_ES_USADA_POR_PERSONA_cod_red_social_cod_persona PRIMARY KEY (Cod_red_social, Cod_persona)
);

CREATE TABLE EQUIPO_JUEGA_EN_PARTIDA (
Cod_equipo INT NOT NULL,
Cod_partida INT NOT NULL,
Lado_en_el_que_juega CHAR NOT NULL -- B | R. El lado en el que juega siempre sera B o R de BLUE,RED
-- PK CONSTRAINT 
CONSTRAINT PK_EQUIPO_JUEGA_EN_PARTIDA PRIMARY KEY (Cod_equipo, Cod_partida)
);

CREATE TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA (
Cod_jugador INT NOT NULL,
Cod_partida INT NOT NULL,
Puntuacion_de_vision TINYINT NOT NULL,
Puntuacion_de_subditos SMALLINT NOT NULL,
Oro_total_obtenido SMALLINT NOT NULL,
Asistencias TINYINT NOT NULL,
Muertes TINYINT NOT NULL,
Asesinatos TINYINT NOT NULL
 
-- PK CONSTRAINT 
CONSTRAINT PK_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_ PRIMARY KEY (Cod_jugador, Cod_partida)
);

CREATE TABLE ROL_TIENE_RECOMENDADO_PERSONAJE  (
Cod_personaje INT NOT NULL,
Cod_rol VARCHAR(4) NOT NULL
-- PK CONSTRAINT 
CONSTRAINT PK_ROL_TIENE_RECOMENDADO_PERSONAJE_COD_PERSONAJE_COD_ROL PRIMARY KEY (Cod_personaje, Cod_rol)
);

CREATE TABLE PERSONAJE_TIENE_RECOMENDADO_OBJETO (
Cod_objeto INT NOT NULL,
Cod_personaje INT NOT NULL,
 
-- PK CONSTRAINT 
CONSTRAINT PK_PERSONAJE_TIENE_RECOMENDADO_OBJETO_COD_OBJETO_COD_PERSONAJE PRIMARY KEY (Cod_objeto, Cod_personaje)
);
-- Ok, Estoy haciendo ambas cosas al mismo tiempo

CREATE TABLE OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO (
Cod_objeto_tiene_prerrequisito INT NOT NULL,
Cod_objeto_es_prerrequisito_de INT NOT NULL
 
-- PK CONSTRAINT 
CONSTRAINT PK_OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO_COD_OBJETO_TIENE_PRERREQUISITO_COD_OBJETO_ES_PRERREQUISITO_DE PRIMARY KEY (Cod_objeto_tiene_prerrequisito,Cod_objeto_es_prerrequisito_de)
);

CREATE TABLE PARTIDA_TIENE_OBJETIVO_CUMPLIDO (
Cod_objetivo INT NOT NULL,
Cod_partida INT NOT NULL,
Minuto_de_partida TIME NOT NULL,
Lado_donde_se_cumple CHAR -- Sólo B o R
-- PK CONSTRAINT 
CONSTRAINT PK_PARTIDA_TIENE_OBJETIVO_CUMPLIDO_COD_OBJETIVO_COD_PARTIDA PRIMARY KEY (Cod_objetivo, Cod_partida)
);

CREATE TABLE NARRADOR_NARRA_PARTIDA (
Cod_narrador INT NOT NULL,
Cod_partida INT NOT NULL,
 
-- PK CONSTRAINT 
CONSTRAINT PK_NARRADOR_NARRA_PARTIDA_COD_NARRADOR_COD_PARTIDA PRIMARY KEY (Cod_narrador, Cod_partida)
);

-- *------------------*
-- |   TABLAS N:M:P   |
-- *------------------*

CREATE TABLE PERSONAJE_COMPRA_OBJETO_EN_PARTIDA (
Cod_personaje INT NOT NULL,
Cod_partida INT NOT NULL,
Cod_objeto INT NOT NULL,
 
-- PK CONSTRAINT 
CONSTRAINT PK_PERSONAJE_COMPRA_OBJETO_EN_PARTIDA_cod_personaje_cod_partida_cod_objeto PRIMARY KEY (Cod_personaje, Cod_partida, Cod_objeto)
);

CREATE TABLE JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE (
Cod_jugador INT NOT NULL,
Cod_partida INT NOT NULL,
Cod_personaje INT NOT NULL,
Lado CHAR NOT NULL,
-- PK CONSTRAINT 
CONSTRAINT PK_JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE_cod_jugador_cod_partida_cod_personaje PRIMARY KEY (Cod_jugador, Cod_partida, Cod_personaje)
);


CREATE TABLE PERSONAJE_USA_RUNA_EN_PARTIDA (
Cod_personaje INT NOT NULL,
Cod_runa INT NOT NULL,
Cod_partida INT NOT NULL,
-- PK CONSTRAINT
CONSTRAINT PK_PERSONAJE_USA_RUNA_EN_PARTIDA_cod_personaje_cod_runa_cod_partida PRIMARY KEY(Cod_personaje, Cod_partida, Cod_runa)
)

GO
-- *-----------------*
-- | CONSTRAINTS: FK |
-- *-----------------*

--- *-------*
--- | 1 : N |
--- *-------*

-- [ PERSONA ]
-- RELACION: PERSONA VIVE EN DIVISION TERRITORIAL
ALTER TABLE PERSONA
    ADD CONSTRAINT FK_PERSONA_DIVISION_TERRITORIAL_cod_division_territorial
    FOREIGN KEY (Cod_division_territorial)
    REFERENCES DIVISION_TERRITORIAL (Codigo)
    ON UPDATE CASCADE;
GO
-- [ PAIS ]
-- RELACION: DIVISION PERTENECE A PAIS 
ALTER TABLE DIVISION_TERRITORIAL
    ADD CONSTRAINT FK_DIVISION_TERRITORIAL_PAIS_cod_pais
    FOREIGN KEY (Cod_pais)
    REFERENCES PAIS (Codigo)
    ON UPDATE CASCADE
GO

-- [ PARTIDA ]
-- -- [ EQUIPO ]

-- RELACION JUGADOR TIENE ROL
ALTER TABLE JUGADOR
    ADD CONSTRAINT FK_JUGADOR_ROL_cod_rol
    FOREIGN KEY (Cod_rol)
    REFERENCES ROL (Codigo)
    ON UPDATE CASCADE
GO


-- RELACION EQUIPO PERTENECE A REGION
ALTER TABLE EQUIPO
    ADD CONSTRAINT FK_EQUIPO_REGION_cod_region
    FOREIGN KEY (Cod_region)
    REFERENCES REGION (Codigo)
    ON UPDATE CASCADE
GO

-- [ RECINTO ]

-- RELACION RECINTO DA LUGAR A
ALTER TABLE PARTIDA
    ADD CONSTRAINT FK_PARTIDA_RECINTO_Cod_recinto
    FOREIGN KEY (Cod_recinto)
    REFERENCES RECINTO (Codigo)
    ON UPDATE CASCADE
GO

ALTER TABLE RECINTO
    ADD CONSTRAINT FK_RECINTO_DIVISION_TERRITORIAL_Cod_division_territorial
    FOREIGN KEY (Cod_division_territorial)
    REFERENCES DIVISION_TERRITORIAL (Codigo)
    ON UPDATE CASCADE
GO

-- *-------*
-- | N : M |
-- *-------*

-- [ RED SOCIAL - PERSONA ]

-- PK 1
ALTER TABLE RED_SOCIAL_ES_USADA_POR_PERSONA
    ADD CONSTRAINT FK_RED_SOCIAL_ES_USADA_POR_PERSONA_RED_SOCIAL_Cod_red_social
    FOREIGN KEY (Cod_red_social)
    REFERENCES RED_SOCIAL (Codigo)
    ON UPDATE CASCADE
GO

-- PK 2

ALTER TABLE RED_SOCIAL_ES_USADA_POR_PERSONA
    ADD CONSTRAINT FK_RED_SOCIAL_ES_USADA_POR_PERSONA_PERSONA_Cod_persona
    FOREIGN KEY (Cod_persona)
    REFERENCES PERSONA (Codigo)
    ON UPDATE CASCADE
GO

-- [ NARRADOR PARTIDA PARTIDA ]

-- [FK FOR FIRST PK]

ALTER TABLE NARRADOR_NARRA_PARTIDA
    ADD CONSTRAINT FK_NARRADOR_NARRA_PARTIDA_NARRADOR_Cod_narrador
    FOREIGN KEY (Cod_narrador)
    REFERENCES NARRADOR (Cod_narrador)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE NARRADOR_NARRA_PARTIDA
    ADD CONSTRAINT FK_NARRADOR_NARRA_PARTIDA_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO

-- [ JUGADOR TIENE RENDIMIENTO EN PARTIDA ]

-- [FK FOR FIRST PK]

ALTER TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA
    ADD CONSTRAINT FK_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_JUGADOR_Cod_jugador
    FOREIGN KEY (Cod_jugador)
    REFERENCES JUGADOR (Cod_jugador)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA
    ADD CONSTRAINT FK_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO

-- [ ROL TIENE RECOMENDADO PERSONAJE ]

-- [FK FOR FIRST PK]

ALTER TABLE ROL_TIENE_RECOMENDADO_PERSONAJE
    ADD CONSTRAINT FK_ROL_TIENE_RECOMENDADO_PERSONAJE_ROL_ROL_Cod_rol
    FOREIGN KEY (Cod_rol)
    REFERENCES ROL (Codigo)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE ROL_TIENE_RECOMENDADO_PERSONAJE
    ADD CONSTRAINT FK_ROL_TIENE_RECOMENDADO_PERSONAJE_ROL_PERSONAJE_Cod_personaje
    FOREIGN KEY (Cod_personaje)
    REFERENCES PERSONAJE (Codigo)
    ON UPDATE CASCADE
GO

-- [ PERSONAJE TIENE RECOMENDADO OBJETO ]

-- [FK FOR FIRST PK]

ALTER TABLE PERSONAJE_TIENE_RECOMENDADO_OBJETO
    ADD CONSTRAINT FK_PERSONAJE_TIENE_RECOMENDADO_OBJETO_PERSONAJE_Cod_personaje
    FOREIGN KEY (Cod_personaje)
    REFERENCES PERSONAJE (Codigo)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE PERSONAJE_TIENE_RECOMENDADO_OBJETO
    ADD CONSTRAINT FK_PERSONAJE_TIENE_RECOMENDADO_OBJETO_Cod_objeto
    FOREIGN KEY (Cod_objeto)
    REFERENCES OBJETO (Codigo)
    ON UPDATE CASCADE
GO

-- [ OBJETO TIENE COMO PRERREQUISITO OBJETO ]

-- [FK FOR FIRST PK]

ALTER TABLE OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO
    ADD CONSTRAINT FK_OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO_OBJETO_Cod_objeto_tiene_prerrequisito
    FOREIGN KEY (Cod_objeto_tiene_prerrequisito)
    REFERENCES OBJETO (Codigo)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO
    ADD CONSTRAINT FK_OBJETO_TIENE_COMO_PRERREQUISITO_OBJETO_OBJETO_Cod_objeto_es_prerrequisito_de
    FOREIGN KEY (Cod_objeto_es_prerrequisito_de)
    REFERENCES OBJETO (Codigo)
    ON UPDATE NO ACTION
GO

-- [ OBJETIVO SE CUMPLE EN PARTIDA ]

-- [FK FOR FIRST PK]

ALTER TABLE PARTIDA_TIENE_OBJETIVO_CUMPLIDO
    ADD CONSTRAINT FK_PARTIDA_TIENE_OBJETIVO_CUMPLIDO_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO

-- [FK FOR SECOND PK]

ALTER TABLE PARTIDA_TIENE_OBJETIVO_CUMPLIDO
    ADD CONSTRAINT FK_PARTIDA_TIENE_OBJETIVO_CUMPLIDO_OBJETIVO_Cod_objetivo
    FOREIGN KEY (Cod_objetivo)
    REFERENCES OBJETIVO (Codigo)
    ON UPDATE CASCADE
GO

-- *------------*
-- |  N : M : P |
-- *------------*

-- [ JUGADOR JUEGA EN PARTIDA CON PERSONAJE ]

-- [ PK 1 ]
ALTER TABLE JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE
    ADD CONSTRAINT FK_JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE_JUGADOR_Cod_jugador
    FOREIGN KEY (Cod_jugador)
    REFERENCES JUGADOR (Cod_jugador)
    ON UPDATE CASCADE
GO
-- [ PK 2 ]
ALTER TABLE JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE
    ADD CONSTRAINT FK_JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO
-- [ PK 3 ]
ALTER TABLE JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE
    ADD CONSTRAINT FK_JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE_PERSONAJE_Cod_personaje
    FOREIGN KEY (Cod_personaje)
    REFERENCES PERSONAJE (Codigo)
    ON UPDATE CASCADE
GO

-- PERSONAJE COMPRA OBJETO EN PARTIDA

-- [ PK 1 ] 
ALTER TABLE PERSONAJE_COMPRA_OBJETO_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_COMPRA_OBJETO_EN_PARTIDA_PERSONAJE_Cod_personaje
    FOREIGN KEY (Cod_personaje)
    REFERENCES PERSONAJE (Codigo)
    ON UPDATE CASCADE
GO

-- [ PK 2 ]
ALTER TABLE PERSONAJE_COMPRA_OBJETO_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_COMPRA_OBJETO_EN_PARTIDA_OBJETO_Cod_objeto
    FOREIGN KEY (Cod_objeto)
    REFERENCES OBJETO (Codigo)
    ON UPDATE CASCADE
GO

-- [ PK 3 ]
ALTER TABLE PERSONAJE_COMPRA_OBJETO_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_COMPRA_OBJETO_EN_PARTIDA_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO

-- PERSONAJE USA RUNA EN PARTIDA

-- [ PK 1 ]
ALTER TABLE PERSONAJE_USA_RUNA_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_USA_RUNA_EN_PARTIDA_PERSONAJE_Cod_personaje
    FOREIGN KEY (Cod_personaje)
    REFERENCES PERSONAJE (Codigo)
    ON UPDATE CASCADE
GO

-- [ PK 2 ]
ALTER TABLE PERSONAJE_USA_RUNA_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_USA_RUNA_EN_PARTIDA_RUNA_Cod_runa
    FOREIGN KEY (Cod_runa)
    REFERENCES RUNA (Codigo)
    ON UPDATE CASCADE
GO

-- [ PK 3 ]

ALTER TABLE PERSONAJE_USA_RUNA_EN_PARTIDA
    ADD CONSTRAINT FK_PERSONAJE_USA_RUNA_EN_PARTIDA_PARTIDA_Cod_partida
    FOREIGN KEY (Cod_partida)
    REFERENCES PARTIDA (Codigo)
    ON UPDATE CASCADE
GO

-- *--------------------*
-- | UNIQUE CONSTRAINTS |
-- *--------------------*

-- [ PERSONA ]
 ALTER TABLE PERSONA
 ADD CONSTRAINT UQ_PERSONA_tipo_doc_num_doc UNIQUE (Tipo_doc,Num_doc)
 GO

-- [ RED SOCIAL]

ALTER TABLE RED_SOCIAL
ADD CONSTRAINT UQ_RED_SOCIAL_Nombre UNIQUE (Nombre)
GO

-- [ PAIS ]
ALTER TABLE PAIS
ADD CONSTRAINT UQ_PAIS_Nombre UNIQUE (Nombre)
GO
-- [ CELEBRIDAD ]

ALTER TABLE CELEBRIDAD
ADD CONSTRAINT UQ_CELEBRIDAD_alias UNIQUE (alias)
GO
-- [ EQUIPO ]

ALTER TABLE EQUIPO
ADD CONSTRAINT UQ_EQUIPO_Nombre UNIQUE (Nombre)
GO

-- [ REGION ]
ALTER TABLE REGION
ADD CONSTRAINT UQ_REGION_Nombre UNIQUE (Nombre)
GO

-- [ ROL ]

ALTER TABLE ROL
ADD CONSTRAINT UQ_ROL_Nombre UNIQUE (Nombre)
GO

-- [ PERSONAJE ]

ALTER TABLE PERSONAJE
ADD CONSTRAINT UQ_PERSONAJE_Nombre UNIQUE (Nombre) 
GO

-- [ OBJETO ]

ALTER TABLE OBJETO
ADD CONSTRAINT UQ_OBJETO_Nombre UNIQUE (Nombre)
GO

-- [ RUNA ]

ALTER TABLE RUNA
ADD CONSTRAINT UQ_RUNA_Nombre UNIQUE (Nombre),
CONSTRAINT UQ_RUNA_Descripcion UNIQUE (Descripcion)
GO

-- [ OBJETIVO -- DRAGON ]

ALTER TABLE DRAGON
ADD CONSTRAINT UQ_DRAGON_Elemento UNIQUE (Elemento)
GO

-- *------------------*
-- | CHK Constraints  |
-- *------------------*

-- Validación de campos TIPO.

-- [ PERSONA ] - TIPOS:
-- - CELEB: Celebridades.
-- - RTEMP: Emplado de Riot.
-- - EQEMP: Empleado de Equipo.
-- - OTHER: Otro, Que no necesariamente es alguna de estas categorias más importantes.

ALTER TABLE PERSONA
ADD CONSTRAINT CHK_PERSONA_TIPO CHECK (Tipo_persona in ('CELEB', 'RTEMP', 'EQEMP', 'OTHER')) ;
GO

-- [ EMPLEADO DE EQUIPO ] - TIPOS:
-- - PLYER: Jugadores que juegan en partidas
-- - COACH: Entrenadores. 
-- - OTHER: Otros. 
-- NOTA: Se podria incluir un campo llamado "BOTH" para el caso de Coach+Jugador. 

ALTER TABLE EMPLEADO_DE_EQUIPO
ADD CONSTRAINT CHK_EMPLEADO_DE_EQUIPO_TIPO CHECK (Tipo in ('PLYER', 'COACH', 'OTHER'));
GO

-- [ EMPLEADO DE RIOT ] - TIPOS:
-- - CASTR: Narrador.
-- - OTHER: Otros.

ALTER TABLE EMPLEADO_DE_RIOT
ADD CONSTRAINT CHK_EMPLEADO_DE_RIOT_TIPO CHECK (Tipo in ('CASTR', 'OTHER'));
GO

-- [ OBJETIVO ] - TIPOS
-- - DRAKE: Dragón.
-- - STRUC: Estructuras.
-- - BARON: Baron nashor. En el EERR esta definido como parcial excluyente. El baron nashor no tiene más que tipo distintivo
ALTER TABLE OBJETIVO
ADD CONSTRAINT CHK_OBJETIVO_TIPO CHECK (Tipo in ('DRAKE', 'STRUC', 'BARON'));
GO

-- OTROS CHK

-- Restringir Roles a los presentes en el juego:
ALTER TABLE ROL
ADD CONSTRAINT CHK_ROL_Codigo CHECK (Codigo in ('TOP', 'JG', 'MID', 'BOT', 'SUPP'));
GO

-- RESTRINGIR Campos de lado a B | R

ALTER TABLE EQUIPO_JUEGA_EN_PARTIDA
ADD CONSTRAINT CHK_EQUIPO_JUEGA_EN_PARTIDA_LADO_EN_EL_QUE_JUEGA CHECK (Lado_en_el_que_juega in ('B','R'));
GO
-- Parece información redundante podria ser obtenida con Joins pero si son muchos joins seria malo?
ALTER TABLE JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE
ADD CONSTRAINT CHK_JUGADOR_JUEGA_EN_PARTIDA_CON_PERSONAJE_LADO CHECK (Lado in ('B', 'R'));
GO

ALTER TABLE PARTIDA_TIENE_OBJETIVO_CUMPLIDO
ADD CONSTRAINT CHK_PARTIDA_TIENE_OBJETIVO_CUMPLIDO_LADO CHECK (Lado_donde_se_cumple in ('B','R'));
GO

-- RESTRINGIR VALOR DE SERIE EN PARTIDA A S | N

ALTER TABLE PARTIDA
ADD CONSTRAINT CHK_PARTIDA_SERIE CHECK (serie in ('S','N'));
GO

-- VALIDAR FECHAS PARA QUE NO PUEDAN SER ANTES DE LO PREVISTO
-- Could be done with AND. This seems cleaner IMO
ALTER TABLE PARTIDA
ADD CONSTRAINT CHK_PARTIDA_FECHA_INICIO CHECK  (Fecha_Hora_inicio > Fecha_Hora_prevista),
    CONSTRAINT CHK_PARTIDA_FECHA_FIN CHECK (Fecha_Hora_inicio < Fecha_Hora_fin)
GO

-- PRECIO DE LOS OBJETOS NO PUEDE SER NEGATIVO

ALTER TABLE OBJETO
ADD CONSTRAINT CHK_OBJETOS_PRECIO CHECK (Precio >= 0);
GO

-- Nivel de las estructuras Solo puede llegar a 3. Estructuras puede dar a confusión entre
-- Torretas, nexos e inhibidores. Es probable que sea mejor separarlos si se quiere seguir con 
-- el proyecto.

ALTER TABLE ESTRUCTURA
ADD CONSTRAINT CHK_ESTRUCTURA_NIVEL CHECK (Nivel < 3 AND Nivel > 0);
GO

-- [ TIENE RENDIMIENTO EN ]
-- Oro debe ser minimo 500. Todos los jugadores empiezan la partida con 500 de oro.
-- Muchos de los negativos ya estan resguardados por tinyInt. Pero el conteo de subditos puede
-- superar 256 y no debe ser negativo. Todo lo demás es improbable que llegue siquiera cerca de dicho
-- máximo

ALTER TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA
ADD CONSTRAINT CHK_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_ORO CHECK (Oro_total_obtenido > 500);
GO

ALTER TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA
ADD CONSTRAINT CHK_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_PUNTUACION_DE_SUBDITOS CHECK (Puntuacion_de_subditos >= 0);
GO

-- *---------------------*
-- | DEFAULT CONSTRAINTS |
-- *---------------------*

-- [ JUGADOR TIENE RENDIMIENTO EN PARTIDA ]
ALTER TABLE JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA
ADD CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Puntuacion_de_vision  DEFAULT (0) FOR Puntuacion_de_vision,
    CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Puntuacion_de_subditos  DEFAULT (0) FOR Puntuacion_de_subditos,
    CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Asesinatos  DEFAULT (0) FOR Asesinatos,
    CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Muertes DEFAULT (0) FOR Muertes,
    CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Asistencias DEFAULT (0) FOR Asistencias,
    CONSTRAINT DF_JUGADOR_TIENE_RENDIMIENTO_EN_PARTIDA_Oro_total_obtenido DEFAULT (0) FOR Oro_total_obtenido
GO

-- DEFAULT PARA TIPOS --
-- Todos los default para tipos iran a OTHER a poder ser.

-- [ PERSONA ]
ALTER TABLE PERSONA
ADD CONSTRAINT DF_PERSONA_TIPO  DEFAULT ('OTHER') FOR Tipo_persona
GO

-- [ EMPLEADO DE EQUIPO ]
ALTER TABLE EMPLEADO_DE_EQUIPO
ADD CONSTRAINT DF_EMPLEADO_DE_EQUIPO_TIPO  DEFAULT ('OTHER') FOR Tipo
GO

-- [ EMPLEADO DE RIOT ]
ALTER TABLE EMPLEADO_DE_RIOT
ADD CONSTRAINT DF_EMPLEADO_DE_RIOT_Tipo  DEFAULT ('OTHER') FOR Tipo
GO

-- [ OBJETIVO ]

ALTER TABLE OBJETIVO
ADD CONSTRAINT DF_OBJETIVO_Tipo  DEFAULT ('BARON') FOR Tipo
GO


-- ╭====================╮
-- │ Fin de la creación │ Me aburro mucho. :)
-- ╰--------------------╯

-- ╭================================╮
-- │ Inicio de la creación de datos │
-- ╰―-------------------------------╯
-- Nota alguno de los datos seran ficticios. ya que seria dificil conocer la direccion de empleados de riot
-- O de jugadores. No que no se pueda, pero quizá constituiria una violacion a la privacidad que es innecesaria



-- [PERSONAJES]
BEGIN TRANSACTION
INSERT INTO PERSONAJE (Codigo, Nombre) VALUES
(1, 'Aatrox'),(2, 'Ahri'),(3, 'Akali'), (4, 'Alistar'),(5, 'Amumu'),(6, 'Anivia'),(7, 'Annie'),(8, 'Aphelios'),(9, 'Ashe'),(10, 'Aurelion Sol'),
(11, 'Azir'),(12, 'Bard'),(13, 'Blitzcrank'),(14, 'Brand'),(15, 'Braum'),(16, 'Caitlyn'),(17, 'Camille'),(18, 'Cassiopeia'),(19, 'Cho''Gath'),(20, 'Corki'),
(21, 'Darius'),(22, 'Diana'),(23, 'Dr. Mundo'),(24, 'Draven'),(25, 'Ekko'),(26, 'Elise'),(27, 'Evelynn'),(28, 'Ezreal'),(29, 'Fiddlesticks'),(30, 'Fiora'),
(31, 'Fizz'),(32, 'Galio'),(33, 'Gangplank'),(34, 'Garen'),(35, 'Gnar'),(36, 'Gragas'),(37, 'Graves'),(38, 'Gwen'),(39, 'Hecarim'),(40, 'Heimerdinger'),
(41, 'Illaoi'),(42, 'Irelia'),(43, 'Ivern'),(44, 'Janna'),(45, 'Jarvan IV'),(46, 'Jax'),(47, 'Jayce'),(48, 'Jhin'),(49, 'Jinx'),(50, 'Kai''Sa'),
(51, 'Kalista'),(52, 'Karma'),(53, 'Karthus'),(54, 'Kassadin'),(55, 'Katarina'),(56, 'Kayle'),(57, 'Kayn'),(58, 'Kennen'),(59, 'Kha''Zix'),(60, 'Kindred'),
(61, 'Kled'),(62, 'Kog''Maw'),(63, 'LeBlanc'),(64, 'Lee Sin'),(65, 'Leona'),(66, 'Lillia'),(67, 'Lissandra'),(68, 'Lucian'),(69, 'Lulu'),(70, 'Lux'),
(71, 'Malphite'),(72, 'Malzahar'),(73, 'Maokai'),(74, 'Master Yi'),(75, 'Miss Fortune'),(76, 'Mordekaiser'),(77, 'Morgana'),(78, 'Nami'),(79, 'Nasus'),(80, 'Nautilus'),
(81, 'Neeko'),(82, 'Nidalee'),(83, 'Nocturne'),(84, 'Nunu & Willump'),(85, 'Olaf'),(86, 'Orianna'),(87, 'Ornn'),(88, 'Pantheon'),(89, 'Poppy'),(90, 'Pyke'),
(91, 'Qiyana'),(92, 'Quinn'),(93, 'Rakan'),(94, 'Rammus'),(95, 'Rek''Sai'),(96, 'Rell'),(97, 'Renekton'),(98, 'Rengar'),(99, 'Riven'),(100, 'Rumble'),
(101, 'Ryze'),(102, 'Samira'),(103, 'Sejuani'),(104, 'Senna'),(105, 'Seraphine'),(106, 'Sett'),(107, 'Shaco'),(108, 'Shen'),(109, 'Shyvana'),(110, 'Singed'),
(111, 'Sion'),(112, 'Sivir'),(113, 'Skarner'),(114, 'Sona'),(115, 'Soraka'),(116, 'Swain'),(117, 'Sylas'),(118, 'Syndra'),(119, 'Tahm Kench'),(120, 'Taliyah'),
(121, 'Talon'),(122, 'Taric'),(123, 'Teemo'),(124, 'Thresh'),(125, 'Tristana'),(126, 'Trundle'),(127, 'Tryndamere'),(128, 'Twisted Fate'),(129, 'Twitch'),(130, 'Udyr'),
(131, 'Urgot'),(132, 'Varus'),(133, 'Vayne'),(134, 'Veigar'),(135, 'Vel''Koz'),(136, 'Vi'),(137, 'Viego'),(138, 'Viktor'),(139, 'Vladimir'),(140, 'Volibear'),(141, 'Warwick'),(142, 'Wukong'),(143, 'Xayah'),(144, 'Xerath'),(145, 'Xin Zhao'),(146, 'Yasuo'),(147, 'Yone'),(148, 'Yorick'),(149, 'Yuumi'),(150, 'Zac'),
(151, 'Zed'),(152, 'Ziggs'),(153, 'Zilean'),(154, 'Zoe'),(155, 'Zyra');
IF @@ERROR != 0 ROLLBACK 
COMMIT

-- [ ROL ] 
BEGIN TRAN
INSERT INTO ROL (Codigo, Nombre) VALUES
('TOP', 'Carril superior'),
('BOT', 'Carril inferior'),
('SUPP', 'Soporte'),
('JG', 'Jungla'),
('MID', 'Carril medio')
IF @@ERROR != 0 ROLLBACK 
COMMIT

-- [ OBJETOS ] GOD BLESS ARTIFICIAL INTELLIGENCE. GOD OR THE ONE WHO BUILT IT. La lista esta en inglés porque me rehuso a escribir 130
-- Objetos y las IA en español no les va muy bien. :(
BEGIN TRAN
INSERT INTO OBJETO (codigo, nombre, precio)  VALUES
(1, 'Abyssal Mask', 3000),
(2, 'Adaptive Helm', 2800),
(3, 'Aegis of the Legion', 1500),
(4, 'Amplifying Tome', 435),
(5, 'Ancient Coin', 350),
(6, 'Archangel''s Staff', 3200),
(7, 'Ardent Censer', 2300),
(8, 'B. F. Sword', 1300),
(9, 'Bami''s Cinder', 1000),
(10, 'Banshee''s Veil', 3000),
(11, 'Berserker''s Greaves', 1100),
(12, 'Bilgewater Cutlass', 1600),
(13, 'Blade of the Ruined King', 3300),
(14, 'Blasting Wand', 850),
(15, 'Bloodthirster', 3500),
(16, 'Boots of Mobility', 1000),
(17, 'Boots of Swiftness', 900),
(18, 'Bramble Vest', 800),
(19, 'Catalyst of Aeons', 1100),
(20, 'Caulfield''s Warhammer', 1100),
(21, 'Chain Vest', 800),
(22, 'Chalice of Harmony', 800),
(23, 'Cloak of Agility', 600),
(24, 'Cloth Armor', 300),
(25, 'Control Ward', 75),
(26, 'Corrupting Potion', 500),
(27, 'Crown of the Shattered Queen', 2800),
(28, 'Crystalline Bracer', 650),
(29, 'Cull', 450),
(30, 'Dark Seal', 350),
(31, 'Dead Man''s Plate', 2900),
(32, 'Death''s Dance', 3300),
(33, 'Demonic Embrace', 3000),
(34, 'Doran''s Blade', 450),
(35, 'Doran''s Ring', 400),
(36, 'Doran''s Shield', 450),
(37, 'Duskblade of Draktharr', 3100),
(38, 'Edge of Night', 2900),
(39, 'Elixir of Iron', 500),
(40, 'Elixir of Sorcery', 500),
(41, 'Elixir of Wrath', 500),
(42, 'Essence Reaver', 2900),
(43, 'Everfrost', 2800),
(44, 'Executioner''s Calling', 800),
(45, 'Farsight Alteration', 0),
(46, 'Fiendish Codex', 900),
(47, 'Fimbulwinter', 2600),
(48, 'Frostfire Gauntlet', 3200),
(49, 'Frozen Heart', 2700),
(50, 'Frozen Mallet', 3100),
(51, 'Galeforce', 3400),
(52, 'Gargoyle Stoneplate', 3200),
(53, 'Giant''s Belt', 900),
(54, 'Glacial Buckler', 900),
(55, 'Guardian Angel', 2800),
(56, 'Guinsoo''s Rageblade', 3200),
(57, 'Hailblade', 350),
(58, 'Health Potion', 50),
(59, 'Hexdrinker', 1300),
(60, 'Hextech Alternator', 1050),
(61, 'Hextech Rocketbelt', 3200),
(62, 'Horizon Focus', 3000),
(63, 'Hullbreaker', 2800),
(64, 'Immortal Shieldbow', 3400),
(65, 'Imperial Mandate', 2500),
(66, 'Infinity Edge', 3400),
(67, 'Ionian Boots of Lucidity', 900),
(68, 'Kraken Slayer', 3400),
(69, 'Leeching Leer', 1300),
(70, 'Lich Bane', 3200),
(71, 'Liandry''s Anguish', 3400),
(72, 'Locket of the Iron Solari', 2500),
(73, 'Lord Dominik''s Regards', 3000),
(74, 'Luden''s Tempest', 3200),
(75, 'Manamune', 2900),
(76, 'Maw of Malmortius', 2800),
(77, 'Mejai''s Soulstealer', 1600),
(78, 'Mercurial Scimitar', 3000),
(79, 'Mercury''s Treads', 1100),
(80, 'Moonstone Renewer', 2500),
(81, 'Mortal Reminder', 2700),
(82, 'Morellonomicon', 2500),
(83, 'Muramana', 2900),
(84, 'Nashor''s Tooth', 3200),
(85, 'Night Harvester', 3200),
(86, 'Ninja Tabi', 1100),
(87, 'Navori Quickblades', 3400),
(88, 'Oblivion Orb', 800),
(89, 'Phantom Dancer', 2900),
(90, 'Prowler''s Claw', 3100),
(91, 'Quicksilver Sash', 1300),
(92, 'Rabadon''s Deathcap', 3600),
(93, 'Randuin''s Omen', 2700),
(94, 'Rapid Firecannon', 2500),
(95, 'Redemption', 2300),
(96, 'Rejuvenation Bead', 150),
(97, 'Riftmaker', 3200),
(98, 'Righteous Glory', 2600),
(99, 'Rod of Ages', 2600),
(100, 'Runaan''s Hurricane', 2600),
(101, 'Rylai''s Crystal Scepter', 3000),
(102, 'Seraph''s Embrace', 3200),
(103, 'Serylda''s Grudge', 3200),
(104, 'Shadowflame', 3000),
(105, 'Shard of True Ice', 400),
(106, 'Shurelya''s Battlesong', 2500),
(107, 'Silvermere Dawn', 3000),
(108, 'Spirit Visage', 2900),
(109, 'Staff of Flowing Water', 2300),
(110, 'Sterak''s Gage', 3100),
(111, 'Stridebreaker', 3300),
(112, 'Sunfire Aegis', 3200),
(113, 'Tear of the Goddess', 400),
(114, 'The Collector', 3000),
(115, 'Thornmail', 2700),
(116, 'Titanic Hydra', 3300),
(117, 'Trinity Force', 3333),
(118, 'Turbo Chemtank', 3200),
(119, 'Umbral Glaive', 2400),
(120, 'Vampiric Scepter', 900),
(121, 'Verdant Barrier', 1200),
(122, 'Void Staff', 2800),
(123, 'Warmog''s Armor', 3000),
(124, 'Watchful Wardstone', 1100),
(125, 'Winter''s Approach', 2600),
(126, 'Wit''s End', 3100),
(127, 'Youmuu''s Ghostblade', 3000),
(128, 'Zeke''s Convergence', 2400),
(129, 'Zhonya''s Hourglass', 2600) -- 1000 Lineas :D. AYUDA.
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

-- [ RUNAS ]
BEGIN TRAN
INSERT INTO RUNA (codigo, nombre, descripcion, Categoria)  VALUES 
(1, 'Electrocutar', 'Golpear a un campeón con 3 ataques o habilidades separadas en 3 segundos inflige daño adaptativo adicional.', 'Dominacion'),
(2, 'Depredador', 'Encanta tus botas con el efecto activo "Depredador".', 'Dominacion'),
(3, 'Cosecha oscura', 'Infligir daño a un campeón por debajo del 50% de salud inflige daño adaptativo y cosecha su alma, aumentando permanentemente el daño de Cosecha Oscura en 5.', 'Dominacion'),
(4, 'Granizo de cuchillas', 'Gana una gran cantidad de velocidad de ataque para los primeros 3 ataques contra campeones enemigos.', 'Dominacion'),
(5, 'Golpe bajo', 'Inflige daño verdadero adicional a los campeones enemigos con movimiento o acciones impedidos.','Dominacion'),
(6, 'Sabor a sangre', 'Cura cuando dañas a un campeón enemigo.', 'Dominacion'),
(7, 'Impacto repentino', 'Obtén una ráfaga de letalidad y penetración mágica después de usar un dash, salto, parpadeo, teletransporte o al salir del sigilo.','Dominacion'),
(8, 'Centinela fantasma', 'Cuando tus wards expiran, dejan atrás un Centinela fantasma, que otorga visión durante un corto período.','Dominacion'),
(9, 'Poro fantasma', 'Cuando tus wards expiran, dejan atrás un Poro fantasma, que otorga visión durante un corto período.','Dominacion'),
(10, 'Colección de ojos', 'Colecciona ojos por eliminaciones de campeones y wards. Obtén DA o PA permanentes, adaptativos para cada ojo más un bono al completar la colección.', 'Dominacion'),
(11, 'Cazador voraz', 'Las eliminaciones únicas otorgan curación permanente del daño de habilidad.', 'Dominacion'),
(12, 'Cazador ingenioso', 'Las eliminaciones de campeones únicas otorgan Reducción de Enfriamiento de Objetos Activos permanente (incluidos los tótems).','Dominacion'),
(13, 'Cazador implacable', 'Las eliminaciones únicas de campeones otorgan MS permanente fuera de combate.','Dominacion'),
(14, 'Cazador definitivo', 'Las eliminaciones únicas de campeones otorgan reducción permanente del enfriamiento de tu habilidad definitiva.','Dominacion'),
(15, 'Invocar aery', 'Tus ataques y habilidades envían a Aery a un objetivo, dañando a los enemigos o escudando a los aliados.','Brujeria'),
(16, 'Cometa arcano', 'Infligir daño a un campeón con una habilidad arroja un cometa a su ubicación, o si Cometa Arcano está en enfriamiento, reduce su tiempo restante de enfriamiento.','Brujeria'),
(17, 'Ráfaga de fase', 'Golpear a un campeón enemigo con 3 ataques o habilidades separadas dentro de 3 segundos otorga una ráfaga de MS.', 'Brujeria'),
(18, 'Aguante del no muerto', 'Cada 4s en combate, tu próximo ataque contra un campeón infligirá daño adicional, te curará y aumentará permanentemente tu salud.', 'Valor'),
(19, 'Escudo de hueso', 'Después de inmovilizar a un campeón enemigo, aumenta tu armadura y resistencia mágica.', 'Valor'),
(20, 'Guardián', 'Protege a los aliados dentro de 175 unidades de ti y a los aliados a los que apuntas con hechizos durante 2.5s. Mientras guardas, si tú o el aliado reciben daño, ambos ganan un escudo y se aceleran durante 1.5s.', 'Valor'),
(21, 'Libro de hechizos no sellado', 'Obtén un nuevo Hechizo de Invocador cada 6s. Cambia uno de tus Hechizos de Invocador equipados por un nuevo Hechizo de Invocador de un solo uso.', 'Inspiracion'),
(22, 'Aumento glacial', 'Los ataques básicos a un campeón lo ralentizan durante 2s. La ralentización aumenta en fuerza durante su duración.','Inspiracion'),
(23, 'Kleptomanía', 'Después de usar una habilidad, tu próximo ataque otorga oro adicional y a veces consumibles.','Inspiracion'),
(24, 'Flashtrampa de hextech', 'Mientras Flash esté en enfriamiento, se reemplaza por Destello de Hextech.','Inspiracion'),
(25, 'Calzado mágico', 'Obtienes botas gratis a los 12 min, pero no puedes comprar botas antes. Cada eliminación que obtengas hace que tus botas lleguen 45s antes.','Inspiracion'),
(26, 'Temporizador perfecto', 'Comienza el juego con un Cronómetro que se transforma en un Cronómetro después de 14 minutos. El Cronómetro tiene un efecto de Estasis de un solo uso.','Inspiracion'),
(27, 'Mercado del futuro', 'Puedes entrar en deuda para comprar objetos. La cantidad que puedes pedir prestada aumenta con el tiempo.','Inspiracion'),
(28, 'Desmaterializador de súbditos', 'Comienza el juego con 6 Desmaterializadores de súbditos que eliminan e absorben instantáneamente los súbditos de la línea. Los Desmaterializadores de súbditos están en enfriamiento durante los primeros 180s del juego.','Inspiracion'),
(29, 'Entrega de galletas', 'Obtén una Galleta de la Eternidad total cada 3 minutos, hasta los 12 min. Las galletas restauran vida y maná. Consumir cualquier galleta aumenta permanentemente tu límite de maná en 40.','Inspiracion'),
(30, 'Perspicacia cósmica', 'Otorga reducción de enfriamiento y aumenta la velocidad a la que ganas experiencia y oro.','Inspiracion'),
(31, 'Velocidad de aproximación', 'Obtén MS adicional hacia aliados cercanos que estén controlados por CC o hacia enemigos a los que controles con CC.','Inspiracion'),
(32, 'Tónico de distorsión temporal', 'Tus pociones, galletas y elixires duran un 20% más y ganas un 5% de Velocidad de Movimiento mientras estás bajo sus efectos.','Inspiracion');
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

BEGIN TRAN
INSERT INTO PAIS (Codigo, Nombre) VALUES
(1, 'Korea'),
(2, 'Japan'),
(3, 'China'),
(4, 'USA'),
(5, 'Canada'),
(6, 'Mexico'),
(7, 'Brazil'),
(8, 'Argentina'),
(9, 'United Kingdom'),
(10, 'France'),
(11, 'Germany'),
(12, 'Spain'),
(13, 'Italy'),
(14, 'Russia'),
(15, 'Australia'),
(16, 'India'),
(17, 'South Africa'),
(18, 'Egypt'),
(19, 'Turkey'),
(20, 'Saudi Arabia'),
(21, 'Indonesia'),
(22, 'Thailand'),
(23, 'Vietnam'),
(24, 'Malaysia'),
(25, 'Philippines'),
(26, 'Singapore'),
(27, 'New Zealand'),
(28, 'Pakistan'),
(29, 'Bangladesh'),
(30, 'Nigeria'),
(31, 'Kenya'),
(32, 'Morocco'),
(33, 'Algeria'),
(34, 'Peru'),
(35, 'Chile'),
(36, 'Colombia'),
(37, 'Venezuela'),
(38, 'Poland'),
(39, 'Netherlands'),
(40, 'Belgium'),
(41, 'Sweden'),
(42, 'Norway'),
(43, 'Denmark'),
(44, 'Finland'),
(45, 'Switzerland'),
(46, 'Austria'),
(47, 'Greece'),
(48, 'Portugal'),
(49, 'Ireland'),
(50, 'Iceland');
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

BEGIN TRAN
INSERT INTO DIVISION_TERRITORIAL (Codigo, Nombre, Tipo, Cod_pais) VALUES
(1, 'California', 'State', 4), -- USA
(2, 'Ontario', 'Province', 5), -- Canada
(3, 'Île-de-France', 'Region', 10), -- France
(4, 'Los Angeles County', 'County', 4), -- USA
(5, 'Central District', 'District', 12), -- Spain
(6, 'Tokyo', 'Prefecture', 2), -- Japan
(7, 'Beijing', 'Municipality', 3), -- China
(8, 'Greater London', 'Region', 9), -- United Kingdom
(9, 'Queens', 'Borough', 4), -- USA
(10, 'Hokkaido', 'Prefecture', 2), -- Japan
(11, 'Texas', 'State', 4), -- USA
(12, 'Quebec', 'Province', 5), -- Canada
(13, 'Bavaria', 'Province', 11), -- Germany
(14, 'Hamburg', 'Municipality', 11), -- Germany
(15, 'Catalonia', 'Region', 12), -- Spain
(16, 'Manchester', 'City', 9), -- United Kingdom
(17, 'Nairobi', 'City', 31), -- Kenya
(18, 'Sydney', 'Municipality', 15), -- Australia
(19, 'Wellington', 'City', 27), -- New Zealand
(20, 'Flanders', 'Province', 40), -- Belgium
(21, 'Scotland', 'Region', 9), -- United Kingdom
(22, 'Cairo', 'City', 18), -- Egypt
(23, 'Buenos Aires', 'Municipality', 8), -- Argentina
(24, 'Sao Paulo', 'Municipality', 7), -- Brazil
(25, 'New South Wales', 'State', 15), -- Australia
(26, 'Sicily', 'Region', 13), -- Italy
(27, 'Alberta', 'Province', 5), -- Canada
(28, 'Queensland', 'State', 15), -- Australia
(29, 'Moscow', 'Municipality', 14), -- Russia
(30, 'Lagos', 'City', 30), -- Nigeria
(31, 'Gauteng', 'Region', 17), -- South Africa
(32, 'Casablanca-Settat', 'Region', 32), -- Morocco
(33, 'La Paz', 'Municipality', 6), -- Mexico
(34, 'Tuscany', 'Region', 13), -- Italy
(35, 'Attica', 'Region', 47), -- Greece
(36, 'Andalusia', 'Region', 12), -- Spain
(37, 'Uttar Pradesh', 'State', 16), -- India
(38, 'Kanto', 'Region', 2), -- Japan
(39, 'Lima', 'Municipality', 34), -- Peru
(40, 'Jakarta', 'City', 21), -- Indonesia
(41, 'Bangkok', 'City', 22), -- Thailand
(42, 'Kuala Lumpur', 'City', 24), -- Malaysia
(43, 'Ho Chi Minh City', 'City', 23), -- Vietnam
(44, 'Seoul', 'Municipality', 1), -- Korea
(45, 'Riyadh', 'City', 20), -- Saudi Arabia
(46, 'Karachi', 'City', 28), -- Pakistan
(47, 'Dhaka', 'City', 29), -- Bangladesh
(48, 'Islamabad', 'City', 28), -- Pakistan
(49, 'Mexico City', 'City', 6), -- Mexico
(50, 'New York', 'City', 4); -- USA
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

BEGIN TRAN
INSERT INTO RED_SOCIAL (Codigo, Nombre) VALUES
(1, 'Facebook'),
(2, 'Twitter'),
(3, 'Instagram'),
(4, 'LinkedIn'),
(5, 'Snapchat'),
(6, 'TikTok'),
(7, 'Pinterest'),
(8, 'Reddit'),
(9, 'YouTube'),
(10, 'WhatsApp'),
(11, 'WeChat'),
(12, 'Tumblr'),
(13, 'Telegram'),
(14, 'VKontakte'),
(15, 'Quora'),
(16, 'Flickr'),
(17, 'Clubhouse'),
(18, 'Discord'),
(19, 'Line'),
(20, 'KakaoTalk');
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

BEGIN TRAN
INSERT INTO PERSONA (Codigo, Nombre, Apellido_1, Apellido_2, Fecha_nacimiento,
					Telefono_1, Telefono_2, Num_doc, Tipo_doc, Cod_division_territorial,
					Calle_direccion, TipoVia_direccion, Numero_direccion, Piso_direccion,
					Letra_direccion, Escalera_direccion, Tipo_Persona) VALUES
-- T1
(1, 'Lee', 'Sang', 'Hyeok', '1996-05-07', '555-0101', NULL, 'ID123456', 'DNI', 1, 'Faker Street', 'Calle', 123, 0, 'A', NULL, 'EQEMP'),
(2, 'Lee', 'Min', 'Hyeong', '2002-02-06', '555-0102', NULL, 'ID123457', 'DNI', 1, 'Gumayusi Street', 'Calle', 456, 0, NULL, NULL, 'EQEMP'),
(3, 'Lee', 'Gum', 'Jin', '2002-08-09', '555-0103', NULL, 'ID123458', 'DNI', 1, 'Teddy Street', 'Avenida', 789, 0, NULL, NULL, 'EQEMP'),
-- DRX
(4, 'Choi', 'Jun', 'Hyeong', '2000-11-15', '555-0201', NULL, 'ID123459', 'DNI', 2, 'Chovy Street', 'Calle', 101, 0, 'B', NULL, 'EQEMP'),
(5, 'Hong', 'Min', 'Ki', '2001-04-18', '555-0202', NULL, 'ID123460', 'DNI', 2, 'Deft Street', 'Avenida', 202, 0, NULL, NULL, 'EQEMP'),
(6, 'Kim', 'Dong', 'Bin', '2001-12-20', '555-0203', NULL, 'ID123461', 'DNI', 2, 'Doran Street', 'Calle', 303, 0, 'C', NULL, 'EQEMP'),
-- G2
(7, 'Martin', 'Larsson', NULL, '1996-11-20', '555-0301', NULL, 'ID123462', 'DNI', 3, 'Rekkles Street', 'Avenida', 404, 0, NULL, NULL, 'EQEMP'),
(8, 'Rasmus', 'Jankowski', NULL, '1995-07-08', '555-0302', NULL, 'ID123463', 'DNI', 3, 'Jankos Street', 'Calle', 505, 0, NULL, NULL, 'EQEMP'),
(9, 'Kristoffer', 'Borregaard ', NULL, '1998-04-15', '555-0303', NULL, 'ID123464', 'DNI', 3, 'Caps Street', 'Avenida', 606, 0, NULL, NULL, 'EQEMP'),
-- JDG
(10, 'Xuan-Jun', 'Li', NULL, '1997-10-25', '555-0401', NULL, 'ID123465', 'DNI', 4, 'Kanavi Street', 'Calle', 707, 0, NULL, NULL, 'EQEMP'),
(11, 'Wen-Jei', 'Xu', NULL, '1996-08-13', '555-0402', NULL, 'ID123466', 'DNI', 4, 'Loken Street', 'Calle', 808, 0, NULL, NULL, 'EQEMP'),
(12, 'Zeng', 'Qi', NULL, '1998-03-02', '555-0403', NULL, 'ID123467', 'DNI', 4, 'Yagao Street', 'Calle', 909, 0, NULL, NULL, 'EQEMP'),
-- Cloud9
(13, 'Blabber', 'Huang', NULL, '1999-09-30', '555-0501', NULL, 'ID123468', 'DNI', 5, 'Blaber Street', 'Avenida', 1010, 0, NULL, NULL, 'EQEMP'),
(14, 'Jonathan', 'Svenningsen', NULL, '1997-02-17', '555-0502', NULL, 'ID123469', 'DNI', 5, 'Zven Street', 'Calle', 1111, 0, NULL, NULL, 'EQEMP'),
-- CELEBS
(15, 'Michael', ' "Imaqtpie"', 'Santana', '1996-11-20' , '555-0601', NULL, 'ID123471', 'DNI', 6, 'Sunset Boulevard', 'Avenue', 1313, 0, NULL, NULL, 'CELEB'),
(16, 'Zachary', ' "Sneaky"', 'Scuderi', '1996-11-20', '555-0602', NULL, 'ID123472', 'DNI', 6, 'Main Street', 'Street', 1414, 0, NULL, NULL, 'CELEB'),
(17, 'Lee', ' "Faker"', 'Sang-hyeok', '1996-11-20', '555-0603', NULL, 'ID123473', 'DNI', 6, 'Broadway', 'Avenue', 1515, 0, NULL, NULL, 'CELEB'),
(18, 'Yiliang', ' "Doublelift"', 'Peng', '1996-11-20', '555-0604', NULL, 'ID123474', 'DNI', 6, 'Oak Avenue', 'Street', 1616, 0, NULL, NULL, 'CELEB'),
(19, 'Henrik', ' "Froggen"', 'Hansen', '1996-11-20', '555-0605', NULL, 'ID123475', 'DNI', 6, 'Pine Street', 'Avenue', 1717, 0, NULL, NULL, 'CELEB'),
--- CASTERS
(20, 'Rivington', 'Bisland', 'III', '1982-04-24', '555-0801', NULL, 'ID123481', 'DNI', 7, 'Caster Street', 'Avenue', 2323, 0, NULL, NULL, 'RTEMP'),
(21, 'David', 'Turley', NULL, '1984-07-16', '555-0802', NULL, 'ID123482', 'DNI', 7, 'Caster Avenue', 'Street', 2424, 0, NULL, NULL, 'RTEMP'),
(22, 'Sam', 'Hartman-Kenzler', NULL, '1988-06-08', '555-0803', NULL, 'ID123483', 'DNI', 7, 'Broadcaster Road', 'Avenue', 2525, 0, NULL, NULL, 'RTEMP'),
(23, 'Clayton', 'Raines', NULL, '1993-09-13', '555-0804', NULL, 'ID123484', 'DNI', 7, 'Casting Lane', 'Street', 2626, 0, NULL, NULL, 'RTEMP'),
(24, 'Isaac', 'Cummings Bentley', NULL, '1989-12-27', '555-0805', NULL, 'ID123485', 'DNI', 7, 'Caster Boulevard', 'Avenue', 2727, 0, NULL, NULL, 'RTEMP');
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO
-- 
-- help

BEGIN TRAN
INSERT INTO REGION(Codigo, Nombre) VALUES
('LCK', 'League of Legends Champions Korea'),
('LPL', 'League of Legends Pro League'),
('LEC', 'League of Legends European Championship'),
('LCS', 'League of Legends Championship Series'),
('PCS', 'Pacific Championship Series'),
('LCL', 'League of Legends Continental League'),
('CBLOL', 'Campeonato Brasileiro de League of Legends'),
('LLA', 'Liga Latinoamérica'),
('LJL', 'League of Legends Japan League'),
('TCL', 'Türkiye Kış Mevsimi'),
('VCS', 'Vietnam Championship Series');
IF @@ERROR != 0 ROLLBACK 
COMMIT
GO

BEGIN TRAN
INSERT INTO EQUIPO(Codigo, Nombre, Cod_region) VALUES
(1, 'Damwon Gaming', 'LCK'),
(2, 'FunPlus Phoenix', 'LPL'),
(3, 'G2 Esports', 'LEC'),
(4, 'Team Liquid', 'LCS'),
(5, 'Machi Esports', 'PCS'),
(6, 'Unicorns of Love', 'LCL'),
(7, 'INTZ', 'CBLOL'),
(8, 'Rainbow7', 'LLA'),
(9, 'DetonatioN FocusMe', 'LJL'),
(10, 'Galatasaray Esports', 'TCL'),
(11, 'GAM Esports', 'VCS'),
(12, 'T1', 'LCK'),
(13, 'DRX', 'LCK');
IF @@ERROR != 0 ROLLBACK 
COMMIT
-- Me rindo. No mas datos. No son ni de cerca todos pero yo no puedo mas. Si fuesen datos completos el script probablemente llegaria a 2000+ lineas

--USE MASTER
--DROP DATABASE LEAGUE_OF_LEGENDS_WORLD_CHAMPIONSHIP