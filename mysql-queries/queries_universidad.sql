USE universidad;

-- CONSULTES 1-9
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND nif LIKE '%K' AND telefono IS NULL;
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY apellido1, apellido2, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura am ON persona.id = am.id_alumno JOIN asignatura ON am.id_asignatura = asignatura.id JOIN curso_escolar ON curso_escolar.id = am.id_curso_escolar WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.* FROM persona JOIN alumno_se_matricula_asignatura am ON am.id_alumno = persona.id JOIN curso_escolar ON am.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT persona.* 

