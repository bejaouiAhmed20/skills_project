-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 06:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skills_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE `competences` (
  `id` int(11) NOT NULL,
  `nom_competence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competences`
--

INSERT INTO `competences` (`id`, `nom_competence`) VALUES
(13, 'Flutter'),
(12, 'Node Js'),
(10, 'Python'),
(15, 'Ruby ');

-- --------------------------------------------------------

--
-- Table structure for table `projetmanagers`
--

CREATE TABLE `projetmanagers` (
  `id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `manager_cin` int(8) NOT NULL,
  `date_assignation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projetmanagers`
--

INSERT INTO `projetmanagers` (`id`, `projet_id`, `manager_cin`, `date_assignation`) VALUES
(2, 2, 12345678, '2025-02-13 12:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `projets`
--

CREATE TABLE `projets` (
  `id` int(11) NOT NULL,
  `nom_projet` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `delai` date NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `statut` enum('en cours','terminé','annulé') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projets`
--

INSERT INTO `projets` (`id`, `nom_projet`, `description`, `delai`, `budget`, `statut`) VALUES
(1, 'Site E-commerce', 'Développement d\'un site de vente en ligne.', '2025-03-01', 5000.00, 'en cours'),
(2, 'Planification Stratégique 1', 'Mise en place d\'un plan stratégique pour une entreprise.', '2025-06-15', 7000.00, 'en cours'),
(6, 'ahmed bejaoui', 'ahmed project', '2025-02-22', 222.00, 'en cours');

-- --------------------------------------------------------

--
-- Table structure for table `projet_competence`
--

CREATE TABLE `projet_competence` (
  `projet_id` int(11) NOT NULL,
  `competence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projet_competence`
--

INSERT INTO `projet_competence` (`projet_id`, `competence_id`) VALUES
(6, 10),
(6, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `cin` int(8) NOT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `disponibilitee` tinyint(1) DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `num_tele` varchar(20) DEFAULT NULL,
  `role` enum('0','1','2') NOT NULL DEFAULT '2',
  `nom` varchar(255) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`cin`, `poste`, `experience`, `disponibilitee`, `email`, `password`, `num_tele`, `role`, `nom`, `imageUrl`) VALUES
(11223344, 'web developer', '1 year', 1, 'ahmed@gmail.com', '$2a$10$tP8UyKL89eVxpA4PBPHnWukfbElK3P.UzYyeGIpG/alR1B1pg9I3q', '90640476', '2', 'ahmed test', '/uploads/profiles/profile-11223344-1739442302677-736547922.png'),
(12312312, 'web developer', NULL, 1, 'test@gmail.com', '$2a$10$6dT0orYqt7dwzKnIOkb.NOUPxJDd1HRh7JDMIndnBcXOT/ibvpJoq', NULL, '2', 'test 1', '/uploads/profiles/profile-12312312-1739550282110-595775068.jpg'),
(12345678, 'web developer', NULL, 1, 'omaima@gmail.com', '$2a$10$IBwVXCwxsbHJrkiSvab85uKFFjF/SZ7APEnBsRPb5oIQDh0x/oPTK', '50062502', '1', 'omaima omaima', ''),
(14521465, 'web developer', NULL, 1, 'hama@gmail.com', '$2a$10$NokOVik8RRwReHbyNI/AseolzyNmUe75s38Wzrbslt.3RqrmZAKDG', NULL, '0', 'hama hama', ''),
(87654321, 'designer', NULL, 1, 'employee@gmail.com', '$2a$10$M.kJkLkgp7WfbWohl1J7ze1vhqc6k3WKPEpOZ3fVRmeeq2soFKAWS', '12345678', '2', 'employee', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_competence` (`nom_competence`);

--
-- Indexes for table `projetmanagers`
--
ALTER TABLE `projetmanagers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_project_manager` (`projet_id`,`manager_cin`),
  ADD KEY `manager_cin` (`manager_cin`);

--
-- Indexes for table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projet_competence`
--
ALTER TABLE `projet_competence`
  ADD PRIMARY KEY (`projet_id`,`competence_id`),
  ADD KEY `fk_competence` (`competence_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`cin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competences`
--
ALTER TABLE `competences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `projetmanagers`
--
ALTER TABLE `projetmanagers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projets`
--
ALTER TABLE `projets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projetmanagers`
--
ALTER TABLE `projetmanagers`
  ADD CONSTRAINT `projetmanagers_ibfk_1` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projetmanagers_ibfk_2` FOREIGN KEY (`manager_cin`) REFERENCES `users` (`cin`) ON DELETE CASCADE;

--
-- Constraints for table `projet_competence`
--
ALTER TABLE `projet_competence`
  ADD CONSTRAINT `fk_competence` FOREIGN KEY (`competence_id`) REFERENCES `competences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_projet` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
