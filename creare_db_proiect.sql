CREATE DATABASE organizare_examene;

CREATE TABLE tara(
    id_tara INT(3) PRIMARY KEY AUTO_INCREMENT,
    nume_tara VARCHAR(20) NOT NULL
);

INSERT INTO tara (nume_tara)
VALUES  ('Romania'),
        ('Spania'),
        ('Italia');

SELECT * FROM tara;

CREATE TABLE judet(
    id_judet INT(3) PRIMARY KEY AUTO_INCREMENT,
    nume_judet VARCHAR(20) NOT NULL
);

INSERT INTO judet (nume_judet)
VALUES  ('Salaj'),
        ('Ilfov'),
        ('Toscana'),
        ('Aragon'),
        ('Bucuresti');

SELECT * FROM judet;

CREATE TABLE oras(
    id_oras INT(3) PRIMARY KEY AUTO_INCREMENT,
    nume_oras VARCHAR(20) NOT NULL
);

INSERT INTO oras (nume_oras)
VALUES  ('Zalau'),
        ('Buftea'),
        ('Florenta'),
        ('Zaragoza'),
        ('Bucuresti');

SELECT * FROM oras;

CREATE TABLE adresa(
    id_adresa INT(2) PRIMARY KEY AUTO_INCREMENT,
    id_persoana INT(2),
    id_tara INT(2),
    id_judet INT(2),
    id_oras INT(2),
    strada VARCHAR(50) NOT NULL,
    numar VARCHAR(5) NOT NULL,
    bloc VARCHAR(5),
    apartament INT(5),
    FOREIGN KEY (id_tara) REFERENCES tara(id_tara),
    FOREIGN KEY (id_judet) REFERENCES judet(id_judet),
    FOREIGN KEY (id_oras) REFERENCES oras(id_oras)
);

INSERT INTO adresa (id_persoana, id_tara, id_judet, id_oras, strada, numar, bloc, apartament)
VALUES  (1, 2, 4, 4, 'Alemania', 20, 'P13', 45),
        (2, 1, 2, 2, 'Florilor', '9B', 'I7', 23),
        (3, 3, 3, 3, 'Romana', '5C', 'F10', 2),
        (4, 1, 5, 5, 'Sincai', 16, 'C5', 218),
        (5, 1, 5, 5, 'Vitan', 18, 'B4', 67),
        (6, 1, 5, 5, 'Pipera', '63A', 'B2', 39),
        (7, 1, 5, 5, 'Oltenitei', 4, 'A2', 13);

INSERT INTO adresa (id_persoana, id_tara, id_judet, id_oras, strada, numar)
VALUES  (8, 1, 5, 5, 'Primaverii', 3),
        (9, 1, 1, 1, 'Alunului', '2A'),
        (10, 1, 5, 5, 'Vacaretsi', 5);

SELECT * FROM adresa;

CREATE TABLE persoane_rol(
    id_rol INT(2) PRIMARY KEY AUTO_INCREMENT,
    nume_rol VARCHAR(20) NOT NULL
);

INSERT INTO persoane_rol(nume_rol)
VALUES  ('student'),
        ('profesor');

SELECT * FROM persoane_rol;

CREATE TABLE persoane (
    id_persoana INT(2) PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    intitiala_tatalui CHAR(3) NOT NULL,
    nr_tel INT(10) NOT NULL,
    id_grupa INT(3),
    media_generala DECIMAL(4, 2),
    id_adresa INT(2),
    id_rol INT(2),
    FOREIGN KEY (id_rol) REFERENCES persoane_rol(id_rol)
);

INSERT INTO persoane(nume, prenume, intitiala_tatalui, nr_tel, id_grupa, id_adresa, id_rol)
VALUES  ('Popescu', 'Elena', 'C', 0736475937, 2, 1, 1),
        ('Ardelean', 'Maria', 'S', 0783648392, 1, 2, 1),
        ('Berciu', 'Madalin', 'L', 0774639874, 1, 3, 1),
        ('Ticle', 'Paula', 'P', 0748457638, 3, 4, 1),
        ('Sabau', 'Alexia', 'H', 0752400712, 3, 5, 1),
        ('Pop', 'Mihaela', 'N', 0756492375, 2, 6, 1),
        ('Coca', 'Ioana', 'R', 0774628465, 1, 1, 1),
        ('Olar', 'Gabi', 'D', 0756374625, 1, 8, 2),
        ('Crisan', 'Denisa', 'G', 0765248721, 2, 9, 2),
        ('Prodan', 'Simi', 'A', 0762145985, 3, 10, 2);

