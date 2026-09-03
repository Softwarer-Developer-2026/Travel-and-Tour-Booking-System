-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2026 at 12:47 PM
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
-- Database: `attendance_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Late','Excused') DEFAULT 'Present',
  `marked_by` int(11) NOT NULL,
  `marked_by_role` enum('instructor','monitor') NOT NULL,
  `marked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `course_id`, `attendance_date`, `status`, `marked_by`, `marked_by_role`, `marked_at`) VALUES
(1, 6, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41'),
(2, 2, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41'),
(3, 5, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41'),
(4, 1, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41'),
(5, 3, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41'),
(6, 4, 1, '2026-08-18', 'Present', 3, 'instructor', '2026-08-18 05:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `description`, `status`, `created_at`) VALUES
(1, '001', 'National Certificate - Software Developer', 'Start your career in software development with the NVQ Level 4 qualification in Sri Lanka. This practical training program covers programming, database management, system analysis, Desktop Application Development, web application development and Mobile Application Development. Learn the skills needed to design, code, and test real-world software solutions using modern technologies. Upon completion, you’ll be ready for entry-level jobs in IT or further studies in advanced computing and software engineering.', 'active', '2026-08-18 04:36:23'),
(2, '002', 'National Diploma - Information & Communication Technology', 'The NVQ ICT Level 5 qualification develops advanced skills in information and communication technology, focusing on system management and professional IT solutions.It prepares learners for higher-level technical roles and further studies in the ICT field.', 'active', '2026-08-18 04:37:21'),
(3, '003', 'National Certificate - Electrician', 'The Electrician qualification trains learners to install, maintain, and repair electrical systems in residential, commercial, and industrial settings.It provides the technical knowledge and safety skills needed for a professional career in the electrical field.', 'active', '2026-08-18 04:38:13'),
(4, '004', 'National Certificate - Computer Hardware & Network Technician', 'The Computer Hardware & Network Technician qualification focuses on assembling, troubleshooting, and maintaining computer systems and network infrastructures.It provides learners with practical skills in hardware repair, networking, and system support for IT-related careers.', 'active', '2026-08-18 04:38:53'),
(5, '005', 'National Diploma - Quantity Surveying', 'As a Levelâ€¯4 Quantity Surveying Assistant, you support costâ€‘estimating, takeâ€‘offs, tendering and contract administration under supervision of a qualified quantity surveyor.You assist in preparing bills of quantities, tracking project costs, measuring works, and maintaining accurate financial records to ensure construction projects stay on budget.', 'active', '2026-08-18 04:39:33'),
(6, '006', 'National Certificate - Professional Baker/Commis (Pastry & Bakery)', 'As a Levelâ€¯4 Baker/Commis in Pastry &â€¯Bakery, you independently prepare breads, cakes, pastries and desserts, following recipes and industry standards for quality, hygiene and presentation.You take responsibility for arranging workstations, measuring ingredients, baking and decorating a range of bakery products, and ensuring safe operation of bakery equipment.', 'active', '2026-08-18 04:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `course_instructors`
--

CREATE TABLE `course_instructors` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `assigned_date` date DEFAULT curdate(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_instructors`
--

INSERT INTO `course_instructors` (`id`, `course_id`, `instructor_id`, `assigned_date`, `status`) VALUES
(1, 1, 3, '2026-08-18', 'active'),
(2, 3, 4, '2026-08-18', 'inactive'),
(3, 5, 5, '2026-08-18', 'active'),
(4, 2, 4, '2026-08-18', 'active'),
(5, 3, 6, '2026-08-18', 'active'),
(6, 6, 7, '2026-08-18', 'active'),
(7, 4, 8, '2026-08-18', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `course_students`
--

CREATE TABLE `course_students` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `enrolled_date` date DEFAULT curdate(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_students`
--

INSERT INTO `course_students` (`id`, `course_id`, `student_id`, `enrolled_date`, `status`) VALUES
(1, 1, 1, '2026-08-18', 'active'),
(2, 1, 2, '2026-08-18', 'active'),
(3, 1, 3, '2026-08-18', 'active'),
(4, 1, 4, '2026-08-18', 'active'),
(5, 1, 5, '2026-08-18', 'active'),
(6, 1, 6, '2026-08-18', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `monitors`
--

CREATE TABLE `monitors` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `monitor_username` varchar(50) NOT NULL,
  `monitor_password` varchar(255) NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `assigned_date` date DEFAULT curdate(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monitors`
--

INSERT INTO `monitors` (`id`, `course_id`, `student_id`, `monitor_username`, `monitor_password`, `assigned_by`, `assigned_date`, `status`) VALUES
(1, 1, 4, 'yash', '$2y$10$qq2ZWB9sTviM6zE.LYaSaeG.XwURkiQsUx4RIwxUlQi0DEFF8jMxC', 3, '2026-08-18', 'inactive'),
(2, 1, 3, 'udari', '$2y$10$5lLerumS6z7Kpw5C2WyEz.7BUJ5PoQ0qpg48ahazUc5C2qOnO/oWq', 3, '2026-08-18', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_no` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_no`, `name`, `address`, `dob`, `gender`, `nic`, `contact`, `status`, `created_at`) VALUES
(1, 'S001', 'R.Nanayakkara', 'Senasuma,Ginimellagaha', '2005-01-31', 'Female', '200553104336', '0776592343', 'active', '2026-08-18 04:45:49'),
(2, 'S002', 'Ishadi Umayangana', 'Ampegama,Meetiyagoda', '2005-06-05', 'Female', '200546539831', '0778965430', 'active', '2026-08-18 04:47:21'),
(3, 'S003', 'Udari Maduwanthi', 'Unanwitiya,,Baddegama', '2004-04-28', 'Female', '200456789870', '0776895430', 'active', '2026-08-18 04:49:05'),
(4, 'S004', 'Yash Withana', 'Ranawiru Village,Baddegama', '2005-03-05', 'Female', '200547896321', '0776894530', 'active', '2026-08-18 04:50:29'),
(5, 'S005', 'Nikesha Thejavi', 'Ambalangoda', '2006-06-04', 'Female', '200632540142', '0776845201', 'active', '2026-08-18 04:52:31'),
(6, 'S006', 'Chamathka Arunodie', 'Baddegama', '2005-06-29', 'Female', '200542679812', '0778459630', 'active', '2026-08-18 04:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','instructor','monitor') NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `role`, `status`, `created_at`) VALUES
(2, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System Administrator', 'admin@institute.com', 'admin', 'active', '2026-08-17 07:16:23'),
(3, 'raveesha', '$2y$10$9ANOhhR6DTdXyw1GRq68AuxW6WQP83HZt8.gowaR36l8IIK2QCMaS', 'T.P.G.raveesha', 'ravee@gmail.com', 'instructor', 'active', '2026-08-18 04:33:14'),
(4, 'nishantha', '$2y$10$fuZDIpaVVx9zDD/dAKCgFuXsFeJdA/IbAJmGGVTJTVvrkFaxw3uCK', 'U.G.P.K. Nishantha', 'nishantha@gmail.com', 'instructor', 'active', '2026-08-18 07:20:01'),
(5, 'swarnanimna', '$2y$10$TmIjS4Ucq0miLCgSW/X6VuFNEWLHcC/5xx.6/JypcIC13gkh8eOw6', 'A.I. Swarnanimna', 'swarnanimna@gmail.com', 'instructor', 'active', '2026-08-18 07:21:58'),
(6, 'priyanka', '$2y$10$AtHXEUdE4n6TFR.eGPRCWurvDCaoA4Yj1aUzg8jLLlHKhSZ6VjtMu', 'L.L. Priyanka', 'priyanka@gmail.com', 'instructor', 'active', '2026-08-18 07:23:30'),
(7, 'gamage', '$2y$10$03sVwQLUEFE5FTzcgL8H5u98/IgoGj32idmLP5qvAs2tWWVVoIM62', 'K.G.D Gamage', 'gamage@gmail.com', 'instructor', 'active', '2026-08-18 07:24:28'),
(8, 'sooriarachchi', '$2y$10$puoIJBc6N4xPwQaTrctMu.wS6T9rD1CMD2IG3bsaV3eblGv6uUfXi', 'T.M. Sooriarachchi', 'soori@gmail.com', 'instructor', 'active', '2026-08-18 07:25:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `unique_attendance` (`student_id`,`course_id`,`attendance_date`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `marked_by` (`marked_by`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`);

--
-- Indexes for table `course_instructors`
--
ALTER TABLE `course_instructors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `course_students`
--
ALTER TABLE `course_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `monitors`
--
ALTER TABLE `monitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `monitor_username` (`monitor_username`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `assigned_by` (`assigned_by`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_no` (`student_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_instructors`
--
ALTER TABLE `course_instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_students`
--
ALTER TABLE `course_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `monitors`
--
ALTER TABLE `monitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`marked_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `course_instructors`
--
ALTER TABLE `course_instructors`
  ADD CONSTRAINT `course_instructors_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `course_instructors_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `course_students`
--
ALTER TABLE `course_students`
  ADD CONSTRAINT `course_students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `course_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `monitors`
--
ALTER TABLE `monitors`
  ADD CONSTRAINT `monitors_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `monitors_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `monitors_ibfk_3` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
