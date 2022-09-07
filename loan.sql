-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2022 at 09:15 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan`
--

-- --------------------------------------------------------

--
-- Table structure for table `loan_emi`
--

CREATE TABLE `loan_emi` (
  `id` bigint(255) NOT NULL,
  `loan_id` bigint(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `emi_ammount` varchar(255) DEFAULT NULL,
  `scheduled_repayment_date` date DEFAULT NULL,
  `is_paid` int(2) DEFAULT 0 COMMENT '0=>Pending, 1=>Paid',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_emi`
--

INSERT INTO `loan_emi` (`id`, `loan_id`, `user_id`, `emi_ammount`, `scheduled_repayment_date`, `is_paid`, `updated_at`, `created_at`) VALUES
(16, 6, 24, '3333.33', '2022-09-14', 0, '2022-09-07 18:38:06', '2022-09-07 18:38:06'),
(17, 6, 24, '3333.33', '2022-09-21', 0, '2022-09-07 18:38:06', '2022-09-07 18:38:06'),
(18, 6, 24, '3333.33', '2022-09-28', 0, '2022-09-07 18:38:06', '2022-09-07 18:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `loan_registered`
--

CREATE TABLE `loan_registered` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `net_monthly_salary` varchar(55) DEFAULT NULL,
  `loan_ammount` varchar(55) DEFAULT NULL,
  `loan_term` int(10) NOT NULL DEFAULT 0,
  `repay_duration_type` int(2) NOT NULL DEFAULT 1 COMMENT '1=>Weekly, 2=>Monthly, 3=>Yearly',
  `emi_amount` varchar(255) DEFAULT NULL,
  `total_emi` int(10) DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT 0 COMMENT '0=>Incomplete, 1=>Paid Complete',
  `is_approved` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=>Approved',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_registered`
--

INSERT INTO `loan_registered` (`id`, `user_id`, `net_monthly_salary`, `loan_ammount`, `loan_term`, `repay_duration_type`, `emi_amount`, `total_emi`, `status`, `is_approved`, `updated_at`, `created_at`, `is_deleted`) VALUES
(6, 30, '5000', '10000', 3, 1, NULL, NULL, 0, 1, '2022-09-07 18:38:06', '2022-09-07 18:30:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0f1c98f5cf78238c721b5c9b9780cf2ae25448b010c48bf174d853f026d222f9381a8e494d0a78ed', 24, 1, 'MyApp', '[]', 0, '2022-09-07 05:05:32', '2022-09-07 05:05:32', '2023-09-07 10:35:32'),
('10e231691100bf77cbdf22d85f7abe1e33b0d683b279a1f63a63d3156d062be2c471e2462f500b81', 20, 1, 'MyApp', '[]', 0, '2021-02-04 04:13:38', '2021-02-04 04:13:38', '2022-02-04 09:43:38'),
('17154ae4c405bbff5cf0031f67524065d9c0dafd256520ff87c217ad765de6610a66195028e82b6b', 1, 1, 'MyApp', '[]', 0, '2022-09-07 13:02:04', '2022-09-07 13:02:04', '2023-09-07 18:32:04'),
('1d917a5b8df3de06f1d3e7ef4402ddc3002087fe53a1bae943bd4b74e2672965840192798b9da06f', 18, 1, 'MyApp', '[]', 0, '2021-02-04 04:11:14', '2021-02-04 04:11:14', '2022-02-04 09:41:14'),
('43a98cba6e7a2462cb704f59b9eabd83b8b0bb49d69a869261192960de173dd13dc78656656a0f84', 21, 1, 'MyApp', '[]', 0, '2021-02-04 04:15:48', '2021-02-04 04:15:48', '2022-02-04 09:45:48'),
('45dfaab10ab317f62d07ae7830c6bf88bc04401c611850ade885493e2c04d1ad3d183af50c26c280', 19, 1, 'MyApp', '[]', 0, '2021-02-04 04:11:35', '2021-02-04 04:11:35', '2022-02-04 09:41:35'),
('5092ae88fe226fa7419a1e82cf60ce9c54b1c76e94ecdb2326ae2433fa797c0cf9e776888a5cc4da', 30, 1, 'MyApp', '[]', 0, '2022-09-07 12:57:22', '2022-09-07 12:57:22', '2023-09-07 18:27:22'),
('5845a6c102d02eb30abebf836aa61197503de733aef6526c60e920e414b53dfd2d068c2f74934593', 2, 1, 'MyApp', '[]', 0, '2021-02-04 07:01:46', '2021-02-04 07:01:46', '2022-02-04 12:31:46'),
('a0a6fcdb7f728f8dd67ef58dd0d2f7fd92c73c32fe5ff0bb247952f932a24352bd125fa7f8b1616d', 21, 1, 'MyApp', '[]', 0, '2021-02-04 04:15:37', '2021-02-04 04:15:37', '2022-02-04 09:45:37'),
('f38bd16993a9d60fe7f31da3f70fea0ecfa71cfce69360f31773d062712450b9f1fd652449f728ad', 17, 1, 'MyApp', '[]', 0, '2021-02-04 04:10:19', '2021-02-04 04:10:19', '2022-02-04 09:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'MaeQGuZDcumA4JaMaTmVZkwphcP2YkSRxmHQvn0Y', NULL, 'http://localhost', 1, 0, 0, '2021-02-03 05:48:29', '2021-02-03 05:48:29'),
(2, NULL, 'Laravel Password Grant Client', 'f9n46qiZb2uV7FIRuGqiBgkmQfNd0cbmf8G0DaBg', 'users', 'http://localhost', 0, 1, 0, '2021-02-03 05:48:29', '2021-02-03 05:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-02-03 05:48:29', '2021-02-03 05:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `registered_name` varchar(100) DEFAULT NULL,
  `registered_email` varchar(255) DEFAULT NULL,
  `registered_mobile` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `voucher_name` varchar(500) DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `discount_in_percentage` varchar(500) DEFAULT NULL,
  `final_percentage_price` varchar(255) DEFAULT NULL,
  `final_payable_price` varchar(255) DEFAULT NULL,
  `voucher_url` varchar(500) DEFAULT NULL,
  `status` int(5) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `registered_name`, `registered_email`, `registered_mobile`, `name`, `email`, `mobile`, `message`, `voucher_name`, `total_price`, `discount_in_percentage`, `final_percentage_price`, `final_payable_price`, `voucher_url`, `status`, `created_at`) VALUES
(1, 37, 'Amit Kumar', 'amitrathore48@gmail.com', '9716962996', 'Amit Kumar', 'amitrathore48@gmail.com', '9716962996', 'This is my first message ', 'Aeropostale', '2000', '5', '100', '1900', 'https://tymkfreesky.s3.amazonaws.com/b2b/cashVoucher/a77928cf-5b1d-4442-a3ee-0dff704b4716.jpeg', 1, '2022-03-01 17:19:39'),
(45982, 37, 'Amit Kumar', 'amitrathore48@gmail.com', '9716962996', 'Testing', 'test@gmail.com', '8566585538', 'trrtt', 'Arrow', '1000', '15', '150', '850', 'https://tymkfreesky.s3.amazonaws.com/b2b/cashVoucher/130b545e-c3d9-4145-8589-afd24f82470c.jpeg', 1, '2022-03-01 17:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('amitrathore48@gmail.com', '$2y$10$m59iIrxgfZGRxxABSsz9JOfbpVSZ5rPnVpavYMPkI/6mAiWpRrrD.', '2021-02-01 04:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `user_role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>User, 1=>Admin ',
  `gender` tinyint(1) DEFAULT 2 COMMENT '1=>Female, 2=>Male',
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>Unblock,1=>blocked',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `confirm_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>Not, 1=>Confirmed',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=>Inactive, 1=>Active',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `date_of_birth`, `user_role`, `gender`, `about`, `city`, `device_token`, `remember_token`, `is_block`, `email_verified_at`, `confirm_status`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, 'admin@loan.com', '$2y$10$BfAQmVW5VWooK9ENtBoT5u5SG0kFpnMKvfMLW3OYIkTRjluElMmIG', NULL, NULL, 1, 2, NULL, NULL, NULL, 'H34TDqG5Fhm41AGQI3YeM4DV3v6dKvTjVvrFAWHAwb46NtQNerTBLkmaNbrc', 0, NULL, 0, 1, 0, '2021-02-01 04:31:03', '2021-02-01 04:31:03'),
(24, 'Amit', 'Rathore', 'amitrathore48@gmail.com', '$2y$10$eff8S4vJJYDi7rXSZ.qOfu8Th1HtNFj4BfB.teM9GdRC3tDYD56m6', '9716962906', '1995-07-12', 1, 1, 'I am a Software engineer', 'Delhi', 'kJKGhSAEWSkshjkdg786278KJHJKHdg78623uighjkahjkdhjJHJKBJKBJKhouihy8374y8', NULL, 0, NULL, 1, 1, 0, '2022-09-03 12:32:16', '2022-09-03 12:32:16'),
(30, 'Anup', 'Singh', 'anupsingh@gmail.com', '$2y$10$.chpdq1Sl.jm3MspgN5IweamigTdO9Ndq4HanWQHRAfJgrfVe37S2', '9716962906', '1995-07-12', 0, 1, 'I am a Software engineer', 'Delhi', 'kJKGhSAEWSkshjkdg786278KJHJKHdg78623uighjkahjkdhjJHJKBJKBJKhouihy8374y8', NULL, 0, NULL, 1, 1, 0, '2022-09-07 12:53:58', '2022-09-07 12:53:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loan_emi`
--
ALTER TABLE `loan_emi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_registered`
--
ALTER TABLE `loan_registered`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loan_emi`
--
ALTER TABLE `loan_emi`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `loan_registered`
--
ALTER TABLE `loan_registered`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45983;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