SELECT * FROM persoane;

CREATE TABLE grupe_studii(
    id_grupa INT(3) PRIMARY KEY AUTO_INCREMENT,
    cod_grupa VARCHAR(50) NOT NULL,
    id_sef_grupa INT(3),
    id_indrumator INT(3),
    FOREIGN KEY (id_sef_grupa) REFERENCES persoane(id_persoana),
    FOREIGN KEY (id_indrumator) REFERENCES persoane(id_persoana)
);

INSERT INTO grupe_studii(cod_grupa, id_sef_grupa, id_indrumator)
VALUES  ('IF01', 6, 10),
        ('IF02', 4, 8),
        ('IF03', 2, 9);

SELECT * FROM grupe_studii;

CREATE TABLE cursuri(
    id_curs INT(3) PRIMARY KEY AUTO_INCREMENT,
    nume_curs VARCHAR(20) NOT NULL,
    descriere TEXT(100),
    prof_titular VARCHAR(20),
    nr_credite INT(2) NOT NULL
);

INSERT INTO cursuri(nume_curs, descriere, prof_titular, nr_credite)
VALUES  ('criptografie', 'invatarea metodelor criptografice simple si complexe', 8, 7),
        ('baze de date', 'inatarea limbajului sql', 9, 10),
        ('programare', 'tehnici de programare in java', 10, 9);

SELECT * FROM cursuri;

CREATE TABLE note_cursuri(
    id_nota INT(3) PRIMARY KEY AUTO_INCREMENT,
    id_curs INT(3),
    id_persoana INT(3),
    sesiune VARCHAR(20) NOT NULL,
    tip_examen VARCHAR(20) NOT NULL,
    nr_credite INT(2),
    nota_curs INT(2),
    promovat BIT(1),
    FOREIGN KEY (id_curs) REFERENCES cursuri(id_curs),
    FOREIGN KEY (id_persoana) REFERENCES persoane(id_persoana)
);

INSERT INTO note_cursuri(id_curs, id_persoana, sesiune, tip_examen, nr_credite, nota_curs, promovat)
VALUES  (1, 2, 'vara', 'examen', 7, 8, 1),
        (1, 3, 'vara', 'examen', 0, 3, 0),
        (1, 4, 'toamna', 'examen', 7, 9, 1),
        (2, 3, 'vara', 'colocviu', 0, 2, 0),
        (2, 6, 'iarna', 'colocviu', 10, 10, 1),
        (2, 7, 'toamna', 'colocviu', 10, 7, 1),
        (3, 1, 'vara', 'examen', 9, 6, 1),
        (3, 6, 'iarna', 'examen', 9, 8, 1),
        (3, 4, 'vara', 'exammen', 9, 8, 1);

UPDATE note_cursuri
SET promovat = 1
WHERE nota_curs > 5 ;

UPDATE note_cursuri
SET promovat = 0
WHERE nota_curs < 5 ;

SELECT * FROM note_cursuri;

CREATE TABLE studenti_cursuri(
    id INT(3) PRIMARY KEY AUTO_INCREMENT,
    id_curs INT(3) NOT NULL,
    id_persoana INT(3) NOT NULL
);

INSERT INTO studenti_cursuri (id_curs, id_persoana)
VALUES  (2, 5),
        (2, 7),
        (3, 1),
        (3, 3);

SELECT * FROM studenti_cursuri;

CREATE TABLE prof_cursuri(
    id INT(3) PRIMARY KEY AUTO_INCREMENT,
    id_curs INT(3) NOT NULL,
    id_persoana INT(3) NOT NULL
);

INSERT INTO prof_cursuri( id_curs, id_persoana)
VALUES  (1, 8),
        (2, 9),
        (3, 10);

SELECT * FROM prof_cursuri;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 1;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 2;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 3;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 4;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 5;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 6;

SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 7;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 1)
WHERE id_persoana = 1;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 2)
WHERE id_persoana = 2;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 3)
WHERE id_persoana = 3;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 4)
WHERE id_persoana = 4;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 5)
WHERE id_persoana = 5;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 6)
WHERE id_persoana = 6;

UPDATE persoane 
SET media_generala = (SELECT ROUND(AVG(nota_curs), 2) FROM note_cursuri
WHERE id_persoana = 7)
WHERE id_persoana = 7;

SELECT * FROM persoane;

a. studenţii care s-au înscris la un anumit curs;

