-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2019 at 07:26 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management_education_vuejs_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `class_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_quantity` int(11) NOT NULL,
  `current_quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `module_id`, `class_code`, `room`, `max_quantity`, `current_quantity`, `created_at`, `updated_at`) VALUES
(10, 22, 'C2125', 'D405', 20, 0, '2019-10-03 09:39:50', '2019-10-03 09:39:50'),
(11, 22, 'C8125', 'D608', 30, 0, '2019-10-03 09:40:12', '2019-10-03 09:40:12'),
(12, 22, 'C8552', 'D403', 40, 1, '2019-10-03 09:40:46', '2019-10-03 10:21:18'),
(13, 22, 'C3015', 'D708', 15, 0, '2019-10-03 09:41:07', '2019-10-03 09:41:07'),
(14, 21, 'C4150', 'D307', 40, 0, '2019-10-03 09:42:18', '2019-10-03 09:42:18'),
(15, 21, 'C5922', 'D306', 10, 0, '2019-10-03 09:42:43', '2019-10-03 09:42:43'),
(16, 21, 'C4387', 'D302', 30, 0, '2019-10-03 09:43:03', '2019-10-03 09:43:03'),
(17, 21, 'C5348', 'D203', 50, 0, '2019-10-03 09:43:23', '2019-10-03 09:43:23'),
(18, 20, 'C6485', 'D102', 10, 0, '2019-10-03 09:44:13', '2019-10-03 09:44:13'),
(19, 20, 'C1454', 'D104', 30, 0, '2019-10-03 09:44:37', '2019-10-03 09:44:37'),
(20, 20, 'C1920', 'D506', 20, 0, '2019-10-03 09:45:04', '2019-10-03 09:45:04'),
(21, 20, 'C5550', 'D108', 25, 0, '2019-10-03 09:45:18', '2019-10-03 09:45:18'),
(22, 19, 'C2812', 'C302', 10, 0, '2019-10-03 09:45:32', '2019-10-03 09:45:32'),
(23, 19, 'C2141', 'C201', 5, 0, '2019-10-03 09:45:58', '2019-10-03 09:45:58'),
(24, 19, 'C4358', 'C207', 30, 0, '2019-10-03 09:46:22', '2019-10-03 09:46:22'),
(25, 19, 'C4846', 'C208', 25, 0, '2019-10-03 09:46:39', '2019-10-03 09:46:39'),
(26, 18, 'C7628', 'C607', 15, 0, '2019-10-03 09:47:11', '2019-10-03 09:47:11'),
(27, 18, 'C8456', 'C304', 20, 1, '2019-10-03 09:47:34', '2019-10-03 10:21:35'),
(28, 18, 'C4903', 'C405', 20, 0, '2019-10-03 09:47:53', '2019-10-03 09:47:53'),
(29, 18, 'C3295', 'C506', 40, 0, '2019-10-03 09:48:48', '2019-10-03 09:48:48'),
(30, 17, 'C9851', 'E203', 10, 0, '2019-10-03 09:49:00', '2019-10-03 09:49:00'),
(31, 17, 'C6988', 'E201', 20, 0, '2019-10-03 09:49:15', '2019-10-03 09:49:15'),
(32, 17, 'C8100', 'E205', 25, 1, '2019-10-03 09:49:32', '2019-10-03 10:18:32'),
(33, 17, 'C9517', 'E405', 30, 0, '2019-10-03 09:50:12', '2019-10-03 09:50:12'),
(34, 16, 'C5321', 'E506', 20, 0, '2019-10-03 09:50:28', '2019-10-03 09:50:28'),
(35, 16, 'C1169', 'E402', 15, 0, '2019-10-03 09:50:42', '2019-10-03 09:50:42'),
(36, 16, 'C5660', 'E406', 10, 0, '2019-10-03 09:51:04', '2019-10-03 09:51:04'),
(37, 16, 'C1356', 'E408', 25, 0, '2019-10-03 09:51:21', '2019-10-03 09:51:21'),
(38, 15, 'C4674', 'E305', 20, 0, '2019-10-03 09:51:36', '2019-10-03 09:51:36'),
(39, 15, 'C7207', 'E304', 10, 0, '2019-10-03 09:51:57', '2019-10-03 09:51:57'),
(40, 15, 'C4062', 'E307', 5, 0, '2019-10-03 09:52:17', '2019-10-03 09:52:17'),
(41, 15, 'C2837', 'E302', 20, 0, '2019-10-03 09:52:29', '2019-10-03 09:52:29'),
(42, 14, 'C1107', 'T102', 10, 0, '2019-10-03 09:53:03', '2019-10-03 09:53:03'),
(43, 14, 'C9389', 'T104', 10, 0, '2019-10-03 09:53:16', '2019-10-03 09:53:16'),
(44, 14, 'C8679', 'T105', 5, 0, '2019-10-03 09:53:29', '2019-10-03 09:53:29'),
(45, 22, 'C1716', 'T107', 15, 0, '2019-10-03 09:53:47', '2019-10-03 09:53:47'),
(46, 14, 'C6953', 'T108', 15, 0, '2019-10-03 09:54:07', '2019-10-03 09:54:07'),
(47, 13, 'C7845', 'T203', 20, 0, '2019-10-03 09:54:17', '2019-10-03 09:54:17'),
(48, 13, 'C7430', 'T204', 10, 0, '2019-10-03 09:54:29', '2019-10-03 09:54:29'),
(49, 22, 'C2208', 'T205', 5, 0, '2019-10-03 09:54:41', '2019-10-03 10:18:14'),
(50, 13, 'C3696', 'T304', 20, 0, '2019-10-03 09:54:59', '2019-10-03 09:54:59'),
(51, 12, 'C1700', 'T306', 20, 0, '2019-10-03 09:55:15', '2019-10-03 09:55:15'),
(52, 12, 'C6351', 'T307', 10, 0, '2019-10-03 09:55:27', '2019-10-03 09:55:27'),
(53, 12, 'C1080', 'T405', 5, 0, '2019-10-03 09:55:37', '2019-10-03 09:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_01_000632_create_students_table', 1),
(4, '2019_10_02_072232_create_modules_table', 2),
(5, '2019_10_02_072511_create_classes_table', 3),
(6, '2019_10_02_171622_create_student_modules_table', 4),
(7, '2019_10_02_171905_create_student_classes_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `module_code`, `description`, `created_at`, `updated_at`) VALUES
(12, 'Kỹ thuật lập trình', 'M6682', 'Description Kỹ thuật lập trình', '2019-10-03 09:33:40', '2019-10-03 09:33:40'),
(13, 'Nhập môn CNTT và TT', 'M1893', 'Description Nhập môn CNTT và TT', '2019-10-03 09:34:15', '2019-10-03 09:34:15'),
(14, 'Nhập môn các phương pháp tối ưu', 'M9423', 'Description Nhập môn các phương pháp tối ưu', '2019-10-03 09:34:39', '2019-10-03 09:34:39'),
(15, 'Nhập môn trí tuệ nhân tạo', 'M1025', 'Description Nhập môn trí tuệ nhân tạo', '2019-10-03 09:35:07', '2019-10-03 09:35:07'),
(16, 'Kiến trúc máy tính', 'M1627', 'Description Kiến trúc máy tính', '2019-10-03 09:35:59', '2019-10-03 09:35:59'),
(17, 'Lập trình hướng đối tượng', 'M8195', 'Description Lập trình hướng đối tượng', '2019-10-03 09:36:27', '2019-10-03 09:36:27'),
(18, 'Nhập môn công nghệ phần mềm', 'M9425', 'Description Nhập môn công nghệ phần mềm', '2019-10-03 09:37:03', '2019-10-03 09:37:03'),
(19, 'Mạng máy tính', 'M2679', 'Description Mạng máy tính', '2019-10-03 09:37:34', '2019-10-03 09:37:34'),
(20, 'Cơ sở dữ liệu', 'M6529', 'Description Cơ sở dữ liệu', '2019-10-03 09:37:59', '2019-10-03 09:37:59'),
(21, 'Tin học đại cương', 'M1895', 'Description Tin học đại cương', '2019-10-03 09:38:25', '2019-10-03 09:38:25'),
(22, 'Toán rời rạc', 'M7885', 'Description Toán rời rạc', '2019-10-03 09:39:01', '2019-10-03 09:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `student_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_code`, `name`, `address`, `phone`, `image`, `created_at`, `updated_at`) VALUES
(1, 4, 'S2218', 'Tony Tran', 'HaNoi', '0337724134', 'S2218.jfif', '2019-10-01 03:10:24', '2019-10-03 10:01:57'),
(2, 5, 'S9934', NULL, NULL, NULL, 'default.png', '2019-10-01 23:11:20', '2019-10-01 23:11:20'),
(3, 6, 'S6032', NULL, NULL, NULL, 'default.png', '2019-10-01 23:11:44', '2019-10-01 23:11:44'),
(4, 7, 'S1775', NULL, NULL, NULL, 'default.png', '2019-10-01 23:12:03', '2019-10-01 23:12:03'),
(5, 8, 'S3970', NULL, NULL, NULL, 'default.png', '2019-10-01 23:12:26', '2019-10-01 23:12:26'),
(6, 9, 'S3233', NULL, NULL, NULL, 'default.png', '2019-10-01 23:13:27', '2019-10-01 23:13:27'),
(7, 10, 'S6786', NULL, NULL, NULL, 'default.png', '2019-10-01 23:13:49', '2019-10-01 23:13:49'),
(8, 11, 'S9314', NULL, NULL, NULL, 'default.png', '2019-10-01 23:14:09', '2019-10-01 23:14:09'),
(9, 12, 'S7189', NULL, NULL, NULL, 'default.png', '2019-10-01 23:14:24', '2019-10-01 23:14:24'),
(10, 13, 'S1657', 'Student 10', 'HungYen', '033772413410', 'S1657.jpg', '2019-10-01 23:14:40', '2019-10-01 23:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_module_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `student_module_id`, `class_id`, `student_id`, `created_at`, `updated_at`) VALUES
(3, 11, 32, 1, '2019-10-03 10:18:32', '2019-10-03 10:18:32'),
(4, 6, 12, 1, '2019-10-03 10:21:18', '2019-10-03 10:21:18'),
(5, 10, 27, 1, '2019-10-03 10:21:35', '2019-10-03 10:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `student_modules`
--

CREATE TABLE `student_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_modules`
--

INSERT INTO `student_modules` (`id`, `module_id`, `student_id`, `created_at`, `updated_at`) VALUES
(6, 22, 1, '2019-10-03 10:02:06', '2019-10-03 10:02:06'),
(7, 21, 1, '2019-10-03 10:02:14', '2019-10-03 10:02:14'),
(8, 20, 1, '2019-10-03 10:02:23', '2019-10-03 10:02:23'),
(9, 19, 1, '2019-10-03 10:02:30', '2019-10-03 10:02:30'),
(10, 18, 1, '2019-10-03 10:02:35', '2019-10-03 10:02:35'),
(11, 17, 1, '2019-10-03 10:02:43', '2019-10-03 10:02:43'),
(12, 15, 1, '2019-10-03 10:02:48', '2019-10-03 10:02:48'),
(13, 14, 1, '2019-10-03 10:02:57', '2019-10-03 10:02:57'),
(14, 12, 1, '2019-10-03 10:03:07', '2019-10-03 10:03:07'),
(15, 13, 1, '2019-10-03 10:03:12', '2019-10-03 10:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'tonytranadmin@gmail.com', NULL, '$2y$10$t8gHtuZnN23TZXe51uMT/.ZtDEiCoAkjoXL/MZVwMvEITJZaeM8Ja', '1Lk5G0zpo6eMcuMaCkBY60l1acvZFXK3NAM6pQeAkPAatyFjxJo7SeO9HTiP', '2019-10-01 03:02:31', '2019-10-01 03:02:31'),
(4, 0, 'student1@gmail.com', NULL, '$2y$10$4HkNHy7scBDW67089YNv0emm9N28JGrpaZyylWHf0gyiUui/nmoTa', 'mM64bUj1OEdd4SPCIBjRpIoynvo7r44jDitan7i3XZc4zAtYAgHeW8tSZsNd', '2019-10-01 03:10:23', '2019-10-01 03:10:23'),
(5, 0, 'student2@gmail.com', NULL, '$2y$10$xblkB5MTMgjH5DZnKzBpmOoxKTx8mAWNXZ0rvdcBkf9pECAkADica', '9UX9d4kLxaKqqa55u9aQ8ghx9X7bP0heVgxDT1iE8kxifFPvob9kBI1VShLd', '2019-10-01 23:11:20', '2019-10-01 23:11:20'),
(6, 0, 'student3@gmail.com', NULL, '$2y$10$2rBLZVDauDkiXGbSsNcElOvLzB.ujKWOaKLu8qGUEZwGfJK4x5QEy', 'tSB48Sj4AGlXjRV8q0mVlWx7RlaZxt9Er3D7PvnzqKN9RGjmefTFwM8Hxgcw', '2019-10-01 23:11:44', '2019-10-01 23:11:44'),
(7, 0, 'student4@gmail.com', NULL, '$2y$10$Xlv6Rv9brejg8Mf1t2xMNeVIeJdZdb.3356t/rPpDlK.ORHZr4qPe', 'wPuiIY11qr7QtaT5dvbomf0pSK9Q5rw1bmDZud9mhYk1EfH63FklRXtMYA6N', '2019-10-01 23:12:03', '2019-10-01 23:12:03'),
(8, 0, 'student5@gmail.com', NULL, '$2y$10$HRz10umIXb9DB3vduHMnEeW2AA0Ppyrg54FpM5Gwd9bNDdcn9BcR6', 'qpylM7rAKi95YtJ4L2Lv2heS2d1eyBFBI6sNXmaRjYs05x3zxZX7Xr3pYw29', '2019-10-01 23:12:26', '2019-10-01 23:12:26'),
(9, 0, 'student6@gmail.com', NULL, '$2y$10$wSlE3.wOtfjI5QsoBlcKV.LpGx4qL0ciDslFijoIYiwvgj.nY5HS2', 'GhUHL4VFDevN0GZKv0jQri9qX0SD8FHUwzIZaKwiUSUrXJghDfcK3lNgBbyv', '2019-10-01 23:13:27', '2019-10-01 23:13:27'),
(10, 0, 'student7@gmail.com', NULL, '$2y$10$k.nRt10q0.22dr1PPaBMa.4pEQDjoAO2lC0EAayH1DNyJ/.cpyWki', 'jTJoxiNWTkzhKP9vL8naHKyX0JcVq0wmCCrXLTt7nIHVyNAu6EZGPtNHnRPI', '2019-10-01 23:13:49', '2019-10-01 23:13:49'),
(11, 0, 'student8@gmail.com', NULL, '$2y$10$0iG/S7ggFNx9Tkwh.pS6Yu.o2.9XRbAK/4iWvWZbfKy3MCWFJYOU6', 'JHvYx9Rurc7BvdT6mLLh37EdYZ1rNfpVm7CoLR8aRZRbAYwC8QejlNWL1ZLn', '2019-10-01 23:14:09', '2019-10-01 23:14:09'),
(12, 0, 'student9@gmail.com', NULL, '$2y$10$KvsMHQ06Wkkkj0ve6sKS.uenRZjT9G4IEgCEMTlkY.3zQpRHKLmGO', '8vhxiegdsvktOj9cSrhHSoLaszHeDKB5jJhyyUMgO6vYpEQYClCkMLgmwFiT', '2019-10-01 23:14:24', '2019-10-01 23:14:24'),
(13, 0, 'student10@gmail.com', NULL, '$2y$10$ibpAyUhJKwE.Y/XdVerY0uXVPy8HuVIIEWuHFHufoXUAsIob3O5vy', 'OsedeIiu41WWugiKjBMBiyD1mtcCyCsuO8HtPqy3wMJHM0GwlkcQdatRCQEX', '2019-10-01 23:14:40', '2019-10-01 23:14:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_module_id_foreign` (`module_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_user_id_foreign` (`user_id`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_classes_student_module_id_foreign` (`student_module_id`),
  ADD KEY `student_classes_class_id_foreign` (`class_id`),
  ADD KEY `student_classes_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_modules`
--
ALTER TABLE `student_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_modules_module_id_foreign` (`module_id`),
  ADD KEY `student_modules_student_id_foreign` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_modules`
--
ALTER TABLE `student_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD CONSTRAINT `student_classes_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_classes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_classes_student_module_id_foreign` FOREIGN KEY (`student_module_id`) REFERENCES `student_modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_modules`
--
ALTER TABLE `student_modules`
  ADD CONSTRAINT `student_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_modules_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
