# 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”.

CREATE DATABASE friends_of_man;

# 8. Создать таблицы с иерархией из диаграммы в БД.

USE friends_of_man;

CREATE TABLE animals
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
kind VARCHAR(20)
);

CREATE TABLE house_animals
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
species VARCHAR(20),
animal_id INT,
FOREIGN KEY (animal_id) REFERENCES animals(id)
);

CREATE TABLE pack_animals
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
species VARCHAR(20),
animal_id INT,
FOREIGN KEY (animal_id) REFERENCES animals(id)
);

CREATE TABLE dogs
(
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nickname VARCHAR(20),
 skill VARCHAR(20),
 birth DATE,
 pet_id INT,
 FOREIGN KEY (pet_id) REFERENCES house_animals(id)
);

CREATE TABLE cats
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(20),
skill VARCHAR(20),
birth DATE,
pet_id INT,
FOREIGN KEY (pet_id) REFERENCES house_animals(id)
);

CREATE TABLE hamsters
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(20),
skill VARCHAR(20),
birth DATE,
pet_id INT,
FOREIGN KEY (pet_id) REFERENCES house_animals(id)
);

CREATE TABLE horses
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(20),
skill VARCHAR(20),
birth DATE,
pack_id INT,
FOREIGN KEY (pack_id) REFERENCES pack_animals(id)
);

CREATE TABLE camels
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(20),
skill VARCHAR(20),
birth DATE,
pack_id INT,
FOREIGN KEY (pack_id) REFERENCES pack_animals(id)
 );

CREATE TABLE donkeys
(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nickname VARCHAR(20),
skill VARCHAR(20),
birth DATE,
pack_id INT,
FOREIGN KEY (pack_id) REFERENCES pack_animals(id)
);

/* 9. Заполнить низкоуровневые таблицы именами (животных), 
командами которые они выполняют и датами рождения. */

INSERT animals
VALUES
	(1, "pets"),
    (2, "pack_animals");

INSERT house_animals(species, animal_id)
VALUES
	("dogs", 1),
    ("cats", 1),
    ("hamsters", 1);
    
INSERT pack_animals(species, animal_id)
VALUES
	("horses", 2),
    ("camels", 2),
    ("donkeys", 2);
    
INSERT dogs
VALUES
		(1, "Rex", "sit", '2020-02-18', 1),
        (2, "Max", "voice", '2017-11-09', 1);

INSERT cats
VALUES
		(1, "Tom", "meow", '2017-11-17', 2),
        (2, "Melman", "lay", '2022-11-12', 2);
        
INSERT hamsters
VALUES
		(1, "Donald", "eat", '2021-12-09', 3),
        (2, "Sam", "run", '2022-04-26', 3);
        
INSERT horses
VALUES
		(1, "Eskalibur", "jump", '2019-11-23', 1),
        (2, "Pegas", "run", '2018-11-11', 1);

INSERT camels
VALUES
		(1, "Ali", "run", '2021-05-05', 2),
        (2, "Aladin", "spit", '2019-09-06', 2);
        
INSERT donkeys
VALUES
		(1, "Moisey", "IA", '2022-11-26', 3),
        (2, "Morty", "run", '2020-08-11', 3);
        
# 10. Удалить из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку.
#     Объединить таблицы лошади, и ослы в одну таблицу.

DROP TABLE camels;
 
DELETE FROM pack_animals WHERE species = "camels";




CREATE TABLE donkeys_horses
SELECT * FROM horses UNION SELECT * FROM donkeys;

ALTER TABLE donkeys_horses
DROP COLUMN id,
ADD id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD FOREIGN KEY (pack_id) REFERENCES pack_animals(id);

# 11. Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
# но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице.

CREATE TABLE young_animals 
SELECT nickname, skill, birth 
FROM dogs
WHERE DATEDIFF(CURDATE(), birth) > 365 AND DATEDIFF(CURDATE(), birth) < 1095
UNION 
SELECT nickname, skill, birth
FROM cats
WHERE DATEDIFF(CURDATE(), birth) > 365 AND DATEDIFF(CURDATE(), birth) < 1095
UNION
SELECT nickname, skill, birth
FROM hamsters
WHERE DATEDIFF(CURDATE(), birth) > 365 AND DATEDIFF(CURDATE(), birth) < 1095
UNION
SELECT nickname, skill, birth
FROM donkeys_horses
WHERE DATEDIFF(CURDATE(), birth) > 365 AND DATEDIFF(CURDATE(), birth) < 1095;

ALTER TABLE young_animals
ADD id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD age_months INT ;

UPDATE young_animals
SET age_months = TIMESTAMPDIFF(MONTH, birth, CURDATE());

SELECT * FROM young_animals;

# 12. Объединить все таблицы в одну, при этом сохраняя поля, 
#     указывающие на прошлую принадлежность к старым таблицам.

CREATE TABLE allInOne
SELECT s.*, a.kind AS type
FROM animals a JOIN
(SELECT d.nickname, d.skill, d.birth, h.species, h.animal_id
FROM dogs d JOIN house_animals h ON d.pet_id = h.id) s ON s.animal_id = a.id
UNION
SELECT s1.*, a.kind AS type
FROM animals a JOIN
(SELECT c.nickname, c.skill, c.birth, h.species, h.animal_id
FROM cats c JOIN house_animals h ON c.pet_id = h.id) s1 ON s1.animal_id = a.id
UNION
SELECT s2.*, a.kind AS type
FROM animals a JOIN
(SELECT ham.nickname, ham.skill, ham.birth, h.species, h.animal_id
FROM hamsters ham JOIN house_animals h ON ham.pet_id = h.id) s2 ON s2.animal_id = a.id
UNION
SELECT s3.*, a.kind AS type
FROM animals a JOIN
(SELECT dh.nickname, dh.skill, dh.birth, pc.species, pc.animal_id
FROM donkeys_horses dh JOIN pack_animals pc ON dh.pack_id = pc.id) s3 ON s3.animal_id = a.id;


ALTER TABLE allInOne
DROP COLUMN animal_id;

SELECT * FROM allInOne;