SELECT CONCAT(p.nume,' ', p.prenume) AS student, c.nume_curs
FROM (((persoane AS p
INNER JOIN studenti_cursuri AS l ON p.id_persoana = l.id_persoana)
INNER JOIN cursuri AS c ON c.id_curs = l.id_curs)
INNER JOIN persoane_rol AS r ON r.id_rol = p.id_rol)
WHERE c.id_curs = 2 AND r.id_rol = 1;

b. numele cursurilor şi al profesorilor titulari

SELECT CONCAT(p.nume,' ', p.prenume) AS student, c.nume_curs
FROM (((persoane AS p
INNER JOIN prof_cursuri AS k ON p.id_persoana = k.id_persoana)
INNER JOIN cursuri AS c ON c.id_curs = k.id_curs)
INNER JOIN persoane_rol AS r ON r.id_rol = p.id_rol)
WHERE r.id_rol = 2;

c. cod grupe de studiu, numele şefului de grupă şi al profesorului îndrumător

SELECT g.cod_grupa, CONCAT(p1.nume, ' ', p1.prenume) AS nume_sef_grupa, CONCAT (p2.nume, ' ', p2.prenume) AS nume_indrumator
FROM grupe_studii AS g
INNER JOIN persoane AS p1 ON g.id_sef_grupa = p1.id_persoana
INNER JOIN persoane AS p2 ON g.id_indrumator = p2.id_persoana;

d. notele obţinute de studenţi la un anumit curs funcţie de anumite criterii(ex.: în ordinea
 alfabetică a numelor, în ordinea crescătoare/descrescătoare a notelor ş.a.);

d.1 ordine alfabetica:

SELECT p.nume, p.prenume, n.nota_curs
FROM persoane AS p
INNER JOIN note_cursuri AS n ON p.id_persoana = n.id_persoana
WHERE n.id_curs = 1
ORDER BY p.nume ASC;

d.2 ordine descrescatoare note:

SELECT p.nume, p.prenume, n.nota_curs
FROM persoane AS p
INNER JOIN note_cursuri AS n ON p.id_persoana = n.id_persoana
WHERE n.id_curs = 2
ORDER BY n.nota_curs DESC;

d.3 ordine crescatoare note:

SELECT p.nume, p.prenume, n.nota_curs
FROM persoane AS p
INNER JOIN note_cursuri AS n ON p.id_persoana = n.id_persoana
WHERE n.id_curs = 2
ORDER BY n.nota_curs ASC;

e.studenţii restanţieri la un anumit curs:

SELECT p.nume, p.prenume
FROM persoane AS p
INNER JOIN note_cursuri AS n ON p.id_persoana = n.id_persoana
WHERE n.id_curs = 2 AND n.promovat = 0;

f. studenţii restanţieri şi nr. de restanţe la toate cursurile la care au participat într-o sesiune

SELECT p.nume, p.prenume, COUNT(*) AS numar_restante
FROM persoane AS p
INNER JOIN note_cursuri  AS n ON p.id_persoana = n.id_persoana
WHERE n.sesiune = 'vara' AND n.promovat = 0
GROUP BY p.id_persoana;

g. cursurile la care studenţii sunt restanţieri

SELECT c.nume_curs
FROM cursuri AS c
INNER JOIN note_cursuri AS n ON c.id_curs = n.id_curs
WHERE n.id_persoana = 3 AND n.promovat = 0;


h. numărul de credite obţinute de un anumit student la examenele/colocviile promovate
într-o sesiune;

SELECT CONCAT(p.nume,' ', p.prenume) AS student, n.sesiune, n.nr_credite
FROM persoane AS p
INNER JOIN note_cursuri AS n ON p.id_persoana = n.id_persoana
WHERE n.promovat = 1 AND n.sesiune = 'vara'
LIMIT 1;

i. media notelor obţinute la examenele şi colocviile dintr-o sesiune de către un student

SELECT ROUND(AVG(n.nota_curs), 2) AS medie
FROM note_cursuri AS n
WHERE n.id_persoana = 6 AND n.sesiune = 'iarna';

j. media notelor obţinute la un anumit curs de către toţi studenţii grupei.

SELECT ROUND(AVG(n.nota_curs), 2) AS medie
FROM note_cursuri AS n
INNER JOIN persoane  AS p ON n.id_persoana = p.id_persoana
INNER JOIN grupe_studii AS g ON p.id_grupa = g.id_grupa
WHERE n.id_curs = 1 AND g.cod_grupa = 'IF01';