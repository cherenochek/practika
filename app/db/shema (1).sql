--
-- Скрипт сгенерирован Devart dbForge Studio 2020 for MySQL, Версия 9.0.505.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 11.07.2021 18:42:58
-- Версия сервера: 5.1.40
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS pr;

CREATE DATABASE pr
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Установка базы данных по умолчанию
--
USE pr;

--
-- Создать таблицу `roles`
--
CREATE TABLE roles (
  roleid int(1) NOT NULL AUTO_INCREMENT,
  role varchar(50) DEFAULT NULL,
  PRIMARY KEY (roleid)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `users`
--
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  login varchar(255) DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  surname varchar(40) DEFAULT NULL,
  second_name varchar(40) DEFAULT NULL,
  d_day date DEFAULT NULL,
  phone varchar(12) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  roleid int(1) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13270,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE users
ADD CONSTRAINT FK_users_roles_roleid FOREIGN KEY (roleid)
REFERENCES roles (roleid) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `tarif`
--
CREATE TABLE tarif (
  id int(11) NOT NULL AUTO_INCREMENT,
  phone varchar(12) NOT NULL DEFAULT '',
  tarif varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13270,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE tarif
ADD CONSTRAINT FK_tarif_users_id FOREIGN KEY (id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `personal_passport`
--
CREATE TABLE personal_passport (
  id int(11) NOT NULL AUTO_INCREMENT,
  seria int(4) DEFAULT NULL,
  number int(6) DEFAULT NULL,
  issue_by varchar(255) DEFAULT NULL,
  when_issue date DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13270,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE personal_passport
ADD CONSTRAINT FK_personal_passport_users_id FOREIGN KEY (id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `personal_inf`
--
CREATE TABLE personal_inf (
  id int(11) NOT NULL AUTO_INCREMENT,
  gender varchar(10) DEFAULT NULL,
  children varchar(10) DEFAULT NULL COMMENT 'нет/количество',
  position varchar(100) DEFAULT NULL,
  salary int(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13268,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE personal_inf
ADD CONSTRAINT FK_personal_inf_users_id FOREIGN KEY (id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `personal_adress`
--
CREATE TABLE personal_adress (
  id int(11) NOT NULL AUTO_INCREMENT,
  country varchar(100) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  street varchar(255) DEFAULT NULL,
  house varchar(20) DEFAULT NULL,
  apartment int(5) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13270,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE personal_adress
ADD CONSTRAINT FK_personal_adress_users_id FOREIGN KEY (id)
REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы roles
--
INSERT INTO roles VALUES
(1, 'Администратор'),
(2, 'Сотрудник'),
(4, 'Клиент');

-- 
-- Вывод данных для таблицы users
--
INSERT INTO users VALUES
(13265, 'admin', 'Даниил', 'Журавлев', 'Михайлович', '1998-07-23', '+79034132837', 'zhuravlevD@mail.ru', 'admin3400', 1),
(13266, 'kuzmi18', 'Андрей', 'Кузьмин', 'Николаевич', '1978-03-18', '+79606661200', 'kuzminAN@yandex.com', '18kaun34', 2),
(13267, 'olgan28', 'Ольга', 'Николаева', 'Ивановна', '1989-09-28', '+79060452910', 'Onikolaeva@yandex.com', 'nikolaeva28ON', 2),
(13268, 'vasilev_8', 'Александр', 'Васильев', 'Романович', '1995-08-08', '+79054331309', 'vasilevAAA@list.ru', 'alexvas895', 4),
(13269, 'surkova_00', 'Елена', 'Суркова', 'Анатольевна', '2000-11-15', '+79613821490', 'SURKOVA@mail.ru', 'surkovaE11', 4);

-- 
-- Вывод данных для таблицы tarif
--
INSERT INTO tarif VALUES
(13268, '+79054331309', 'Всё включенно'),
(13269, '+79613821490', 'Связь-Z');

-- 
-- Вывод данных для таблицы personal_passport
--
INSERT INTO personal_passport VALUES
(13266, 1815, 238716, 'МФЦ по г.Волжскому', '1998-04-07'),
(13267, 1815, 726183, 'МФЦ по г.Волжскому', '2009-10-15'),
(13268, 1820, 621738, 'МВД России по Волгоградской области', '2015-08-28'),
(13269, 1820, 231384, 'МВД России по Волгоградской области', '2020-11-26');

-- 
-- Вывод данных для таблицы personal_inf
--
INSERT INTO personal_inf VALUES
(13266, 'мужской', '2', 'Директор', 50000),
(13267, 'женский', '1', 'Менеджер', 30000);

-- 
-- Вывод данных для таблицы personal_adress
--
INSERT INTO personal_adress VALUES
(13266, 'Россия', 'Волжский', 'Ленина', '105', 23),
(13267, 'Россия', 'Волжский', 'Пионерская', '23', 113),
(13268, 'Россия', 'Волжский', 'Ленина', '98', 60),
(13269, 'Россия', 'Волжский', 'Карбышева', '41', 12);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;