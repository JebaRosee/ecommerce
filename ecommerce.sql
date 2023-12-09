-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 05:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'JKB', '9486482633', 1, 'def.png', 'jkbtextiles@gmail.com', NULL, '$2y$10$0m4Aem0467vPbZP.UD91keHuldsXoYqnJBg7U9vz/LRUa60wh.IP2', '1mcdSvjePCwkzxE7LpizAF44NvEPUBi045KJfUxeNVU7ITLP2g4Hbb6E4npK', '2023-09-13 07:16:30', '2023-09-13 07:16:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00),
(2, 1, 0, 0, '2023-09-13 07:16:31', '2023-09-13 07:16:31', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Colour', '2023-09-13 08:11:03', '2023-09-13 08:11:30'),
(2, 'Size', '2023-09-13 08:11:08', '2023-09-13 08:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `button_text` varchar(191) DEFAULT NULL,
  `background_color` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`, `title`, `sub_title`, `button_text`, `background_color`) VALUES
(1, '2023-09-13-650174e2c3971.png', 'Main Banner', 1, '2023-09-13 08:37:54', '2023-09-13 08:37:58', 'http://localhost/ecommerce/', 'product', 1, NULL, NULL, NULL, NULL),
(2, '2023-09-13-650175357dbb3.png', 'Main Banner', 1, '2023-09-13 08:39:17', '2023-09-20 11:10:39', 'http://localhost/ecommerce/', 'product', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TWIN BIRD', '2023-09-13-65016e16c910e.png', 1, '2023-09-13 08:08:54', '2023-09-13 08:08:54'),
(2, 'PRISMA', '2023-09-13-65016e26604a3.png', 1, '2023-09-13 08:09:10', '2023-09-13 08:09:10'),
(3, 'GO COLORS', '2023-09-13-65016e637ab4e.png', 1, '2023-09-13 08:10:11', '2023-09-13 08:10:11'),
(4, 'NON BRAND', '2023-09-13-65017320d9e8f.png', 1, '2023-09-13 08:30:24', '2023-09-13 08:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 07:43:44', '2023-09-13 07:20:33'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":2,\"name\":\"Tamil\",\"direction\":\"ltr\",\"code\":\"in\",\"status\":0,\"default\":false}]', '2020-10-11 07:53:02', '2023-09-13 07:29:39'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '9999999999', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'JKB TEXTILES', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-09-13-6501614eeb005.png', NULL, '2023-09-13 01:44:22'),
(13, 'company_mobile_logo', '2023-09-13-6501614eef0ea.png', NULL, '2023-09-13 01:44:22'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'jkbtextiles@gmai.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#f5006a\",\"secondary\":\"#000000\",\"primary_light\":\"#CFDFFB\"}', '2020-10-11 13:53:02', '2023-12-06 02:27:44'),
(19, 'company_footer_logo', '2023-09-13-6501614f00f6e.png', NULL, '2023-09-13 01:44:23'),
(20, 'company_copyright_text', 'CopyRight jebarosee@2023', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2023-09-13-6501614f04fc1.png', '2020-10-11 13:53:02', '2023-09-13 01:44:23'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"in\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"1\"}]', NULL, '2023-09-13 07:19:13'),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#ff00a2\",\"text_color\":\"#ffffff\",\"announcement\":\"BEST INFORMATION TODAY\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":\"1\",\"site_key\":null,\"secret_key\":null}', '2023-09-13 07:18:40', '2023-09-13 07:18:40'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":\"1\",\"environment\":\"sandbox\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}', NULL, '2023-09-13 07:18:11'),
(70, 'refund_day_limit', '7', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'JKB Textiles', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '1', NULL, NULL),
(77, 'loyalty_point_status', '1', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '0', NULL, '2023-09-13 07:16:48'),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'refund-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(88, 'return-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(89, 'cancellation-policy', '{\"status\":1,\"content\":\"\"}', NULL, '2023-03-04 06:25:36'),
(90, 'offline_payment', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(91, 'temporary_close', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(92, 'vacation_add', '{\"status\":0,\"vacation_start_date\":null,\"vacation_end_date\":null,\"vacation_note\":null}', NULL, '2023-03-04 06:25:36'),
(93, 'cookie_setting', '{\"status\":0,\"cookie_text\":null}', NULL, '2023-03-04 06:25:36'),
(94, 'maximum_otp_hit', '0', NULL, '2023-06-13 13:04:49'),
(95, 'otp_resend_time', '30', NULL, '2023-06-13 13:04:49'),
(96, 'temporary_block_time', '0', NULL, '2023-06-13 13:04:49'),
(97, 'maximum_login_hit', '0', NULL, '2023-06-13 13:04:49'),
(98, 'temporary_login_block_time', '0', NULL, '2023-06-13 13:04:49'),
(99, 'timezone', 'Asia/Calcutta', NULL, NULL),
(100, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(101, 'loader_gif', '2023-09-13-65016175860d7.png', NULL, NULL),
(102, 'shop_banner', '2023-09-13-6501619c8b3fc.png', NULL, NULL),
(103, 'whatsapp', '{\"status\":\"1\",\"phone\":\"9345868908\"}', '2023-09-13 07:19:33', '2023-09-13 07:19:33'),
(104, 'currency_symbol_position', 'left', '2023-09-20 08:32:13', '2023-09-20 08:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `carddeposit`
--

CREATE TABLE `carddeposit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashdeposit`
--

CREATE TABLE `cashdeposit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `amount1` text DEFAULT NULL,
  `result1` text DEFAULT NULL,
  `amount2` text DEFAULT NULL,
  `result2` text DEFAULT NULL,
  `amount5` text DEFAULT NULL,
  `result5` text DEFAULT NULL,
  `amount10` text DEFAULT NULL,
  `result10` text DEFAULT NULL,
  `amount20` text DEFAULT NULL,
  `result20` text DEFAULT NULL,
  `amount50` text DEFAULT NULL,
  `result50` text DEFAULT NULL,
  `amount100` text DEFAULT NULL,
  `result100` text DEFAULT NULL,
  `amount200` text DEFAULT NULL,
  `result200` text DEFAULT NULL,
  `amount500` text DEFAULT NULL,
  `result500` text DEFAULT NULL,
  `amount2000` text DEFAULT NULL,
  `result2000` text DEFAULT NULL,
  `totalAmount` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cashdeposit`
--

INSERT INTO `cashdeposit` (`id`, `created_at`, `updated_at`, `bank_name`, `amount1`, `result1`, `amount2`, `result2`, `amount5`, `result5`, `amount10`, `result10`, `amount20`, `result20`, `amount50`, `result50`, `amount100`, `result100`, `amount200`, `result200`, `amount500`, `result500`, `amount2000`, `result2000`, `totalAmount`) VALUES
(1, '2023-12-06 11:25:54', '2023-12-06 11:25:54', 'City Union Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2023-12-06 11:30:56', '2023-12-06 11:30:56', 'HDFC Bank', '1', '1.00', '1', '2.00', '1', '5.00', '1', '10.00', '1', '20.00', '1', '50.00', '1', '100.00', '1', '200.00', '1', '500.00', '1', '2000.00', '2888.00'),
(3, '2023-12-06 11:34:19', '2023-12-06 11:34:19', 'Owner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', '10000.00', '10000.00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'WOMEN\'S', 'womens', '2023-09-13-6501678ed9a02.png', 0, 0, '2023-09-13 07:41:02', '2023-09-13 07:41:06', 1, 0),
(2, 'MEN\'S', 'mens', '2023-09-13-650167e25c093.png', 0, 0, '2023-09-13 07:42:26', '2023-09-13 07:43:14', 1, 1),
(3, 'BOY KIDS', 'boy-kids', '2023-09-13-650167f532cd0.png', 0, 0, '2023-09-13 07:42:45', '2023-09-13 07:43:13', 1, 1),
(4, 'GIRL KIDS', 'girl-kids', '2023-09-13-650168016766f.png', 0, 0, '2023-09-13 07:42:57', '2023-09-13 07:43:12', 1, 1),
(5, 'BABIES', 'babies', '2023-09-13-6501680d3e3ec.png', 0, 0, '2023-09-13 07:43:09', '2023-09-13 07:43:12', 1, 1),
(6, 'JWELLERY', 'jwellery', '2023-09-13-650168737e9f6.png', 0, 0, '2023-09-13 07:44:51', '2023-09-13 07:45:05', 1, 1),
(7, 'Kurti', 'kurti', '2023-09-13-65016ccf4370a.png', 1, 1, '2023-09-13 08:03:27', '2023-09-13 08:03:27', 0, 0),
(8, 'Bottom wear', 'bottom-wear', NULL, 1, 1, '2023-09-13 08:04:02', '2023-09-13 08:04:02', 0, 1),
(9, 'Shawls', 'shawls', NULL, 1, 1, '2023-09-13 08:04:28', '2023-09-13 08:04:28', 0, 0),
(10, 'Shirt', 'shirt', NULL, 2, 1, '2023-09-13 08:04:38', '2023-09-13 08:04:38', 0, 0),
(11, 'Bottom wear', 'bottom-wear', NULL, 2, 1, '2023-09-13 08:04:57', '2023-09-13 08:04:57', 0, 0),
(12, 'western', 'western', NULL, 4, 1, '2023-09-13 08:05:28', '2023-09-13 08:05:28', 0, 4),
(13, 'Night Wear', 'night-wear', NULL, 4, 1, '2023-09-13 08:05:54', '2023-09-13 08:05:54', 0, 1),
(14, 'NECLACE', 'neclace', NULL, 6, 1, '2023-09-23 10:37:36', '2023-09-23 10:37:36', 0, 1),
(15, 'EARINGS', 'earings', NULL, 6, 1, '2023-09-23 10:37:47', '2023-09-23 10:37:47', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 13:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2021-07-06 11:52:58'),
(3, 'Indian Rupi', '₹', 'INR', '60', 1, '2020-10-15 17:23:04', '2021-06-04 18:26:38'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-25 21:00:23', '2021-06-04 18:25:29'),
(5, 'YEN', '¥', 'JPY', '110', 1, '2021-06-10 22:08:31', '2021-06-26 14:21:10'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 1, '2021-07-03 11:08:33', '2021-07-03 11:10:37'),
(7, 'Rand', 'R', 'ZAR', '14.26', 1, '2021-07-03 11:12:38', '2021-07-03 11:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68),
(195, '2022_12_17_035723_few_field_add_to_coupons_table', 69),
(196, '2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders', 69),
(197, '2023_01_04_003034_alter_billing_addresses_change_zip', 69),
(198, '2023_01_05_121600_change_id_to_transactions_table', 69),
(199, '2023_02_02_113330_create_product_tag_table', 70),
(200, '2023_02_02_114518_create_tags_table', 70),
(201, '2023_02_02_152248_add_tax_model_to_products_table', 70),
(202, '2023_02_02_152718_add_tax_model_to_order_details_table', 70),
(203, '2023_02_02_171034_add_tax_type_to_carts', 70),
(204, '2023_02_06_124447_add_color_image_column_to_products_table', 70),
(205, '2023_02_07_120136_create_withdrawal_methods_table', 70),
(206, '2023_02_07_175939_add_withdrawal_method_id_and_withdrawal_method_fields_to_withdraw_requests_table', 70),
(207, '2023_02_08_143314_add_vacation_start_and_vacation_end_and_vacation_not_column_to_shops_table', 70),
(208, '2023_02_09_104656_add_payment_by_and_payment_not_to_orders_table', 70),
(209, '2023_03_27_150723_add_expires_at_to_phone_or_email_verifications', 71),
(210, '2023_04_17_095721_create_shop_followers_table', 71),
(211, '2023_04_17_111249_add_bottom_banner_to_shops_table', 71),
(212, '2023_04_20_125423_create_product_compares_table', 71),
(213, '2023_04_30_165642_add_category_sub_category_and_sub_sub_category_add_in_product_table', 71),
(214, '2023_05_16_131006_add_expires_at_to_password_resets', 71),
(215, '2023_05_17_044243_add_visit_count_to_tags_table', 71),
(216, '2023_05_18_000403_add_title_and_subtitle_and_background_color_and_button_text_to_banners_table', 71),
(217, '2023_05_21_111300_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_users_table', 71),
(218, '2023_05_21_111600_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_phone_or_email_verifications_table', 71),
(219, '2023_05_21_112215_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_password_resets_table', 71),
(220, '2023_06_04_210726_attachment_lenght_change_to_reviews_table', 71),
(221, '2023_10_19_132540_create_receipts_table', 72),
(222, '2023_10_19_165738_create_expenses_table', 73),
(223, '2023_10_25_201542_create_cashdeposit_table', 74),
(224, '2023_10_25_201609_create_carddeposit_table', 74);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `payment_by` varchar(191) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL,
  `cash_amt` decimal(10,0) DEFAULT NULL,
  `card_num` int(4) DEFAULT NULL,
  `card_code` int(6) DEFAULT NULL,
  `card_amt` decimal(10,0) DEFAULT NULL,
  `upi_amt` decimal(10,0) DEFAULT NULL,
  `upi_id` varchar(60) DEFAULT NULL,
  `credit_amt` decimal(10,0) DEFAULT NULL,
  `credit_remark` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `payment_by`, `payment_note`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`, `cash_amt`, `card_num`, `card_code`, `card_amt`, `upi_amt`, `upi_id`, `credit_amt`, `credit_remark`) VALUES
(100001, '0', 'customer', 'paid', 'delivered', 'cash', NULL, NULL, NULL, 899.1, '0.00', '0', NULL, NULL, '2023-09-20 07:43:18', '2023-09-20 07:43:18', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 10.00, 'percent', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100002, '0', 'customer', 'paid', 'delivered', 'card', NULL, NULL, NULL, 784, '0.00', '0', NULL, NULL, '2023-09-20 07:44:44', '2023-09-20 07:44:44', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100003, '0', 'customer', 'paid', 'delivered', 'card', NULL, NULL, NULL, 711, '0.00', '0', NULL, NULL, '2023-09-20 07:55:26', '2023-09-20 07:55:26', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '700', 4586, 785612, '700', NULL, NULL, NULL, NULL),
(100004, '0', 'customer', 'paid', 'delivered', 'upi', NULL, NULL, NULL, 999, '0.00', '0', NULL, NULL, '2023-09-20 07:59:28', '2023-09-20 07:59:28', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '500', 9999, 125641, '200', '200', 'hjftd@bj', '99', 'later'),
(100005, '0', 'customer', 'paid', 'delivered', 'credit', NULL, NULL, NULL, 349, '0.00', '0', NULL, NULL, '2023-09-20 08:14:58', '2023-09-20 08:14:58', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, '249', 'nhojij'),
(100006, '0', 'customer', 'paid', 'delivered', 'credit', NULL, NULL, NULL, 469, '0.00', '0', NULL, NULL, '2023-09-20 08:23:17', '2023-09-20 08:23:17', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '100', 4586, 785612, '100', '100', 'hjftd@bj', '169', 'later'),
(100007, '0', 'customer', 'paid', 'delivered', 'credit', NULL, NULL, NULL, 349, '0.00', '0', NULL, NULL, '2023-09-20 08:27:54', '2023-09-20 08:27:54', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, '200', 'hjftd@bj', '49', 'later'),
(100008, '0', 'customer', 'paid', 'delivered', 'credit', NULL, NULL, NULL, 349, '0.00', '0', NULL, NULL, '2023-09-20 08:31:05', '2023-09-20 08:31:05', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '100', NULL, NULL, NULL, '100', 'hjftd@bj', '149', 'later'),
(100009, '0', 'customer', 'paid', 'delivered', 'credit', NULL, NULL, NULL, 999, '0.00', '0', NULL, NULL, '2023-09-20 08:35:36', '2023-09-20 08:35:36', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '500', NULL, NULL, NULL, NULL, NULL, '499', 'rgggg'),
(100010, '0', 'customer', 'paid', 'delivered', 'cash', NULL, NULL, NULL, 469, '0.00', '0', NULL, NULL, '2023-09-20 08:38:26', '2023-09-20 08:38:26', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '69', NULL, NULL, NULL, '400', 'hjftd@bj', NULL, NULL),
(100011, '0', 'customer', 'paid', 'delivered', 'cash', NULL, NULL, NULL, 784, '0.00', '0', NULL, NULL, '2023-09-20 10:13:36', '2023-09-20 10:13:36', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL, '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `tax_model`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CINDERELLA THE CREATIONS FACTORY Casual Frock for Baby Girls,Pack of 3\",\"slug\":\"cinderella-the-creations-factory-casual-frock-for-baby-girlspack-of-3-AlhpLy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1},{\\\"id\\\":\\\"13\\\",\\\"position\\\":2}]\",\"category_id\":\"4\",\"sub_category_id\":\"13\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501797d5e0ba.png\\\",\\\"2023-09-13-6501797d6023e.png\\\",\\\"2023-09-13-6501797d60616.png\\\",\\\"2023-09-13-6501797d60a5e.png\\\",\\\"2023-09-13-6501797d60dc7.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-09-13-6501797d61190.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"1-2YEARS\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"1-2YEARS\\\",\\\"price\\\":999,\\\"sku\\\":\\\"CTCFCFfBGo3-1-2YEARS\\\",\\\"qty\\\":10}]\",\"published\":0,\"unit_price\":999,\"purchase_price\":800,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Made of high quality Fabric (Poly Crape with inner Cotton Lining used, very soft and comfortable, skin friendly and breathable<\\/li>\\r\\n\\t<li>Round Neck and Sleeveless<\\/li>\\r\\n\\t<li>Before ordering, please select the size of the dress according to our size chart picture on the left<\\/li>\\r\\n\\t<li>Zipper closure; This girls dress can pair with cardigan, sweater, leggings, coat in the fall and winter<\\/li>\\r\\n\\t<li>Age Range Description: Kid<\\/li>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:57:33.000000Z\",\"updated_at\":\"2023-09-13T08:57:36.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"116881\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 999, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 07:43:18', '2023-09-20 07:43:18', NULL, '1-2YEARS', '{\"Size\":\"1-2YEARS\"}', 'discount_on_product', 1, 0),
(2, 100002, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"TWIN BIRDS Tailored Cut & Slim Fit Stretchable Nylon Elasthane Fabric Ankle Leng\",\"slug\":\"twin-birds-tailored-cut-slim-fit-stretchable-nylon-elasthane-fabric-ankle-length-shimmer-leggings-for-women-li7b4i\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"8\\\",\\\"position\\\":2}]\",\"category_id\":\"1\",\"sub_category_id\":\"8\",\"sub_sub_category_id\":null,\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501748f7fd10.png\\\",\\\"2023-09-13-6501748f81585.png\\\",\\\"2023-09-13-6501748f81a97.png\\\",\\\"2023-09-13-6501748f84451.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"FFEBCD\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f7fd10.png\\\"},{\\\"color\\\":\\\"FF1493\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f81585.png\\\"},{\\\"color\\\":\\\"008000\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f81a97.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501748f84451.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501748f84859.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFEBCD\\\",\\\"#FF1493\\\",\\\"#008000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"2xl\\\",\\\"3xl\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"BlanchedAlmond-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-BlanchedAlmond-2xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"BlanchedAlmond-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-BlanchedAlmond-3xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepPink-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-DeepPink-2xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepPink-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-DeepPink-3xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Green-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-Green-2xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Green-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-Green-3xl\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":700,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":6,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Slim<\\/li>\\r\\n\\t<li>Mermaid World - Shimmer Ankle Length Leggings<\\/li>\\r\\n\\t<li>Ultra Stretchy Nylon elastane fabric<\\/li>\\r\\n\\t<li>Signature Wide Waistband<\\/li>\\r\\n\\t<li>Tailored Cut and Fit<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:36:31.000000Z\",\"updated_at\":\"2023-09-13T08:40:20.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111313\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 0, 16, 'include', 'delivered', 'paid', '2023-09-20 07:44:44', '2023-09-20 07:44:44', NULL, 'DeepPink-2xl', '{\"color\":\"DeepPink\",\"Size\":\"2xl\"}', 'discount_on_product', 1, 0),
(3, 100003, 2, 1, NULL, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"KBZ Womens Cotton Printed Regular Top\",\"slug\":\"kbz-womens-cotton-printed-regular-top-XJGKMJ\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2}]\",\"category_id\":\"1\",\"sub_category_id\":\"7\",\"sub_sub_category_id\":null,\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501725f67b42.png\\\",\\\"2023-09-13-6501725f69329.png\\\",\\\"2023-09-13-6501725f6c4e4.png\\\",\\\"2023-09-13-6501725f6c9c3.png\\\",\\\"2023-09-13-6501725f6d03f.png\\\",\\\"2023-09-13-6501725f6d51e.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-09-13-6501725f67b42.png\\\"},{\\\"color\\\":\\\"F5FFFA\\\",\\\"image_name\\\":\\\"2023-09-13-6501725f69329.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501725f6c4e4.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501725f6c9c3.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501725f6d03f.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501725f6d51e.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501725f6d9f6.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#F5FFFA\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"S\\\",\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-Black-XS\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-Black-S\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-Black-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-Black-L\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-Black-XL\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"MintCream-XS\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-MintCream-XS\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"MintCream-S\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-MintCream-S\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"MintCream-M\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-MintCream-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"MintCream-L\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-MintCream-L\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"MintCream-XL\\\",\\\"price\\\":790,\\\"sku\\\":\\\"KWCPRT-MintCream-XL\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":790,\"purchase_price\":700,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":30,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Hand Wash Only<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit<\\/li>\\r\\n\\t<li>material: Cotton || product length: 28 inches || in box: 1 Top<\\/li>\\r\\n\\t<li>style and pattern: Regular and Printed || neckline : Square Neck || sleeves: 3\\/4th Sleeves<\\/li>\\r\\n\\t<li>Occasion : casual, festive and party wear<\\/li>\\r\\n\\t<li>Disclaimer : there might be slight variation in the actual color of the product due to different screen resolutions.<\\/li>\\r\\n\\t<li>Size guide: size &quot;s&quot; fits upto bust 36 inch, size &quot;m&quot; fits upto bust 38 inch, size &quot;l&quot; fits upto bust 40 inch, size &quot;xl&quot; fits upto bust 42 inch, size &quot;xxl&quot; fits upto bust 44 inch, Size &quot;3xl&quot; fits upto bust 46 inch, size &quot;4xl&quot; fits upto bust 48 inch, size &quot;5xl&quot; fits upto bust 50 inch.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:27:11.000000Z\",\"updated_at\":\"2023-09-13T08:27:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"141804\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 790, 0, 79, 'include', 'delivered', 'paid', '2023-09-20 07:55:26', '2023-09-20 07:55:26', NULL, 'Black-XS', '{\"color\":\"Black\",\"Size\":\"XS\"}', 'discount_on_product', 1, 0),
(4, 100004, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CINDERELLA THE CREATIONS FACTORY Casual Frock for Baby Girls,Pack of 3\",\"slug\":\"cinderella-the-creations-factory-casual-frock-for-baby-girlspack-of-3-AlhpLy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1},{\\\"id\\\":\\\"13\\\",\\\"position\\\":2}]\",\"category_id\":\"4\",\"sub_category_id\":\"13\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501797d5e0ba.png\\\",\\\"2023-09-13-6501797d6023e.png\\\",\\\"2023-09-13-6501797d60616.png\\\",\\\"2023-09-13-6501797d60a5e.png\\\",\\\"2023-09-13-6501797d60dc7.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-09-13-6501797d61190.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"1-2YEARS\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"1-2YEARS\\\",\\\"price\\\":999,\\\"sku\\\":\\\"CTCFCFfBGo3-1-2YEARS\\\",\\\"qty\\\":9}]\",\"published\":0,\"unit_price\":999,\"purchase_price\":800,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Made of high quality Fabric (Poly Crape with inner Cotton Lining used, very soft and comfortable, skin friendly and breathable<\\/li>\\r\\n\\t<li>Round Neck and Sleeveless<\\/li>\\r\\n\\t<li>Before ordering, please select the size of the dress according to our size chart picture on the left<\\/li>\\r\\n\\t<li>Zipper closure; This girls dress can pair with cardigan, sweater, leggings, coat in the fall and winter<\\/li>\\r\\n\\t<li>Age Range Description: Kid<\\/li>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:57:33.000000Z\",\"updated_at\":\"2023-09-20T07:43:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"116881\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 999, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 07:59:28', '2023-09-20 07:59:28', NULL, '1-2YEARS', '{\"Size\":\"1-2YEARS\"}', 'discount_on_product', 1, 0),
(5, 100005, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt\",\"slug\":\"lookmark-mens-poly-cotton-digital-printed-stitched-half-sleeve-shirt-3ZdsB5\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"category_id\":\"2\",\"sub_category_id\":\"10\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501778391ef1.png\\\",\\\"2023-09-13-650177839347b.png\\\",\\\"2023-09-13-6501778393c6b.png\\\",\\\"2023-09-13-65017783972b8.png\\\",\\\"2023-09-13-65017783978ec.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-09-13-6501778391ef1.png\\\"},{\\\"color\\\":\\\"00008B\\\",\\\"image_name\\\":\\\"2023-09-13-650177839347b.png\\\"},{\\\"color\\\":\\\"8FBC8F\\\",\\\"image_name\\\":\\\"2023-09-13-6501778393c6b.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783972b8.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783978ec.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501778398013.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#00008B\\\",\\\"#8FBC8F\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-XL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":349,\"purchase_price\":300,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":36,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Hand Wash Only<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit<\\/li>\\r\\n\\t<li>Stylish Full sleeve Casual Shirts &amp; Office Wear Casual shirts<\\/li>\\r\\n\\t<li>100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look<\\/li>\\r\\n\\t<li>Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings<\\/li>\\r\\n\\t<li>Modern slim fit (we have updated our size chart, please refer the size chart for new measurements before ordering)<\\/li>\\r\\n\\t<li>Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:49:07.000000Z\",\"updated_at\":\"2023-09-13T08:49:54.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"163638\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 349, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:14:57', '2023-09-20 08:14:57', NULL, 'Black-M', '{\"color\":\"Black\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(6, 100006, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"rytras Women\'s Cotton Printed Straight Kurti\",\"slug\":\"rytras-womens-cotton-printed-straight-kurti-RCukH1\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2}]\",\"category_id\":\"1\",\"sub_category_id\":\"7\",\"sub_sub_category_id\":null,\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-65017021712e2.png\\\",\\\"2023-09-13-650170217433d.png\\\",\\\"2023-09-13-65017021747af.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"DAA520\\\",\\\"image_name\\\":\\\"2023-09-13-65017021712e2.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-650170217433d.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017021747af.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501702174c86.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#DAA520\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"    M\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Goldenrod-S\\\",\\\"price\\\":469,\\\"sku\\\":\\\"rWCPSK-Goldenrod-S\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Goldenrod-M\\\",\\\"price\\\":479,\\\"sku\\\":\\\"rWCPSK-Goldenrod-M\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":469,\"purchase_price\":400,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fabric: 100% Cotton<\\/li>\\r\\n\\t<li>Kurta Length: Calf Length<\\/li>\\r\\n\\t<li>Style: Straight<\\/li>\\r\\n\\t<li>Color: Yellow<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:17:37.000000Z\",\"updated_at\":\"2023-09-13T08:22:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"DUMMY\",\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111159\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 469, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:23:17', '2023-09-20 08:23:17', NULL, 'Goldenrod-S', '{\"color\":\"Goldenrod\",\"Size\":\"S\"}', 'discount_on_product', 1, 0),
(7, 100007, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt\",\"slug\":\"lookmark-mens-poly-cotton-digital-printed-stitched-half-sleeve-shirt-3ZdsB5\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"category_id\":\"2\",\"sub_category_id\":\"10\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501778391ef1.png\\\",\\\"2023-09-13-650177839347b.png\\\",\\\"2023-09-13-6501778393c6b.png\\\",\\\"2023-09-13-65017783972b8.png\\\",\\\"2023-09-13-65017783978ec.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-09-13-6501778391ef1.png\\\"},{\\\"color\\\":\\\"00008B\\\",\\\"image_name\\\":\\\"2023-09-13-650177839347b.png\\\"},{\\\"color\\\":\\\"8FBC8F\\\",\\\"image_name\\\":\\\"2023-09-13-6501778393c6b.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783972b8.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783978ec.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501778398013.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#00008B\\\",\\\"#8FBC8F\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-XL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":349,\"purchase_price\":300,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":35,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Hand Wash Only<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit<\\/li>\\r\\n\\t<li>Stylish Full sleeve Casual Shirts &amp; Office Wear Casual shirts<\\/li>\\r\\n\\t<li>100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look<\\/li>\\r\\n\\t<li>Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings<\\/li>\\r\\n\\t<li>Modern slim fit (we have updated our size chart, please refer the size chart for new measurements before ordering)<\\/li>\\r\\n\\t<li>Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:49:07.000000Z\",\"updated_at\":\"2023-09-20T08:14:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"163638\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 349, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:27:54', '2023-09-20 08:27:54', NULL, 'Black-M', '{\"color\":\"Black\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(8, 100008, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt\",\"slug\":\"lookmark-mens-poly-cotton-digital-printed-stitched-half-sleeve-shirt-3ZdsB5\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"10\\\",\\\"position\\\":2}]\",\"category_id\":\"2\",\"sub_category_id\":\"10\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501778391ef1.png\\\",\\\"2023-09-13-650177839347b.png\\\",\\\"2023-09-13-6501778393c6b.png\\\",\\\"2023-09-13-65017783972b8.png\\\",\\\"2023-09-13-65017783978ec.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-09-13-6501778391ef1.png\\\"},{\\\"color\\\":\\\"00008B\\\",\\\"image_name\\\":\\\"2023-09-13-650177839347b.png\\\"},{\\\"color\\\":\\\"8FBC8F\\\",\\\"image_name\\\":\\\"2023-09-13-6501778393c6b.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783972b8.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017783978ec.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501778398013.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#00008B\\\",\\\"#8FBC8F\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-M\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-Black-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkBlue-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkBlue-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-M\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-L\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkSeaGreen-XL\\\",\\\"price\\\":349,\\\"sku\\\":\\\"LMPCDPSHSS-DarkSeaGreen-XL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":349,\"purchase_price\":300,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":34,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Hand Wash Only<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit<\\/li>\\r\\n\\t<li>Stylish Full sleeve Casual Shirts &amp; Office Wear Casual shirts<\\/li>\\r\\n\\t<li>100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look<\\/li>\\r\\n\\t<li>Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings<\\/li>\\r\\n\\t<li>Modern slim fit (we have updated our size chart, please refer the size chart for new measurements before ordering)<\\/li>\\r\\n\\t<li>Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:49:07.000000Z\",\"updated_at\":\"2023-09-20T08:27:54.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"163638\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 349, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:31:05', '2023-09-20 08:31:05', NULL, 'Black-M', '{\"color\":\"Black\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(9, 100009, 6, 1, NULL, '{\"id\":6,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CINDERELLA THE CREATIONS FACTORY Casual Frock for Baby Girls,Pack of 3\",\"slug\":\"cinderella-the-creations-factory-casual-frock-for-baby-girlspack-of-3-AlhpLy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1},{\\\"id\\\":\\\"13\\\",\\\"position\\\":2}]\",\"category_id\":\"4\",\"sub_category_id\":\"13\",\"sub_sub_category_id\":null,\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501797d5e0ba.png\\\",\\\"2023-09-13-6501797d6023e.png\\\",\\\"2023-09-13-6501797d60616.png\\\",\\\"2023-09-13-6501797d60a5e.png\\\",\\\"2023-09-13-6501797d60dc7.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-09-13-6501797d61190.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"1-2YEARS\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"1-2YEARS\\\",\\\"price\\\":999,\\\"sku\\\":\\\"CTCFCFfBGo3-1-2YEARS\\\",\\\"qty\\\":8}]\",\"published\":0,\"unit_price\":999,\"purchase_price\":800,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Made of high quality Fabric (Poly Crape with inner Cotton Lining used, very soft and comfortable, skin friendly and breathable<\\/li>\\r\\n\\t<li>Round Neck and Sleeveless<\\/li>\\r\\n\\t<li>Before ordering, please select the size of the dress according to our size chart picture on the left<\\/li>\\r\\n\\t<li>Zipper closure; This girls dress can pair with cardigan, sweater, leggings, coat in the fall and winter<\\/li>\\r\\n\\t<li>Age Range Description: Kid<\\/li>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:57:33.000000Z\",\"updated_at\":\"2023-09-20T07:59:28.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"116881\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 999, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:35:36', '2023-09-20 08:35:36', NULL, '1-2YEARS', '{\"Size\":\"1-2YEARS\"}', 'discount_on_product', 1, 0),
(10, 100010, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"rytras Women\'s Cotton Printed Straight Kurti\",\"slug\":\"rytras-womens-cotton-printed-straight-kurti-RCukH1\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"7\\\",\\\"position\\\":2}]\",\"category_id\":\"1\",\"sub_category_id\":\"7\",\"sub_sub_category_id\":null,\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-65017021712e2.png\\\",\\\"2023-09-13-650170217433d.png\\\",\\\"2023-09-13-65017021747af.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"DAA520\\\",\\\"image_name\\\":\\\"2023-09-13-65017021712e2.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-650170217433d.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-65017021747af.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501702174c86.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#DAA520\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"S\\\",\\\"    M\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Goldenrod-S\\\",\\\"price\\\":469,\\\"sku\\\":\\\"rWCPSK-Goldenrod-S\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Goldenrod-M\\\",\\\"price\\\":479,\\\"sku\\\":\\\"rWCPSK-Goldenrod-M\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":469,\"purchase_price\":400,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":7,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fabric: 100% Cotton<\\/li>\\r\\n\\t<li>Kurta Length: Calf Length<\\/li>\\r\\n\\t<li>Style: Straight<\\/li>\\r\\n\\t<li>Color: Yellow<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:17:37.000000Z\",\"updated_at\":\"2023-09-20T08:23:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"DUMMY\",\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111159\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 469, 0, 0, 'include', 'delivered', 'paid', '2023-09-20 08:38:26', '2023-09-20 08:38:26', NULL, 'Goldenrod-S', '{\"color\":\"Goldenrod\",\"Size\":\"S\"}', 'discount_on_product', 1, 0),
(11, 100011, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"TWIN BIRDS Tailored Cut & Slim Fit Stretchable Nylon Elasthane Fabric Ankle Leng\",\"slug\":\"twin-birds-tailored-cut-slim-fit-stretchable-nylon-elasthane-fabric-ankle-length-shimmer-leggings-for-women-li7b4i\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"8\\\",\\\"position\\\":2}]\",\"category_id\":\"1\",\"sub_category_id\":\"8\",\"sub_sub_category_id\":null,\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-13-6501748f7fd10.png\\\",\\\"2023-09-13-6501748f81585.png\\\",\\\"2023-09-13-6501748f81a97.png\\\",\\\"2023-09-13-6501748f84451.png\\\"]\",\"color_image\":\"[{\\\"color\\\":\\\"FFEBCD\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f7fd10.png\\\"},{\\\"color\\\":\\\"FF1493\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f81585.png\\\"},{\\\"color\\\":\\\"008000\\\",\\\"image_name\\\":\\\"2023-09-13-6501748f81a97.png\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-09-13-6501748f84451.png\\\"}]\",\"thumbnail\":\"2023-09-13-6501748f84859.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFEBCD\\\",\\\"#FF1493\\\",\\\"#008000\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"2xl\\\",\\\"3xl\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"BlanchedAlmond-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-BlanchedAlmond-2xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"BlanchedAlmond-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-BlanchedAlmond-3xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepPink-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-DeepPink-2xl\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepPink-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-DeepPink-3xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Green-2xl\\\",\\\"price\\\":800,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-Green-2xl\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Green-3xl\\\",\\\"price\\\":850,\\\"sku\\\":\\\"TBTC&SFSNEFALSLfW-Green-3xl\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":800,\"purchase_price\":700,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":5,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Slim<\\/li>\\r\\n\\t<li>Mermaid World - Shimmer Ankle Length Leggings<\\/li>\\r\\n\\t<li>Ultra Stretchy Nylon elastane fabric<\\/li>\\r\\n\\t<li>Signature Wide Waistband<\\/li>\\r\\n\\t<li>Tailored Cut and Fit<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-13T08:36:31.000000Z\",\"updated_at\":\"2023-09-20T07:44:44.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111313\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 0, 16, 'include', 'delivered', 'paid', '2023-09-20 10:13:36', '2023-09-20 10:13:36', NULL, 'BlanchedAlmond-2xl', '{\"color\":\"BlanchedAlmond\",\"Size\":\"2xl\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer',
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `sub_category_id` varchar(191) DEFAULT NULL,
  `sub_sub_category_id` varchar(191) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `color_image` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `category_id`, `sub_category_id`, `sub_sub_category_id`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `color_image`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `tax_model`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'rytras Women\'s Cotton Printed Straight Kurti', 'rytras-womens-cotton-printed-straight-kurti-RCukH1', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '1', '7', NULL, 1, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-65017021712e2.png\",\"2023-09-13-650170217433d.png\",\"2023-09-13-65017021747af.png\"]', '[{\"color\":\"DAA520\",\"image_name\":\"2023-09-13-65017021712e2.png\"},{\"color\":null,\"image_name\":\"2023-09-13-650170217433d.png\"},{\"color\":null,\"image_name\":\"2023-09-13-65017021747af.png\"}]', '2023-09-13-6501702174c86.png', '1', NULL, 'youtube', NULL, '[\"#DAA520\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"S\",\"    M\"]}]', '[{\"type\":\"Goldenrod-S\",\"price\":469,\"sku\":\"rWCPSK-Goldenrod-S\",\"qty\":2},{\"type\":\"Goldenrod-M\",\"price\":479,\"sku\":\"rWCPSK-Goldenrod-M\",\"qty\":4}]', 0, 469, 400, '0', 'percent', 'include', '0', 'percent', 6, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Regular</li>\r\n	<li>Fabric: 100% Cotton</li>\r\n	<li>Kurta Length: Calf Length</li>\r\n	<li>Style: Straight</li>\r\n	<li>Color: Yellow</li>\r\n</ul>', 0, NULL, '2023-09-13 08:17:37', '2023-09-20 08:38:26', 1, 1, 'DUMMY', NULL, 'def.png', 1, NULL, 30.00, 1, NULL, NULL, '111159'),
(2, 'admin', 1, 'KBZ Womens Cotton Printed Regular Top', 'kbz-womens-cotton-printed-regular-top-XJGKMJ', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '1', '7', NULL, 2, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-6501725f67b42.png\",\"2023-09-13-6501725f69329.png\",\"2023-09-13-6501725f6c4e4.png\",\"2023-09-13-6501725f6c9c3.png\",\"2023-09-13-6501725f6d03f.png\",\"2023-09-13-6501725f6d51e.png\"]', '[{\"color\":\"000000\",\"image_name\":\"2023-09-13-6501725f67b42.png\"},{\"color\":\"F5FFFA\",\"image_name\":\"2023-09-13-6501725f69329.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501725f6c4e4.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501725f6c9c3.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501725f6d03f.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501725f6d51e.png\"}]', '2023-09-13-6501725f6d9f6.png', '1', NULL, 'youtube', NULL, '[\"#000000\",\"#F5FFFA\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"XS\",\"S\",\"M\",\"L\",\"XL\"]}]', '[{\"type\":\"Black-XS\",\"price\":790,\"sku\":\"KWCPRT-Black-XS\",\"qty\":2},{\"type\":\"Black-S\",\"price\":790,\"sku\":\"KWCPRT-Black-S\",\"qty\":3},{\"type\":\"Black-M\",\"price\":790,\"sku\":\"KWCPRT-Black-M\",\"qty\":3},{\"type\":\"Black-L\",\"price\":790,\"sku\":\"KWCPRT-Black-L\",\"qty\":3},{\"type\":\"Black-XL\",\"price\":790,\"sku\":\"KWCPRT-Black-XL\",\"qty\":3},{\"type\":\"MintCream-XS\",\"price\":790,\"sku\":\"KWCPRT-MintCream-XS\",\"qty\":3},{\"type\":\"MintCream-S\",\"price\":790,\"sku\":\"KWCPRT-MintCream-S\",\"qty\":3},{\"type\":\"MintCream-M\",\"price\":790,\"sku\":\"KWCPRT-MintCream-M\",\"qty\":3},{\"type\":\"MintCream-L\",\"price\":790,\"sku\":\"KWCPRT-MintCream-L\",\"qty\":3},{\"type\":\"MintCream-XL\",\"price\":790,\"sku\":\"KWCPRT-MintCream-XL\",\"qty\":3}]', 0, 790, 700, '0', 'percent', 'include', '10', 'percent', 29, 1, '<ul>\r\n	<li>Care Instructions: Hand Wash Only</li>\r\n	<li>Fit Type: Regular Fit</li>\r\n	<li>material: Cotton || product length: 28 inches || in box: 1 Top</li>\r\n	<li>style and pattern: Regular and Printed || neckline : Square Neck || sleeves: 3/4th Sleeves</li>\r\n	<li>Occasion : casual, festive and party wear</li>\r\n	<li>Disclaimer : there might be slight variation in the actual color of the product due to different screen resolutions.</li>\r\n	<li>Size guide: size &quot;s&quot; fits upto bust 36 inch, size &quot;m&quot; fits upto bust 38 inch, size &quot;l&quot; fits upto bust 40 inch, size &quot;xl&quot; fits upto bust 42 inch, size &quot;xxl&quot; fits upto bust 44 inch, Size &quot;3xl&quot; fits upto bust 46 inch, size &quot;4xl&quot; fits upto bust 48 inch, size &quot;5xl&quot; fits upto bust 50 inch.</li>\r\n</ul>', 0, NULL, '2023-09-13 08:27:11', '2023-09-20 07:55:26', 1, 1, NULL, NULL, 'def.png', 1, NULL, 30.00, 1, NULL, NULL, '141804'),
(3, 'admin', 1, 'TWIN BIRDS Tailored Cut & Slim Fit Stretchable Nylon Elasthane Fabric Ankle Leng', 'twin-birds-tailored-cut-slim-fit-stretchable-nylon-elasthane-fabric-ankle-length-shimmer-leggings-for-women-li7b4i', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"8\",\"position\":2}]', '1', '8', NULL, 1, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-6501748f7fd10.png\",\"2023-09-13-6501748f81585.png\",\"2023-09-13-6501748f81a97.png\",\"2023-09-13-6501748f84451.png\"]', '[{\"color\":\"FFEBCD\",\"image_name\":\"2023-09-13-6501748f7fd10.png\"},{\"color\":\"FF1493\",\"image_name\":\"2023-09-13-6501748f81585.png\"},{\"color\":\"008000\",\"image_name\":\"2023-09-13-6501748f81a97.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501748f84451.png\"}]', '2023-09-13-6501748f84859.png', '0', NULL, 'youtube', NULL, '[\"#FFEBCD\",\"#FF1493\",\"#008000\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"2xl\",\"3xl\"]}]', '[{\"type\":\"BlanchedAlmond-2xl\",\"price\":800,\"sku\":\"TBTC&SFSNEFALSLfW-BlanchedAlmond-2xl\",\"qty\":0},{\"type\":\"BlanchedAlmond-3xl\",\"price\":850,\"sku\":\"TBTC&SFSNEFALSLfW-BlanchedAlmond-3xl\",\"qty\":1},{\"type\":\"DeepPink-2xl\",\"price\":800,\"sku\":\"TBTC&SFSNEFALSLfW-DeepPink-2xl\",\"qty\":0},{\"type\":\"DeepPink-3xl\",\"price\":850,\"sku\":\"TBTC&SFSNEFALSLfW-DeepPink-3xl\",\"qty\":1},{\"type\":\"Green-2xl\",\"price\":800,\"sku\":\"TBTC&SFSNEFALSLfW-Green-2xl\",\"qty\":1},{\"type\":\"Green-3xl\",\"price\":850,\"sku\":\"TBTC&SFSNEFALSLfW-Green-3xl\",\"qty\":1}]', 0, 800, 700, '0', 'percent', 'include', '2', 'percent', 4, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Slim</li>\r\n	<li>Mermaid World - Shimmer Ankle Length Leggings</li>\r\n	<li>Ultra Stretchy Nylon elastane fabric</li>\r\n	<li>Signature Wide Waistband</li>\r\n	<li>Tailored Cut and Fit</li>\r\n</ul>', 0, NULL, '2023-09-13 08:36:31', '2023-09-20 10:13:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '111313'),
(4, 'admin', 1, 'LookMark Men\'s Poly Cotton Digital Printed Stitched Half Sleeve Shirt', 'lookmark-mens-poly-cotton-digital-printed-stitched-half-sleeve-shirt-3ZdsB5', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"10\",\"position\":2}]', '2', '10', NULL, 4, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-6501778391ef1.png\",\"2023-09-13-650177839347b.png\",\"2023-09-13-6501778393c6b.png\",\"2023-09-13-65017783972b8.png\",\"2023-09-13-65017783978ec.png\"]', '[{\"color\":\"000000\",\"image_name\":\"2023-09-13-6501778391ef1.png\"},{\"color\":\"00008B\",\"image_name\":\"2023-09-13-650177839347b.png\"},{\"color\":\"8FBC8F\",\"image_name\":\"2023-09-13-6501778393c6b.png\"},{\"color\":null,\"image_name\":\"2023-09-13-65017783972b8.png\"},{\"color\":null,\"image_name\":\"2023-09-13-65017783978ec.png\"}]', '2023-09-13-6501778398013.png', '1', NULL, 'youtube', NULL, '[\"#000000\",\"#00008B\",\"#8FBC8F\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"M\",\"L\",\"XL\"]}]', '[{\"type\":\"Black-M\",\"price\":349,\"sku\":\"LMPCDPSHSS-Black-M\",\"qty\":1},{\"type\":\"Black-L\",\"price\":349,\"sku\":\"LMPCDPSHSS-Black-L\",\"qty\":4},{\"type\":\"Black-XL\",\"price\":349,\"sku\":\"LMPCDPSHSS-Black-XL\",\"qty\":4},{\"type\":\"DarkBlue-M\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkBlue-M\",\"qty\":4},{\"type\":\"DarkBlue-L\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkBlue-L\",\"qty\":4},{\"type\":\"DarkBlue-XL\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkBlue-XL\",\"qty\":4},{\"type\":\"DarkSeaGreen-M\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkSeaGreen-M\",\"qty\":4},{\"type\":\"DarkSeaGreen-L\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkSeaGreen-L\",\"qty\":4},{\"type\":\"DarkSeaGreen-XL\",\"price\":349,\"sku\":\"LMPCDPSHSS-DarkSeaGreen-XL\",\"qty\":4}]', 0, 349, 300, '0', 'percent', 'include', '0', 'flat', 33, 1, '<ul>\r\n	<li>Care Instructions: Hand Wash Only</li>\r\n	<li>Fit Type: Regular Fit</li>\r\n	<li>Stylish Full sleeve Casual Shirts &amp; Office Wear Casual shirts</li>\r\n	<li>100% Premium Poly Cottton, Pre Washed for an extremely soft finish and Rich look</li>\r\n	<li>Disclaimer: Product colour may slightly vary due to photographic lighting sources or your monitor settings</li>\r\n	<li>Modern slim fit (we have updated our size chart, please refer the size chart for new measurements before ordering)</li>\r\n	<li>Breathable : Truly comfortable and easy to wear in every season it is insulating in winter and breathable in summer.</li>\r\n</ul>', 0, NULL, '2023-09-13 08:49:07', '2023-09-20 08:31:05', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '163638'),
(5, 'admin', 1, 'Jack and Jini Formal Stretchable Pant Navy Blue with Expandable Waist for Men. R', 'jack-and-jini-formal-stretchable-pant-navy-blue-with-expandable-waist-for-men-regular-fit-flat-front-premium-lycra-fabri', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"11\",\"position\":2}]', '2', '11', NULL, 4, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-6501784eb88c8.png\",\"2023-09-13-6501784eba2fc.png\",\"2023-09-13-6501784eba6aa.png\",\"2023-09-13-6501784ebd0d5.png\"]', '[{\"color\":\"000000\",\"image_name\":\"2023-09-13-6501784eb88c8.png\"},{\"color\":\"A52A2A\",\"image_name\":\"2023-09-13-6501784eba2fc.png\"},{\"color\":\"D3D3D3\",\"image_name\":\"2023-09-13-6501784eba6aa.png\"},{\"color\":null,\"image_name\":\"2023-09-13-6501784ebd0d5.png\"}]', '2023-09-13-6501784ebd78b.png', '0', NULL, 'youtube', NULL, '[\"#000000\",\"#A52A2A\",\"#D3D3D3\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"36\",\"38\"]}]', '[{\"type\":\"Black-36\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-Black-36\",\"qty\":5},{\"type\":\"Black-38\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-Black-38\",\"qty\":5},{\"type\":\"Brown-36\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-Brown-36\",\"qty\":5},{\"type\":\"Brown-38\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-Brown-38\",\"qty\":5},{\"type\":\"LightGrey-36\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-LightGrey-36\",\"qty\":5},{\"type\":\"LightGrey-38\",\"price\":999,\"sku\":\"JaJFSPNBwEWfMRFFFPLFPfOPaCW-LightGrey-38\",\"qty\":5}]', 0, 999, 709, '0', 'percent', 'include', '0', 'flat', 30, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Stretch</li>\r\n	<li>FABRIC- These pants are made of soft, comfortable and high quality Cotton Material with 2% Spandex mixed fabric. It is wrinkle resistant, stains resistant, moisture wicking, making these the most hassle-free pants you have ever owned.</li>\r\n	<li>FLEXIBLE - Waistband stretches upto 2 inches for ultimate comfort. Regular sizes are available. Wear it worry free as of its flexible cloth and heavy stitching. Don&rsquo;t worry for sitting on back seat of bike or sitting on ground for rituals. It is stretchable.</li>\r\n	<li>DESIGN - This flat front formal pant features roomy through hip &amp; thigh with straight leg; two front pockets and two back button-through welt pockets; front zip and button closure.</li>\r\n	<li>COMFORT &ndash; Cotton mixed with lycra material is skin friendly. Its breathable nature will absorb your sweat during summers and let you feels cool and comfort during work. Size and Wash Care - We offer Indian Standard Sizes so go with the size you usually wear is OK. Easy to care, machine wash and low iron needed. These pants are amazing menswear items to add to your current modern collection!</li>\r\n	<li>OCCASION - Great for wedding, business, meetings, prom, graduation, date, fashion shows, parties, holiday, casual daily. Whether you step into the office or step out on the weekend, these dress pants will fit your need perfectly. You can choose these dress pants with casual coat for daily look.</li>\r\n</ul>', 0, NULL, '2023-09-13 08:52:30', '2023-09-20 07:01:52', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137003'),
(6, 'admin', 1, 'CINDERELLA THE CREATIONS FACTORY Casual Frock for Baby Girls,Pack of 3', 'cinderella-the-creations-factory-casual-frock-for-baby-girlspack-of-3-AlhpLy', 'physical', '[{\"id\":\"4\",\"position\":1},{\"id\":\"13\",\"position\":2}]', '4', '13', NULL, 4, 'pc', 1, 1, NULL, NULL, '[\"2023-09-13-6501797d5e0ba.png\",\"2023-09-13-6501797d6023e.png\",\"2023-09-13-6501797d60616.png\",\"2023-09-13-6501797d60a5e.png\",\"2023-09-13-6501797d60dc7.png\"]', '[]', '2023-09-13-6501797d61190.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"1-2YEARS\"]}]', '[{\"type\":\"1-2YEARS\",\"price\":999,\"sku\":\"CTCFCFfBGo3-1-2YEARS\",\"qty\":7}]', 0, 999, 800, '0', 'percent', 'include', '0', 'flat', 7, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Regular</li>\r\n	<li>Made of high quality Fabric (Poly Crape with inner Cotton Lining used, very soft and comfortable, skin friendly and breathable</li>\r\n	<li>Round Neck and Sleeveless</li>\r\n	<li>Before ordering, please select the size of the dress according to our size chart picture on the left</li>\r\n	<li>Zipper closure; This girls dress can pair with cardigan, sweater, leggings, coat in the fall and winter</li>\r\n	<li>Age Range Description: Kid</li>\r\n	<li>Care Instructions: Machine Wash</li>\r\n</ul>', 0, NULL, '2023-09-13 08:57:33', '2023-09-20 08:35:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '116881'),
(7, 'admin', 1, 'Sukkhi Elaborate Gold-Plated With Necklace Set With Drop Earrings | Jewellery Se', 'sukkhi-elaborate-gold-plated-with-necklace-set-with-drop-earrings-jewellery-set-for-women-qARxLM', 'physical', '[{\"id\":\"6\",\"position\":1},{\"id\":\"14\",\"position\":2}]', '6', '14', NULL, 4, 'pc', 1, 1, NULL, NULL, '[\"2023-09-23-650ec0c35b8aa.png\",\"2023-09-23-650ec0c3b9aaf.png\",\"2023-09-23-650ec0c3b9f9f.png\",\"2023-09-23-650ec0c3ba418.png\",\"2023-09-23-650ec0c3bcf06.png\"]', '[]', '2023-09-23-650ec0c3bd3f3.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1000, 1500, '0', 'percent', 'include', '75', 'percent', 6, 1, '<ul>\r\n	<li>What&#39;s In The Box : 1 Necklace &amp; 1 Pair of Earring</li>\r\n	<li>Elaborate Design: This Sukkhi jewellery set features an elaborate collar bone necklace and stunning drop earrings, both adorned with sparkling pink AD stones. The design exudes elegance and intricacy, making it a perfect choice for special occasions and celebrations.</li>\r\n	<li>Gold-Plated Finish: The entire set is beautifully crafted with a gold-plated finish, adding a touch of opulence and glamour. The gold tone perfectly complements the vibrant pink AD stones, creating a regal and luxurious look.</li>\r\n	<li>Sparkling Pink AD Stones: The set showcases sparkling pink AD stones, which resemble the brilliance of real gemstones, adding a touch of luxury and allure to your style. The stones catch the light beautifully, creating a radiant and captivating effect.</li>\r\n	<li>Premium Quality Craftsmanship: Crafted with meticulous attention to detail, this Sukkhi jewellery set is made from high-quality materials, ensuring durability and long-lasting shine. The intricate craftsmanship reflects the brand&#39;s commitment to delivering exquisite and authentic jewellery pieces.</li>\r\n	<li>Complete Jewellery Set: The Sukkhi Elaborate Gold-Plated With AD Pink Stones Collar Bone Necklace And Drop Earrings Jewellery Set offers a complete ensemble for women who appreciate elaborate and elegant jewellery. It&#39;s a perfect choice for weddings, parties, and other special occasions, adding a touch of glamour and sophistication to your look.</li>\r\n	<li>Care Instruction : Avoid water contact, including swimming or bathing. Keep away from chemicals like perfumes and lotions. Store in a cool, dry place away from sunlight. Clean gently with a soft, lint-free cloth. Handle delicately to avoid bending or pulling. This will keep your jewellery shining for years.</li>\r\n</ul>', 0, NULL, '2023-09-23 10:41:07', '2023-09-23 10:43:19', 1, 1, NULL, NULL, 'def.png', 1, NULL, 20.00, 0, NULL, NULL, '124260'),
(8, 'admin', 1, 'Sukkhi Attractive Gold Plated Necklace Kada Combo Set for Women (CBMIX104227)', 'sukkhi-attractive-gold-plated-necklace-kada-combo-set-for-women-cbmix104227-2vekYh', 'physical', '[{\"id\":\"6\",\"position\":1},{\"id\":\"14\",\"position\":2}]', '6', '14', NULL, 4, 'pc', 1, 1, NULL, NULL, '[\"2023-09-23-650ec1f0d8df9.png\",\"2023-09-23-650ec1f0db1a0.png\",\"2023-09-23-650ec1f0db902.png\",\"2023-09-23-650ec1f0dbe0e.png\",\"2023-09-23-650ec1f0dc19d.png\",\"2023-09-23-650ec1f0dc5e9.png\",\"2023-09-23-650ec237d07d9.png\"]', '[]', '2023-09-23-650ec237d4885.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 800, 700, '0', 'percent', 'include', '0', 'flat', 6, 1, '<ul>\r\n	<li>Contains : 1 Necklace + 1 Pair of Earring + 1 Kada</li>\r\n	<li>Superior Quality &amp; Skin Friendly: High Quality as per International Standards that makes it very skin friendly. It has been made from toxic free materials Anti-Allergic and Safe for Skin. It can be worn over long time periods without any complains of ach and swelling. Made from Premium Quality Material this product assures to remain in its Original Glory even after years of usage.</li>\r\n	<li>Perfect Gift : Ideal Valentine, Birthday, Anniversary gift your loved ones. Women love jewellery; specially traditional jewellery adore a women. They wear it on different occasion They have special importance on ring ceremony, wedding and festive time. They can also wear it on regular basics.</li>\r\n	<li>Sukkhi began with a vision to provide quality and trendy fashion jewellery products to consumers at competitive prices. We exist to Craft High Quality and appealing Ethnic Jewellery. 100% Genuine Quality Product. For more product options, please visit our store. Please ensure you choose &quot;Sold by Cloudtail India or Sukkhi Fashion Jewellery&quot; for Original and Good Quality Product.</li>\r\n	<li>Usage: Avoid of contact with water and organic chemicals i.e. perfume sprays. Avoid using velvet boxes, and store in air-tight boxes. After use, wipe the jewellery with soft cotton cloth. First wear your makeup, perfume - then wear your jewellery. This will keep your jewellery shining for years.</li>\r\n</ul>', 0, NULL, '2023-09-23 10:46:08', '2023-09-23 10:47:19', 1, 1, NULL, NULL, '2023-09-23-650ec237d4ee0.png', 1, NULL, 30.00, 0, NULL, NULL, '111248');

-- --------------------------------------------------------

--
-- Table structure for table `product_compares`
--

CREATE TABLE `product_compares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'customer_id',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 2, 5, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 3, 9, NULL, NULL),
(10, 3, 10, NULL, NULL),
(11, 3, 11, NULL, NULL),
(12, 3, 12, NULL, NULL),
(13, 3, 13, NULL, NULL),
(14, 4, 14, NULL, NULL),
(15, 4, 15, NULL, NULL),
(16, 4, 16, NULL, NULL),
(17, 4, 17, NULL, NULL),
(18, 5, 11, NULL, NULL),
(19, 5, 18, NULL, NULL),
(20, 5, 19, NULL, NULL),
(21, 7, 20, NULL, NULL),
(22, 7, 21, NULL, NULL),
(23, 7, 22, NULL, NULL),
(24, 7, 23, NULL, NULL),
(25, 8, 24, NULL, NULL),
(26, 8, 25, NULL, NULL),
(27, 8, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', '5.00', '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'product_wise', '2023-09-13 07:16:27', '2023-09-13 07:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `bottom_banner` varchar(191) DEFAULT NULL,
  `vacation_start_date` date DEFAULT NULL,
  `vacation_end_date` date DEFAULT NULL,
  `vacation_note` varchar(255) DEFAULT NULL,
  `vacation_status` tinyint(4) NOT NULL DEFAULT 0,
  `temporary_close` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_followers`
--

CREATE TABLE `shop_followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Customer ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2020-12-31 21:18:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2021-02-27 16:23:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2021-02-27 16:23:33'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(191) NOT NULL,
  `visit_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `visit_count`, `created_at`, `updated_at`) VALUES
(1, 'kurties', 0, '2023-09-13 08:17:37', '2023-09-13 08:17:37'),
(2, 'yellow', 0, '2023-09-13 08:17:37', '2023-09-13 08:17:37'),
(3, 'yellowkurties', 0, '2023-09-13 08:17:37', '2023-09-13 08:17:37'),
(4, 'straight kurties', 0, '2023-09-13 08:17:37', '2023-09-13 08:17:37'),
(5, 'top', 0, '2023-09-13 08:27:11', '2023-09-13 08:27:11'),
(6, 'jeantop', 0, '2023-09-13 08:27:11', '2023-09-13 08:27:11'),
(7, 'black', 0, '2023-09-13 08:27:11', '2023-09-13 08:27:11'),
(8, 'cream', 0, '2023-09-13 08:27:11', '2023-09-13 08:27:11'),
(9, 'twinbird', 0, '2023-09-13 08:36:31', '2023-09-13 08:36:31'),
(10, 'leggings', 0, '2023-09-13 08:36:31', '2023-09-13 08:36:31'),
(11, 'pant', 0, '2023-09-13 08:36:31', '2023-09-13 08:36:31'),
(12, 'jeggings', 0, '2023-09-13 08:36:31', '2023-09-13 08:36:31'),
(13, '2xl', 0, '2023-09-13 08:36:31', '2023-09-13 08:36:31'),
(14, 'SHIRT', 0, '2023-09-13 08:49:07', '2023-09-13 08:49:07'),
(15, 'CASUAL', 0, '2023-09-13 08:49:07', '2023-09-13 08:49:07'),
(16, 'ATTRACTIVE', 0, '2023-09-13 08:49:07', '2023-09-13 08:49:07'),
(17, 'MODERN', 0, '2023-09-13 08:49:07', '2023-09-13 08:49:07'),
(18, 'FORMALPANT', 0, '2023-09-13 08:52:30', '2023-09-13 08:52:30'),
(19, 'COTTONPANT', 0, '2023-09-13 08:52:30', '2023-09-13 08:52:30'),
(20, 'Necklace', 0, '2023-09-23 10:41:07', '2023-09-23 10:41:07'),
(21, 'Jewellery', 0, '2023-09-23 10:41:07', '2023-09-23 10:41:07'),
(22, 'Jewellery Set', 0, '2023-09-23 10:41:08', '2023-09-23 10:41:08'),
(23, 'Necklace Set With Earrings', 0, '2023-09-23 10:41:08', '2023-09-23 10:41:08'),
(24, 'Green Necklace', 0, '2023-09-23 10:46:09', '2023-09-23 10:46:09'),
(25, 'Combo Set', 0, '2023-09-23 10:46:09', '2023-09-23 10:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 1, 'in', 'name', 'rytras Women\'s Cotton Printed Straight Kurti', 1),
('App\\Model\\Product', 1, 'in', 'description', '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Regular</li>\r\n	<li>Fabric: 100% Cotton</li>\r\n	<li>Kurta Length: Calf Length</li>\r\n	<li>Style: Straight</li>\r\n	<li>Color: Yellow</li>\r\n</ul>', 2),
('App\\Model\\Product', 7, 'in', 'name', 'Sukkhi Elaborate Gold-Plated With Necklace Set With Drop Earrings | Jewellery Se', 3),
('App\\Model\\Product', 7, 'in', 'description', '<ul>\r\n	<li>What&#39;s In The Box : 1 Necklace &amp; 1 Pair of Earring</li>\r\n	<li>Elaborate Design: This Sukkhi jewellery set features an elaborate collar bone necklace and stunning drop earrings, both adorned with sparkling pink AD stones. The design exudes elegance and intricacy, making it a perfect choice for special occasions and celebrations.</li>\r\n	<li>Gold-Plated Finish: The entire set is beautifully crafted with a gold-plated finish, adding a touch of opulence and glamour. The gold tone perfectly complements the vibrant pink AD stones, creating a regal and luxurious look.</li>\r\n	<li>Sparkling Pink AD Stones: The set showcases sparkling pink AD stones, which resemble the brilliance of real gemstones, adding a touch of luxury and allure to your style. The stones catch the light beautifully, creating a radiant and captivating effect.</li>\r\n	<li>Premium Quality Craftsmanship: Crafted with meticulous attention to detail, this Sukkhi jewellery set is made from high-quality materials, ensuring durability and long-lasting shine. The intricate craftsmanship reflects the brand&#39;s commitment to delivering exquisite and authentic jewellery pieces.</li>\r\n	<li>Complete Jewellery Set: The Sukkhi Elaborate Gold-Plated With AD Pink Stones Collar Bone Necklace And Drop Earrings Jewellery Set offers a complete ensemble for women who appreciate elaborate and elegant jewellery. It&#39;s a perfect choice for weddings, parties, and other special occasions, adding a touch of glamour and sophistication to your look.</li>\r\n	<li>Care Instruction : Avoid water contact, including swimming or bathing. Keep away from chemicals like perfumes and lotions. Store in a cool, dry place away from sunlight. Clean gently with a soft, lint-free cloth. Handle delicately to avoid bending or pulling. This will keep your jewellery shining for years.</li>\r\n</ul>', 4),
('App\\Model\\Product', 8, 'in', 'name', 'Sukkhi Attractive Gold Plated Necklace Kada Combo Set for Women (CBMIX104227)', 5),
('App\\Model\\Product', 8, 'in', 'description', '<ul>\r\n	<li>Contains : 1 Necklace + 1 Pair of Earring + 1 Kada</li>\r\n	<li>Superior Quality &amp; Skin Friendly: High Quality as per International Standards that makes it very skin friendly. It has been made from toxic free materials Anti-Allergic and Safe for Skin. It can be worn over long time periods without any complains of ach and swelling. Made from Premium Quality Material this product assures to remain in its Original Glory even after years of usage.</li>\r\n	<li>Perfect Gift : Ideal Valentine, Birthday, Anniversary gift your loved ones. Women love jewellery; specially traditional jewellery adore a women. They wear it on different occasion They have special importance on ring ceremony, wedding and festive time. They can also wear it on regular basics.</li>\r\n	<li>Sukkhi began with a vision to provide quality and trendy fashion jewellery products to consumers at competitive prices. We exist to Craft High Quality and appealing Ethnic Jewellery. 100% Genuine Quality Product. For more product options, please visit our store. Please ensure you choose &quot;Sold by Cloudtail India or Sukkhi Fashion Jewellery&quot; for Original and Good Quality Product.</li>\r\n	<li>Usage: Avoid of contact with water and organic chemicals i.e. perfume sprays. Avoid using velvet boxes, and store in air-tight boxes. After use, wipe the jewellery with soft cotton cloth. First wear your makeup, perfume - then wear your jewellery. This will keep your jewellery shining for years.</li>\r\n</ul>', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL,
  `login_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`, `login_hit_count`, `is_temp_blocked`, `temp_block_time`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(2, NULL, 'Jeba', 'Rosy', '09345868908', 'def.png', 'jebarosee.c@gmail.com', NULL, '$2y$10$KepfP2w5fOa46727y27dN.ESG9Jsn5EbH/7/ACiMXIBS88sPduIQe', NULL, '2023-10-19 10:43:02', '2023-10-19 10:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(191) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `withdrawal_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`withdrawal_method_fields`)),
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carddeposit`
--
ALTER TABLE `carddeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashdeposit`
--
ALTER TABLE `cashdeposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

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
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_compares`
--
ALTER TABLE `product_compares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_followers`
--
ALTER TABLE `shop_followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `carddeposit`
--
ALTER TABLE `carddeposit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashdeposit`
--
ALTER TABLE `cashdeposit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100012;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_compares`
--
ALTER TABLE `product_compares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_followers`
--
ALTER TABLE `shop_followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
