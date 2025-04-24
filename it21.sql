-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Квт 24 2025 р., 08:20
-- Версія сервера: 5.7.24
-- Версія PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `it21`
--

-- --------------------------------------------------------

--
-- Структура таблиці `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `director` varchar(50) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `release_year`, `rating`) VALUES
(1, 'Inception', 'Нолан', 2010, '8.8'),
(2, 'Interstellar', 'Нолан', 2014, '9.0'),
(3, 'The Godfather', 'Коппола', 1972, '9.2'),
(4, 'The Matrix', 'Вачовскі', 1999, '8.7'),
(5, 'Parasite', 'Пон Джун-хо', 2019, '8.6');

-- --------------------------------------------------------

--
-- Структура таблиці `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `ratings`
--

INSERT INTO `ratings` (`id`, `movie_id`, `user_name`, `score`) VALUES
(1, 1, 'Олексій', 9),
(2, 1, 'Марія', 8),
(3, 2, 'Іван', 9),
(4, 4, 'Анна', 10);

-- --------------------------------------------------------

--
-- Структура таблиці `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `session_time` datetime DEFAULT NULL,
  `hall` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `sessions`
--

INSERT INTO `sessions` (`id`, `movie_id`, `session_time`, `hall`) VALUES
(1, 1, '2025-04-25 19:00:00', 'Зал 1'),
(2, 1, '2025-04-29 20:00:00', 'Зал 3'),
(3, 2, '2025-04-25 18:00:00', 'Зал 2'),
(4, 2, '2025-04-27 20:00:00', 'Зал 3'),
(5, 3, '2025-04-25 17:00:00', 'Зал 1'),
(6, 3, '2025-04-26 19:30:00', 'Зал 2'),
(7, 4, '2025-04-26 22:00:00', 'Зал 4'),
(8, 4, '2025-04-27 18:30:00', 'Зал 1'),
(9, 5, '2025-04-25 20:30:00', 'Зал 3'),
(10, 5, '2025-04-28 19:00:00', 'Зал 2');

-- --------------------------------------------------------

--
-- Структура таблиці `trailers`
--

CREATE TABLE `trailers` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `trailers`
--

INSERT INTO `trailers` (`id`, `movie_id`, `url`, `language`) VALUES
(1, 1, 'https://youtube.com/inception', 'English'),
(2, 2, 'https://youtube.com/interstellar', 'English'),
(3, 3, 'https://youtube.com/godfather', 'English'),
(4, 4, 'https://youtube.com/matrix', 'English'),
(5, 5, 'https://youtube.com/parasite', 'Korean');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Індекси таблиці `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Індекси таблиці `trailers`
--
ALTER TABLE `trailers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `trailers`
--
ALTER TABLE `trailers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `trailers`
--
ALTER TABLE `trailers`
  ADD CONSTRAINT `trailers_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
