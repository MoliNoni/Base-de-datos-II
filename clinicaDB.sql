CREATE TABLE PACIENTE (
  id_paciente INT PRIMARY KEY,
  nombre VARCHAR(100),
  telefono VARCHAR(20),
  direccion VARCHAR(100)
);

CREATE TABLE ESPECIALIDAD (
  id_especialidad INT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE MEDICO (
  id_medico INT PRIMARY KEY,
  nombre VARCHAR(100),
  id_especialidad INT,
  consultorio INT,
  FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad)
);

CREATE TABLE ATENCION (
  id_atencion INT PRIMARY KEY,
  id_paciente INT,
  id_medico INT,
  FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES MEDICO(id_medico)
);

CREATE TABLE DETALLE_ATENCION (
  id_atencion INT,
  tratamiento VARCHAR(100),
  precio INT,
  PRIMARY KEY (id_atencion, tratamiento),
  FOREIGN KEY (id_atencion) REFERENCES ATENCION(id_atencion)
);

INSERT INTO PACIENTE VALUES
(1, 'Ana Torres', '3001112222', 'Cali'),
(2, 'Juan Díaz', '3109998888', 'Medellín');

INSERT INTO ESPECIALIDAD VALUES
(1, 'Cardiología'),
(2, 'Pediatría');

INSERT INTO MEDICO VALUES
(1, 'Dr. Pérez', 1, 101),
(2, 'Dr. Gómez', 2, 202);

INSERT INTO ATENCION VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 1);

INSERT INTO DETALLE_ATENCION VALUES
(1, 'Consulta', 120000),
(1, 'Examen', 120000),
(2, 'Consulta', 80000),
(3, 'Control', 60000);