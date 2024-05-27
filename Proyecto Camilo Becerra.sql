CREATE TABLE Persona (
    persona_id integer,
    PERIODO VARCHAR(10),
    TIPO_DNI VARCHAR(10),
    FECHA_NACIMIENTO VARCHAR(30),
    EDAD INTEGER,
    GRUPO_ETARIO VARCHAR(20),
    VINCULACION VARCHAR(20),
    GENERO CHAR(1),
    ESTRATO INTEGER,
    SNIES INTEGER,
    LUGAR VARCHAR(100),
    TIPO VARCHAR(20),
    LONGITUD FLOAT,
    LATITUD FLOAT,
    POB_VULNERABLE VARCHAR(100),
	PRIMARY KEY (persona_id)
);

CREATE TABLE Municipio (
    municipio_id INTEGER,
    COD_DANE INTEGER NOT NULL,
    MUNICIPIO_ORIGEN VARCHAR(50),
	persona_id_fk INTEGER,
	CONSTRAINT municipio_pk PRIMARY KEY (municipio_id),
    CONSTRAINT persona_id_fk FOREIGN KEY(persona_id_fk) REFERENCES Persona(persona_id)
);

CREATE TABLE Programa (
    programa_id INTEGER,
    SNIES INTEGER NOT NULL,
    PLAN_ESTUDIOS VARCHAR(100),
    PROGRAMA_ACADEMICO VARCHAR(100),
    FACULTAD VARCHAR(100),
	persona_id_fk INTEGER,
	CONSTRAINT programa_pk PRIMARY KEY (programa_id),
    CONSTRAINT persona_id_fk FOREIGN KEY(persona_id_fk) REFERENCES Persona(persona_id)
);



-- Cargar datos en la tabla "Persona"
COPY Persona (PERSONA_ID, PERIODO, TIPO_DNI, FECHA_NACIMIENTO, EDAD, GRUPO_ETARIO, VINCULACION, GENERO, ESTRATO, SNIES, LUGAR, TIPO, LONGITUD, LATITUD, POB_VULNERABLE)
FROM 'D:\Descargas\Estudiantes_Persona.csv' DELIMITER ';' CSV HEADER;

COPY Municipio (MUNICIPIO_ID, COD_DANE, MUNICIPIO_ORIGEN, PERSONA_ID_FK)
FROM 'D:\Descargas\Estudiantes_Municipio.csv' DELIMITER ';' CSV HEADER;

-- Cargar datos en la tabla "Programa"
COPY Programa (PROGRAMA_ID, SNIES, PLAN_ESTUDIOS, PROGRAMA_ACADEMICO, FACULTAD, PERSONA_ID_FK)
FROM 'D:\Descargas\Estudiantes_Programa.csv' DELIMITER ';' CSV HEADER;


select * from Persona

select * from Municipio

select * from Programa
