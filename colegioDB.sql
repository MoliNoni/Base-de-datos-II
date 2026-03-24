CREATE DATABASE ColegioDB;
GO

USE ColegioDB;
GO

CREATE TABLE Cursos (
    IdCurso INT IDENTITY(1,1) PRIMARY KEY,
    NombreCurso VARCHAR(60) NOT NULL,
    Duracion TIME NOT NULL
);
GO

CREATE TABLE Estudiantes (
    IdEstudiante INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Edad INT NOT NULL CHECK (Edad > 0),
    Ciudad VARCHAR(30) NOT NULL
);
GO

CREATE TABLE Matriculas (
    IdMatricula INT IDENTITY(1,1) PRIMARY KEY,
    IdEstudiante INT NOT NULL,
    IdCurso INT NOT NULL,
    FOREIGN KEY (IdEstudiante) REFERENCES Estudiantes(IdEstudiante),
    FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso)
);
GO

INSERT INTO Cursos (NombreCurso, Duracion) VALUES
('HHHH', '02:30:00'),
('HHHK', '01:00:00'),
('HHKK', '02:00:00'),
('HKKK', '01:50:00'),
('KKKK', '00:30:00');
GO



-- Punto 1: mostar solo el nombre y la edad de los estudiantes
SELECT Nombre, Edad FROM Estudiantes;

-- Punto 2:  mostrar solo los estudiantes mayores de 18 
SELECT * FROM Estudiantes WHERE Edad > 18;

-- Punto 3: mostrar a los estudiantes en orden alfabetido
SELECT Nombre, IdEstudiante FROM Estudiantes ORDER BY Nombre ASC;

-- Punto 4: insert

INSERT INTO Estudiantes (Nombre, Edad, Ciudad) VALUES
('A', 15, 'Cali'),
('B', 18, 'Bogota'),
('Carlos Diaz', 20, 'Medellin'),
('C', 22, 'Medellin'),
('D', 17, 'Bucaramanga');
GO

INSERT INTO Matriculas (IdEstudiante, IdCurso) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
GO

-- Punto 5: cambiar la edad del estudiande con id 1 
UPDATE Estudiantes SET Edad = 25 WHERE IdEstudiante = 1;

-- Punto 6: borrar al estudiante con id 10
DELETE FROM Estudiantes WHERE IdEstudiante = 10;

-- Punto 7: mostrar solo el nombre del estudiante y del curso
SELECT E.Nombre, C.NombreCurso
FROM Estudiantes E
JOIN Matriculas M ON E.IdEstudiante = M.IdEstudiante
JOIN Cursos C ON M.IdCurso = C.IdCurso;

-- Punto 8: mostrar el numero total de estudiantes
SELECT COUNT(*) AS TotalEstudiantes FROM Estudiantes;

-- Punto 9: mostrar el numero total de estudiantes pero de un curso especifico
SELECT C.NombreCurso, COUNT(M.IdEstudiante) AS TotalInscritos
FROM Cursos C
LEFT JOIN Matriculas M ON C.IdCurso = M.IdCurso
GROUP BY C.NombreCurso;

-- Punto 10: mostrar los cursos que tienen mas de 10 estudiantes inscritos
SELECT C.NombreCurso, COUNT(M.IdEstudiante) AS EstudiantesInscritos
FROM Cursos C
JOIN Matriculas M ON C.IdCurso = M.IdCurso
GROUP BY C.NombreCurso
HAVING COUNT(M.IdEstudiante) > 10;