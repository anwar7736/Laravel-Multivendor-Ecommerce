-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 04:21 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multivendor_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'sayem', '01615597820', 1, 'def.png', 'sayemtutul@gmail.com', NULL, '$2y$10$cW1ot5l4/BitJzly7eLbC.BPQkf8yiFYtVZ.UgiBH8U05Dr2.v5Rm', 'ZGx34BYQzHWMJ96TzqDcUfrbg1jEePCSJpYBcqQ5Y1gSLgCNcks2rKcra3AB', '2023-06-06 01:47:48', '2023-06-06 01:47:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Employee', '[\"dashboard\",\"report\"]', 1, '2023-06-07 07:54:24', '2023-06-07 07:54:24');

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
(1, 1, 84700, 0, NULL, '2023-06-17 04:38:24', 0.00, 125.00, 0.00, 0.00),
(2, 1, 0, 0, '2023-06-06 01:47:48', '2023-06-06 01:47:48', 0.00, 0.00, 0.00, 0.00);

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
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Size', '2023-06-07 10:18:31', '2023-06-11 04:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(1, '2023-06-05-647e43fe02839.png', 'Main Banner', 1, '2023-06-05 20:20:16', '2023-06-05 20:22:22', '#', 'category', 1),
(2, '2023-06-05-647e4455a36a4.png', 'Main Banner', 1, '2023-06-05 20:23:49', '2023-06-05 20:23:53', '#', 'category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', '2023-06-05-647e42d7159d7.png', 1, '2023-06-05 20:17:27', '2023-06-05 20:17:27'),
(2, 'Microsoft', '2023-06-07-64800fc13b7af.png', 1, '2023-06-07 05:04:01', '2023-06-07 05:04:01'),
(3, 'China', '2023-06-07-64801154d3990.png', 1, '2023-06-07 05:10:44', '2023-06-07 05:10:44'),
(4, 'Oppo', '2023-06-07-64801168b3e38.png', 1, '2023-06-07 05:11:04', '2023-06-07 05:11:04'),
(5, 'Samsung', '2023-06-07-64801177cbc89.png', 1, '2023-06-07 05:11:19', '2023-06-07 05:11:19'),
(6, 'Casio', '2023-06-07-64801184f2746.png', 1, '2023-06-07 05:11:32', '2023-06-07 05:11:32'),
(7, 'MI', '2023-06-07-6480118d6cb0f.png', 1, '2023-06-07 05:11:41', '2023-06-07 05:11:41'),
(8, 'Aarong', '2023-06-07-648011aba0034.png', 1, '2023-06-07 05:12:11', '2023-06-07 05:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '2', '2020-10-11 07:43:44', '2023-06-05 19:53:22'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '01615597820', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Soft IT Global', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-06-06-647e3cd00bf8e.png', NULL, '2023-06-06 01:51:44'),
(13, 'company_mobile_logo', '2021-02-20-6030c88c91911.png', NULL, '2021-02-20 14:30:04'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'info@softitglobal.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#ca3d35\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2023-06-06 01:51:44'),
(19, 'company_footer_logo', '2023-06-06-647e3cd00cfcd.png', NULL, '2023-06-06 01:51:44'),
(20, 'company_copyright_text', 'CopyRight 6amTech@2021', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2023-06-06-647e3cd00dc77.png', '2020-10-11 13:53:02', '2023-06-06 01:51:44'),
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
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
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
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'BD', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#000000\",\"text_color\":\"#000000\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '1', NULL, '2023-06-17 04:48:09'),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2023-01-10 05:51:56'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'House # 17, Road #1 , mohammadia housing society', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'refund-policy', '', NULL, NULL),
(88, 'return-policy', '', NULL, NULL),
(89, 'cancellation-policy', '', NULL, NULL),
(90, 'timezone', 'UTC', NULL, NULL),
(91, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`, `keyword`) VALUES
(1, 'Kitchen', 'kitchen', '2023-06-05-647e3f8bcee87.png', 0, 0, '2023-06-05 20:03:23', '2023-06-05 20:05:11', 1, 1, 'ranna'),
(2, 'Gadgets', 'gadgets', '2023-06-05-647e3fb60738c.png', 0, 0, '2023-06-05 20:04:06', '2023-06-05 20:04:12', 1, 1, 'cooking'),
(3, 'Blender', 'blender', '2023-06-05-647e4032c1163.png', 1, 0, '2023-06-05 20:06:10', '2023-06-07 04:57:55', 1, 2, NULL),
(4, 'Phone', 'phone', '2023-06-07-64800ddcb1a48.png', 0, 0, '2023-06-07 04:55:56', '2023-06-13 00:20:50', 1, 2, 'mobile,gadgets,detergent'),
(5, 'Watch', 'watch', '2023-06-07-64800deddb1ad.png', 0, 0, '2023-06-07 04:56:13', '2023-06-07 04:56:13', 0, 3, 'clock'),
(6, 'Laptop', 'laptop', '2023-06-07-64800dfe0b584.png', 0, 0, '2023-06-07 04:56:30', '2023-06-07 04:58:06', 0, 2, 'computer'),
(7, 'Health Care', 'health-care', '2023-06-07-64800e0f14489.png', 0, 0, '2023-06-07 04:56:47', '2023-06-07 04:56:47', 0, 2, 'diet,food,exercise'),
(8, 'Grocery', 'grocery', '2023-06-07-64800e201d329.png', 0, 0, '2023-06-07 04:57:04', '2023-06-07 04:57:04', 0, 2, 'kitchen'),
(9, 'Fashion', 'fashion', '2023-06-07-64800e32ae2a2.png', 0, 0, '2023-06-07 04:57:22', '2023-06-13 00:00:10', 0, 2, 'style,detergent'),
(10, 'Cosmetics', 'cosmetics', '2023-06-07-64800e4290f53.png', 0, 0, '2023-06-07 04:57:38', '2023-06-12 23:59:17', 0, 2, 'style,skin care,shampoo,soap,detergent');

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

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(2, 0, 2, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(3, 0, 3, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(4, 0, 4, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(5, 0, 5, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(6, 0, 6, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(7, 0, 7, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(8, 0, 8, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(9, 0, 9, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26'),
(10, 0, 10, 0.00, NULL, '2023-06-07 08:00:26', '2023-06-07 08:00:26');

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
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
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

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `admin_id`, `delivery_man_id`, `message`, `sent_by_customer`, `sent_by_seller`, `sent_by_admin`, `sent_by_delivery_man`, `seen_by_customer`, `seen_by_seller`, `seen_by_admin`, `seen_by_delivery_man`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 3, 2, NULL, NULL, 'Say hello!', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-06-17 05:12:50', '2023-06-17 05:17:25', 2),
(2, 3, 2, NULL, NULL, 'Hi', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-06-17 05:13:15', '2023-06-17 05:17:25', 2),
(3, 3, 2, NULL, NULL, 'How are you?', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-06-17 05:13:43', '2023-06-17 05:17:25', 2),
(4, 3, 2, NULL, NULL, 'I\'m fine, and you?', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-06-17 05:14:17', '2023-06-17 05:17:25', 2);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
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
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
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
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
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
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_bearer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
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
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(199, '2023_06_08_071355_create_product_weights_table', 70),
(201, '2023_06_08_110805_add_column_to_products_table', 71),
(202, '2023_06_11_112222_create_product_variation_images_table', 72);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '0', 'customer', 'paid', 'delivered', 'cash', NULL, 250, '0.00', '0', NULL, NULL, '2023-06-07 05:56:25', '2023-06-07 05:56:25', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100002, '3', 'customer', 'paid', 'pending', 'cash_on_delivery', '', 84745, '0.00', '0', NULL, '1', '2023-06-17 00:22:57', '2023-06-17 03:47:21', 0, NULL, '0', 'inhouse', 2, 45.00, '2463-qQ5Yl-1686982977', '142166', 1, 'admin', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, '2023-06-17', NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 35, '0.00', '0', NULL, '1', '2023-06-17 03:45:13', '2023-06-17 04:38:24', 0, NULL, '0', 'inhouse', 2, 15.00, '1799-eacvP-1686995113', '915882', 2, 'seller', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 56525, '0.00', '0', NULL, '1', '2023-06-17 03:59:31', '2023-06-17 04:35:25', 0, NULL, '0', 'inhouse', 2, 25.00, '4214-yQAU3-1686995971', '251761', 2, 'seller', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 35, '0.00', '0', NULL, '1', '2023-06-17 04:14:54', '2023-06-17 04:34:37', 0, NULL, '0', 'inhouse', 2, 15.00, '5025-zAXCM-1686996894', '107773', 2, 'seller', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 56525, '0.00', '0', NULL, '1', '2023-06-17 04:23:15', '2023-06-17 04:32:08', 0, NULL, '0', 'inhouse', 2, 25.00, '6753-f5Z9W-1686997395', '334929', 2, 'seller', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '3', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 56525, '0.00', '0', NULL, '1', '2023-06-17 05:03:33', '2023-06-17 05:04:00', 0, NULL, '0', 'inhouse', 2, 25.00, '8946-FkP7v-1686999813', '620946', 2, 'seller', '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":3,\"contact_person_name\":\"ABC\",\"address_type\":\"home\",\"address\":\"Y=15 momhadpur\",\"city\":\"Dhaka, Bangladesh\",\"zip\":\"1207\",\"phone\":\"01700000000\",\"created_at\":\"2023-06-17T06:22:36.000000Z\",\"updated_at\":\"2023-06-17T06:22:36.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"DIY Plastic Dumplings Maker Mold\",\"slug\":\"diy-plastic-dumplings-maker-mold-eW4z9T\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1}]\",\"brand_id\":3,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64801afe7b11b.png\\\",\\\"2023-06-07-64801afe7b943.png\\\"]\",\"thumbnail\":\"2023-06-07-64801afe7be65.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":250,\"purchase_price\":190,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":500,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T05:51:58.000000Z\",\"updated_at\":\"2023-06-07T05:51:58.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"182575\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 250, 0, 0, 'delivered', 'paid', '2023-06-07 05:56:25', '2023-06-07 05:56:25', NULL, '', '[]', 'discount_on_product', 1, 0),
(2, 100002, 15, 1, NULL, '{\"id\":15,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"iPhone 11\",\"slug\":\"iphone-11-Wr8PjE\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64803a14ee2e0.png\\\",\\\"2023-06-07-64803a14ee84d.png\\\"]\",\"thumbnail\":\"2023-06-07-64803a14efd9a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AliceBlue\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AntiqueWhite\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":56500,\"purchase_price\":56499.97,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2,\"minimum_order_qty\":1,\"details\":\"<h1><strong>iPhone 11<\\/strong><\\/h1>\\r\\n\\r\\n<p>iPhone 11 is a combination of everything but in a proper amount. It holds a completely new dual-camera system and a marvelous chipset.&nbsp; It has the toughest glass in a smartphone and day-long battery backup. All these features make the iPhone 11 pioneer among recent flagships.&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Alluring Design<\\/p>\\r\\n\\r\\n<p>Magnificent Camera<\\/p>\\r\\n\\r\\n<p>Sustainable Battery Life<\\/p>\\r\\n\\r\\n<p>Powerful Performance<\\/p>\\r\\n\\r\\n<p>Top-notch Security<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<h2><strong>iPhone 11 - Overview<\\/strong><\\/h2>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Alluring Design<\\/strong><\\/h3>\\r\\n\\r\\n<p>iPhone 11 pro is a complete phone. Whether it comes to design or alluring colors. It packs a matte-finished back glass with perfectly fitted buttons. The round edge and the perfectly aligned dual camera make it even more beautiful. The design accomplishes with the colors. Black, Red, White, Yellow, Purple, Green every color makes the outlook different but still gorgeous.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Magnificent Camera<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with two different cameras: Wide and Ultrawide. But both cameras do the same. Takes awesome photos.&nbsp; Ultrawide mode increases the field of view more than four times. You can get a top-notch quality video. Furthermore, the night mode is surprising, you will get the best low-light pictures ever.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Sustainable Battery Life<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 3110 mAh non-remove-able battery. Alongside the battery, it holds a fast wired charging system. You can charge it fully with a charging cable in less than&nbsp; 1.5 hours. You can also charge the phone with a Qi wireless charger.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Powerful Performance<\\/strong><\\/h3>\\r\\n\\r\\n<p>The phone is among the greatest performances ever thanks to the newest A13 bionic chipset with a neural engine. The chipset is a smart chip that can sustain every feature in a wiser approach in addition to being a powerful performer. Particularly in terms of battery life.<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Top-notch Security<\\/strong><\\/h3>\\r\\n\\r\\n<p>Privacy concerns are a constant problem for iPhone. iPhone 11&nbsp; did not modify anything. Your personal information is constantly in your hands thanks to the iPhone. Safari&#39;s smart blocking capabilities stop trackers from monitoring your browsing. It displays the banned information from your Privacy Report. So, whether you browse the web or use apps on your iPhone, it is entirely safe. Face Id is the most reliable lock solution when it comes to locking phones.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T14:04:36.000000Z\",\"updated_at\":\"2023-06-12T09:21:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"187779\",\"short_desc\":null,\"in_the_box\":null,\"warranty_type\":null,\"warranty\":null,\"warranty_policy\":null,\"weight_id\":5,\"length\":\"0.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 56500, 0, 0, 'delivered', 'unpaid', '2023-06-17 00:22:57', '2023-06-17 00:26:28', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(3, 100002, 17, 1, NULL, '{\"id\":17,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Oppo F21 Pro - Official\",\"slug\":\"oppo-f21-pro-official-ytq0Gl\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64803bf350c0c.png\\\",\\\"2023-06-07-64803bf3510cd.png\\\"]\",\"thumbnail\":\"2023-06-07-64803bf3513c0.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":28200,\"purchase_price\":25500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":200,\"minimum_order_qty\":1,\"details\":\"<h1><strong>Oppo F21 Pro Official<\\/strong><\\/h1>\\r\\n\\r\\n<p>When it&#39;s time to talk about Oppo F21 Pro, then the first thing coming out is it&rsquo;s ultimate self portrait taking capability. It&nbsp; comes with an astounding camera that takes the standard of selfie to a new level. Alongside camera features it also holds a system performance optimizer with a long battery backup.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>All these things can be possible on a very friendly budget. So many dynamic camera modes surely gives you an opportunity&nbsp; to capture every precious moment.&nbsp;&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>The sleek outlook&nbsp; combines with alluring colors and makes the phone&nbsp; the prime of mid level.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>4 key factors that makes the difference<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p><strong>Flagship Sony IMX709 Selfie Sensor<\\/strong><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>AI Portrait Enhancement<\\/strong><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Fiberglass Leather<\\/strong><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p><strong>Ultra Slim Retro Design<\\/strong><\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h2>&nbsp;<\\/h2>\\r\\n\\r\\n<h2><strong>Specifications of Oppo F21Pro<\\/strong><\\/h2>\\r\\n\\r\\n<h3><strong>Selfie Master Camera<\\/strong><\\/h3>\\r\\n\\r\\n<p>The phone breaks the silence with its ultimate selfie camera. With flagship Sony IMX709 selfie sensor and several selfie modes take out of the world quality selfies in every light whether it is low or highlight.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>The 64MP Triple camera gives you a great photography experience with its multiple camera features. You can capture your perfect moment with a 48MP wide main camera with great details&nbsp; and 2MP each depth and macro camera. Which helps to get precise and natural depth photos and also explore the miniature world.The dynamic night plus makes your night more dazzling by taking extraordinary night photos.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Night Plus Mode Flash Snapshot Segment 1st Microlens Camera features make the photography totally impressive and blow your mind.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>32 MP HDR selfie camera with Sony IMX709 selfie sensor, AI Portrait Enhancement, Bokeh Flare Portrait features are changing the definition of selfie capable of taking share worthy crisp self portraits and makes your moment beautiful then ever.<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Main Camera<\\/strong><\\/h3>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>64 MP(wide)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>2 MP (macro)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>2 MP(depth)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Night Plus Mode&nbsp;<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Flash Snapshot<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Segment 1st Microlens Camera<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>1080p Video at 30fps<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Selfie Camera<\\/strong><\\/h3>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>32MP Selfie Camera<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Sony IMX709 selfie sensor<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>AI Portrait Enhancement<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Bokeh Flare Portrait<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>1080p Videography at 30fps<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Mind Blowing Performance<\\/strong>&nbsp;<\\/h3>\\r\\n\\r\\n<p>The phone holds an Octa core Qualcomm SM6225 Snapdragon 680 4G (6 nm) processor and PowerVR GM9446.These powerful elements boost the phones performance better than ever. You will feel the smooth performance when using the phone. The phone also serves it best while gaming and increases the gaming performance.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>Qualcomm SM6225 Snapdragon 680 4G (6 nm)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Octa-core&nbsp;<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>2.4GHz Kryo 265 Gold<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Adreno 610<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Android 12<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>ColorOS 12.1<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>8GB RAM<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>256 GB Storage<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>MicroSDXC support<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>UFS 2.2 Storage System<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Luxurious Retro Design<\\/strong>&nbsp;<\\/h3>\\r\\n\\r\\n<p>The ultra thin design with exclusive dazzling finish with fiberglass leather attached retro look makes it more fascinating to the users. It is also fingerprint proof and wear resistant and the back is so shiny. The giant AMOLED display with punch hole pattern and under display optical fingerprint makes it smoother than ever.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>The AI quad Cameras set in a fantastic fitted with a vector module.&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>The elegance of the phone&nbsp; is filled with its color. The discerning finish with 2 marvelous colors takes the elegance level to a new level. Cosmic Black&nbsp; and Sunset orange&nbsp; are available colors of Oppo F21 Pro .<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>Luxurious Retro Design<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Lavish Back with Fiberglass Leather<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Well patterned body design<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Vector Patterned Camera Module<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Ultra Slim (7.5mm)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Ultra Thin (175gm)<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>AMOLED Display with punch hole Pattern<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\\r\\n\\r\\n<p><br \\/>\\r\\n&nbsp;<\\/p>\\r\\n\\r\\n<h3><strong>Mega Battery<\\/strong><\\/h3>\\r\\n\\r\\n<p>This Oppo phone contains a massive battery. 4500mAh in exact measurement. So you have not to worry about battery backup. Just go on with this long lasting battery.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Because it also has a 33W fast charging that boosts your battery within minutes.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>\\r\\n\\t<p>Li-Po 4500 mAh<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Non-removable<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>33W Fast Charging&nbsp;<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Reverse Charging<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T14:12:35.000000Z\",\"updated_at\":\"2023-06-07T14:12:35.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"157252\",\"short_desc\":null,\"in_the_box\":null,\"warranty_type\":null,\"warranty\":null,\"warranty_policy\":null,\"weight_id\":5,\"length\":\"0.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 28200, 0, 0, 'delivered', 'unpaid', '2023-06-17 00:22:57', '2023-06-17 00:26:28', NULL, '', '[]', 'discount_on_product', 1, 0),
(4, 100003, 20, 2, NULL, '{\"id\":20,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"For testing purpose\",\"slug\":\"for-testing-purpose-HiAvWl\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-11-6485763466692.png\\\"]\",\"thumbnail\":\"2023-06-11-648576346dd8e.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#9966CC\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"      M\\\",\\\"      XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AliceBlue-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AliceBlue-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-XL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":20,\"purchase_price\":15,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<p>For testing purpose<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-11T07:22:28.000000Z\",\"updated_at\":\"2023-06-12T06:51:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"For testing purpose\",\"meta_description\":\"For testing purpose\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111497\",\"short_desc\":\"<p>For testing purpose<\\/p>\",\"in_the_box\":\"For testing purpose\",\"warranty_type\":\"seller\",\"warranty\":\"1m\",\"warranty_policy\":\"For testing purpose\",\"weight_id\":4,\"length\":\"15.00\",\"height\":\"25.00\",\"width\":\"35.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 20, 0, 0, 'delivered', 'unpaid', '2023-06-17 03:45:13', '2023-06-17 04:38:24', NULL, 'AliceBlue-L', '{\"color\":\"AliceBlue\",\"Size\":\"L\"}', 'discount_on_product', 1, 0),
(5, 100004, 15, 2, NULL, '{\"id\":15,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"iPhone 11\",\"slug\":\"iphone-11-Wr8PjE\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64803a14ee2e0.png\\\",\\\"2023-06-07-64803a14ee84d.png\\\"]\",\"thumbnail\":\"2023-06-07-64803a14efd9a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AliceBlue\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AntiqueWhite\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":56500,\"purchase_price\":56499.97,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<h1><strong>iPhone 11<\\/strong><\\/h1>\\r\\n\\r\\n<p>iPhone 11 is a combination of everything but in a proper amount. It holds a completely new dual-camera system and a marvelous chipset.&nbsp; It has the toughest glass in a smartphone and day-long battery backup. All these features make the iPhone 11 pioneer among recent flagships.&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Alluring Design<\\/p>\\r\\n\\r\\n<p>Magnificent Camera<\\/p>\\r\\n\\r\\n<p>Sustainable Battery Life<\\/p>\\r\\n\\r\\n<p>Powerful Performance<\\/p>\\r\\n\\r\\n<p>Top-notch Security<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<h2><strong>iPhone 11 - Overview<\\/strong><\\/h2>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Alluring Design<\\/strong><\\/h3>\\r\\n\\r\\n<p>iPhone 11 pro is a complete phone. Whether it comes to design or alluring colors. It packs a matte-finished back glass with perfectly fitted buttons. The round edge and the perfectly aligned dual camera make it even more beautiful. The design accomplishes with the colors. Black, Red, White, Yellow, Purple, Green every color makes the outlook different but still gorgeous.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Magnificent Camera<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with two different cameras: Wide and Ultrawide. But both cameras do the same. Takes awesome photos.&nbsp; Ultrawide mode increases the field of view more than four times. You can get a top-notch quality video. Furthermore, the night mode is surprising, you will get the best low-light pictures ever.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Sustainable Battery Life<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 3110 mAh non-remove-able battery. Alongside the battery, it holds a fast wired charging system. You can charge it fully with a charging cable in less than&nbsp; 1.5 hours. You can also charge the phone with a Qi wireless charger.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Powerful Performance<\\/strong><\\/h3>\\r\\n\\r\\n<p>The phone is among the greatest performances ever thanks to the newest A13 bionic chipset with a neural engine. The chipset is a smart chip that can sustain every feature in a wiser approach in addition to being a powerful performer. Particularly in terms of battery life.<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Top-notch Security<\\/strong><\\/h3>\\r\\n\\r\\n<p>Privacy concerns are a constant problem for iPhone. iPhone 11&nbsp; did not modify anything. Your personal information is constantly in your hands thanks to the iPhone. Safari&#39;s smart blocking capabilities stop trackers from monitoring your browsing. It displays the banned information from your Privacy Report. So, whether you browse the web or use apps on your iPhone, it is entirely safe. Face Id is the most reliable lock solution when it comes to locking phones.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T14:04:36.000000Z\",\"updated_at\":\"2023-06-17T09:56:25.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"187779\",\"short_desc\":null,\"in_the_box\":null,\"warranty_type\":null,\"warranty\":null,\"warranty_policy\":null,\"weight_id\":5,\"length\":\"0.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 56500, 0, 0, 'delivered', 'unpaid', '2023-06-17 03:59:31', '2023-06-17 04:35:25', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(6, 100005, 20, 2, NULL, '{\"id\":20,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"For testing purpose\",\"slug\":\"for-testing-purpose-HiAvWl\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-11-6485763466692.png\\\"]\",\"thumbnail\":\"2023-06-11-648576346dd8e.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#9966CC\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"2\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_2\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"L\\\",\\\"      M\\\",\\\"      XL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-L\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"AliceBlue-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AliceBlue-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AliceBlue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Amethyst-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-Amethyst-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-L\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-M\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"AntiqueWhite-XL\\\",\\\"price\\\":20,\\\"sku\\\":\\\"Ftp-AntiqueWhite-XL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":20,\"purchase_price\":15,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<p>For testing purpose<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-11T07:22:28.000000Z\",\"updated_at\":\"2023-06-17T09:45:13.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"For testing purpose\",\"meta_description\":\"For testing purpose\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"111497\",\"short_desc\":\"<p>For testing purpose<\\/p>\",\"in_the_box\":\"For testing purpose\",\"warranty_type\":\"seller\",\"warranty\":\"1m\",\"warranty_policy\":\"For testing purpose\",\"weight_id\":4,\"length\":\"15.00\",\"height\":\"25.00\",\"width\":\"35.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 20, 0, 0, 'delivered', 'unpaid', '2023-06-17 04:14:54', '2023-06-17 04:34:37', NULL, 'AliceBlue-M', '{\"color\":\"AliceBlue\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(7, 100006, 15, 2, NULL, '{\"id\":15,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"iPhone 11\",\"slug\":\"iphone-11-Wr8PjE\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64803a14ee2e0.png\\\",\\\"2023-06-07-64803a14ee84d.png\\\"]\",\"thumbnail\":\"2023-06-07-64803a14efd9a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AliceBlue\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AntiqueWhite\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":56500,\"purchase_price\":56499.97,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<h1><strong>iPhone 11<\\/strong><\\/h1>\\r\\n\\r\\n<p>iPhone 11 is a combination of everything but in a proper amount. It holds a completely new dual-camera system and a marvelous chipset.&nbsp; It has the toughest glass in a smartphone and day-long battery backup. All these features make the iPhone 11 pioneer among recent flagships.&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Alluring Design<\\/p>\\r\\n\\r\\n<p>Magnificent Camera<\\/p>\\r\\n\\r\\n<p>Sustainable Battery Life<\\/p>\\r\\n\\r\\n<p>Powerful Performance<\\/p>\\r\\n\\r\\n<p>Top-notch Security<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<h2><strong>iPhone 11 - Overview<\\/strong><\\/h2>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Alluring Design<\\/strong><\\/h3>\\r\\n\\r\\n<p>iPhone 11 pro is a complete phone. Whether it comes to design or alluring colors. It packs a matte-finished back glass with perfectly fitted buttons. The round edge and the perfectly aligned dual camera make it even more beautiful. The design accomplishes with the colors. Black, Red, White, Yellow, Purple, Green every color makes the outlook different but still gorgeous.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Magnificent Camera<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with two different cameras: Wide and Ultrawide. But both cameras do the same. Takes awesome photos.&nbsp; Ultrawide mode increases the field of view more than four times. You can get a top-notch quality video. Furthermore, the night mode is surprising, you will get the best low-light pictures ever.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Sustainable Battery Life<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 3110 mAh non-remove-able battery. Alongside the battery, it holds a fast wired charging system. You can charge it fully with a charging cable in less than&nbsp; 1.5 hours. You can also charge the phone with a Qi wireless charger.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Powerful Performance<\\/strong><\\/h3>\\r\\n\\r\\n<p>The phone is among the greatest performances ever thanks to the newest A13 bionic chipset with a neural engine. The chipset is a smart chip that can sustain every feature in a wiser approach in addition to being a powerful performer. Particularly in terms of battery life.<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Top-notch Security<\\/strong><\\/h3>\\r\\n\\r\\n<p>Privacy concerns are a constant problem for iPhone. iPhone 11&nbsp; did not modify anything. Your personal information is constantly in your hands thanks to the iPhone. Safari&#39;s smart blocking capabilities stop trackers from monitoring your browsing. It displays the banned information from your Privacy Report. So, whether you browse the web or use apps on your iPhone, it is entirely safe. Face Id is the most reliable lock solution when it comes to locking phones.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T14:04:36.000000Z\",\"updated_at\":\"2023-06-17T09:59:31.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"187779\",\"short_desc\":null,\"in_the_box\":null,\"warranty_type\":null,\"warranty\":null,\"warranty_policy\":null,\"weight_id\":5,\"length\":\"0.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 56500, 0, 0, 'delivered', 'unpaid', '2023-06-17 04:23:15', '2023-06-17 04:25:55', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0),
(8, 100007, 15, 2, NULL, '{\"id\":15,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"iPhone 11\",\"slug\":\"iphone-11-Wr8PjE\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-07-64803a14ee2e0.png\\\",\\\"2023-06-07-64803a14ee84d.png\\\"]\",\"thumbnail\":\"2023-06-07-64803a14efd9a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#FAEBD7\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AliceBlue\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"AntiqueWhite\\\",\\\"price\\\":56500,\\\"sku\\\":\\\"i1-AntiqueWhite\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":56500,\"purchase_price\":56499.97,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<h1><strong>iPhone 11<\\/strong><\\/h1>\\r\\n\\r\\n<p>iPhone 11 is a combination of everything but in a proper amount. It holds a completely new dual-camera system and a marvelous chipset.&nbsp; It has the toughest glass in a smartphone and day-long battery backup. All these features make the iPhone 11 pioneer among recent flagships.&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Alluring Design<\\/p>\\r\\n\\r\\n<p>Magnificent Camera<\\/p>\\r\\n\\r\\n<p>Sustainable Battery Life<\\/p>\\r\\n\\r\\n<p>Powerful Performance<\\/p>\\r\\n\\r\\n<p>Top-notch Security<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<h2><strong>iPhone 11 - Overview<\\/strong><\\/h2>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Alluring Design<\\/strong><\\/h3>\\r\\n\\r\\n<p>iPhone 11 pro is a complete phone. Whether it comes to design or alluring colors. It packs a matte-finished back glass with perfectly fitted buttons. The round edge and the perfectly aligned dual camera make it even more beautiful. The design accomplishes with the colors. Black, Red, White, Yellow, Purple, Green every color makes the outlook different but still gorgeous.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Magnificent Camera<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with two different cameras: Wide and Ultrawide. But both cameras do the same. Takes awesome photos.&nbsp; Ultrawide mode increases the field of view more than four times. You can get a top-notch quality video. Furthermore, the night mode is surprising, you will get the best low-light pictures ever.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Sustainable Battery Life<\\/strong><\\/h3>\\r\\n\\r\\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 3110 mAh non-remove-able battery. Alongside the battery, it holds a fast wired charging system. You can charge it fully with a charging cable in less than&nbsp; 1.5 hours. You can also charge the phone with a Qi wireless charger.&nbsp;<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Powerful Performance<\\/strong><\\/h3>\\r\\n\\r\\n<p>The phone is among the greatest performances ever thanks to the newest A13 bionic chipset with a neural engine. The chipset is a smart chip that can sustain every feature in a wiser approach in addition to being a powerful performer. Particularly in terms of battery life.<\\/p>\\r\\n\\r\\n<h3>&nbsp;<\\/h3>\\r\\n\\r\\n<h3><strong>Top-notch Security<\\/strong><\\/h3>\\r\\n\\r\\n<p>Privacy concerns are a constant problem for iPhone. iPhone 11&nbsp; did not modify anything. Your personal information is constantly in your hands thanks to the iPhone. Safari&#39;s smart blocking capabilities stop trackers from monitoring your browsing. It displays the banned information from your Privacy Report. So, whether you browse the web or use apps on your iPhone, it is entirely safe. Face Id is the most reliable lock solution when it comes to locking phones.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-07T14:04:36.000000Z\",\"updated_at\":\"2023-06-17T10:23:15.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"187779\",\"short_desc\":null,\"in_the_box\":null,\"warranty_type\":null,\"warranty\":null,\"warranty_policy\":null,\"weight_id\":5,\"length\":\"0.00\",\"height\":\"0.00\",\"width\":\"0.00\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 56500, 0, 0, 'pending', 'unpaid', '2023-06-17 05:03:33', '2023-06-17 05:03:33', NULL, 'AliceBlue', '{\"color\":\"AliceBlue\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100002, 3, 'customer', 'pending', NULL, '2023-06-17 00:22:57', '2023-06-17 00:22:57'),
(2, 100002, 0, 'admin', 'delivered', NULL, '2023-06-17 00:26:27', '2023-06-17 00:26:27'),
(3, 100003, 3, 'customer', 'pending', NULL, '2023-06-17 03:45:13', '2023-06-17 03:45:13'),
(4, 100003, 2, 'seller', 'confirmed', NULL, '2023-06-17 03:46:10', '2023-06-17 03:46:10'),
(5, 100002, 0, 'admin', 'confirmed', NULL, '2023-06-17 03:47:21', '2023-06-17 03:47:21'),
(6, 100004, 3, 'customer', 'pending', NULL, '2023-06-17 03:59:31', '2023-06-17 03:59:31'),
(7, 100004, 0, 'admin', 'confirmed', NULL, '2023-06-17 04:00:13', '2023-06-17 04:00:13'),
(8, 100005, 3, 'customer', 'pending', NULL, '2023-06-17 04:14:54', '2023-06-17 04:14:54'),
(9, 100005, 0, 'admin', 'confirmed', NULL, '2023-06-17 04:16:13', '2023-06-17 04:16:13'),
(10, 100006, 3, 'customer', 'pending', NULL, '2023-06-17 04:23:15', '2023-06-17 04:23:15'),
(11, 100006, 0, 'admin', 'confirmed', NULL, '2023-06-17 04:24:13', '2023-06-17 04:24:13'),
(12, 100006, 0, 'admin', 'delivered', NULL, '2023-06-17 04:25:55', '2023-06-17 04:25:55'),
(13, 100006, 0, 'admin', 'confirmed', NULL, '2023-06-17 04:31:21', '2023-06-17 04:31:21'),
(14, 100006, 0, 'admin', 'delivered', NULL, '2023-06-17 04:32:08', '2023-06-17 04:32:08'),
(15, 100005, 0, 'admin', 'delivered', NULL, '2023-06-17 04:34:37', '2023-06-17 04:34:37'),
(16, 100004, 0, 'admin', 'delivered', NULL, '2023-06-17 04:35:25', '2023-06-17 04:35:25'),
(17, 100003, 2, 'seller', 'confirmed', NULL, '2023-06-17 04:37:42', '2023-06-17 04:37:42'),
(18, 100003, 0, 'admin', 'delivered', NULL, '2023-06-17 04:38:24', '2023-06-17 04:38:24'),
(19, 100007, 3, 'customer', 'pending', NULL, '2023-06-17 05:03:33', '2023-06-17 05:03:33');

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
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100002, '84700.00', '84700.00', '0.00', 'admin', 'disburse', '45.00', '0.00', '2023-06-17 00:26:28', '2023-06-17 00:26:28', 3, 'admin', 'admin', 'cash_on_delivery', '8341-JtTf1-1686983188', 1),
(2, 100006, '56500.00', '56500.00', '0.00', 'admin', 'disburse', '25.00', '0.00', '2023-06-17 04:25:55', '2023-06-17 04:25:55', 3, 'seller', 'admin', 'cash_on_delivery', '6549-vBwlq-1686997555', 2),
(2, 100005, '20.00', '20.00', '0.00', 'admin', 'disburse', '15.00', '0.00', '2023-06-17 04:34:37', '2023-06-17 04:34:37', 3, 'seller', 'admin', 'cash_on_delivery', '3909-Zzktt-1686998077', 3),
(2, 100004, '56500.00', '56500.00', '0.00', 'admin', 'disburse', '25.00', '0.00', '2023-06-17 04:35:25', '2023-06-17 04:35:25', 3, 'seller', 'admin', 'cash_on_delivery', '7315-vVS8o-1686998125', 4),
(2, 100003, '20.00', '20.00', '0.00', 'admin', 'disburse', '15.00', '0.00', '2023-06-17 04:38:24', '2023-06-17 04:38:24', 3, 'seller', 'admin', 'cash_on_delivery', '1728-iBpnq-1686998304', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `phone_or_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital_file_ready` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_the_box` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_policy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_id` tinyint(4) DEFAULT NULL,
  `length` decimal(8,2) DEFAULT 0.00,
  `height` decimal(8,2) DEFAULT 0.00,
  `width` decimal(8,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`, `short_desc`, `in_the_box`, `warranty_type`, `warranty`, `warranty_policy`, `weight_id`, `length`, `height`, `width`) VALUES
(2, 'admin', 1, 'Creative orange juice squeezer lemon sprayer', 'creative-orange-juice-squeezer-lemon-sprayer-fffUty', 'physical', '[{\"id\":\"1\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648016e4680df.png\",\"2023-06-07-648016e468800.png\",\"2023-06-07-648016e468b50.png\"]', '2023-06-07-648016e468d92.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 160, 110, '0', 'percent', '0', 'flat', 500, 1, NULL, 0, NULL, '2023-06-07 05:34:28', '2023-06-07 05:34:28', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '131726', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(3, 'admin', 1, 'Garlic Press Manual Garlic Mincer Chopping Garlic Tools', 'garlic-press-manual-garlic-mincer-chopping-garlic-tools-QLh5zj', 'physical', '[{\"id\":\"1\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-6480182e79761.png\",\"2023-06-07-6480182e79d72.png\",\"2023-06-07-6480182e7a0ee.png\"]', '2023-06-07-6480182e7a3f4.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 670, 560, '0', 'percent', '0', 'flat', 500, 1, NULL, 0, NULL, '2023-06-07 05:39:58', '2023-06-07 05:39:58', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '147210', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(4, 'admin', 1, 'DIY Plastic Dumplings Maker Mold', 'diy-plastic-dumplings-maker-mold-eW4z9T', 'physical', '[{\"id\":\"1\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64801afe7b11b.png\",\"2023-06-07-64801afe7b943.png\"]', '2023-06-07-64801afe7be65.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 250, 190, '0', 'percent', '0', 'flat', 499, 1, NULL, 0, NULL, '2023-06-07 05:51:58', '2023-06-07 05:56:25', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '182575', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(5, 'admin', 1, '5-in-1 Vegetable Cutter', '5-in-1-vegetable-cutter-whPMMt', 'physical', '[{\"id\":\"1\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64801ba02ab7e.png\",\"2023-06-07-64801ba02b22d.png\"]', '2023-06-07-64801ba02b4ef.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1700, 1450, '0', 'percent', '0', 'flat', 500, 1, '<p>This is a 5-in-1 vegetable cutting slicer that allows you to cut a variety of vegetables and fruits 0.5mm to 8mm thick by simply turning the controllers and pressing the handle. This product is made with a premium hygienic material and the blades are made with 420j stainless steel which is more sharp and durable. There is no need to change the blade of this cutter so you can use water for a long time. This vegetable cutter has hidden blades so it is safer to use.</p>', 0, NULL, '2023-06-07 05:54:40', '2023-06-07 05:54:40', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '169468', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(6, 'admin', 1, 'Desktop smart multi-function lamp socket - with remote', 'desktop-smart-multi-function-lamp-socket-with-remote-Ivjkjd', 'physical', '[{\"id\":\"2\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64803153cf137.png\",\"2023-06-07-64803153cfdb3.png\",\"2023-06-07-64803153d0063.png\",\"2023-06-07-64803153d041a.png\"]', '2023-06-07-64803153d0815.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1650, 1350, '0', 'percent', '0', 'flat', 500, 1, NULL, 0, NULL, '2023-06-07 07:27:15', '2023-06-07 07:27:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '184355', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(7, 'admin', 1, 'Wireless Bluetooth Speaker - Torch-table lamp. 3 in 1', 'wireless-bluetooth-speaker-torch-table-lamp-3-in-1-RRNp4g', 'physical', '[{\"id\":\"2\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648031f423cf2.png\",\"2023-06-07-648031f4241c2.png\",\"2023-06-07-648031f4243b7.png\"]', '2023-06-07-648031f4245bb.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 850, 600, '0', 'percent', '0', 'flat', 500, 1, '<p>Wireless Bluetooth Speaker - Torch-table lamp. 3 in 1</p>', 0, NULL, '2023-06-07 07:29:56', '2023-06-07 07:29:56', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '101436', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(8, 'admin', 1, 'Wifi Wireless Light Bulb Security Camera - 360 Degree HD', 'wifi-wireless-light-bulb-security-camera-360-degree-hd-aMvTmv', 'physical', '[{\"id\":\"2\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648032e3f0a91.png\",\"2023-06-07-648032e3f0fef.png\",\"2023-06-07-648032e3f11b0.png\"]', '2023-06-07-648032e3f181a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 2160, 1750, '0', 'percent', '0', 'flat', 550, 1, '<ul>\r\n	<li>They act as tools for security at home and in the office.</li>\r\n	<li>The light bulb cameras can record events even if it is in the dark.</li>\r\n	<li>Owl Cam record high-quality footages. This is due to the high resolution.</li>\r\n	<li>They are inexpensive to maintain and simple to install.</li>\r\n	<li>They are energy-saving devices.</li>\r\n	<li>They are portable and simple to use, making them effective in providing security in any desired location.</li>\r\n	<li>They can be used as surveillance devices since they cannot be easily differentiated from conventional light bulbs.</li>\r\n</ul>', 0, NULL, '2023-06-07 07:33:55', '2023-06-07 07:33:55', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '138208', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(9, 'admin', 1, 'Rechargeable Mini Desktop Clip Fan 360 Degrees', 'rechargeable-mini-desktop-clip-fan-360-degrees-xLCWoB', 'physical', '[{\"id\":\"2\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-6480338119d82.png\",\"2023-06-07-648033811a2c0.png\",\"2023-06-07-648033811a54e.png\"]', '2023-06-07-648033811a833.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 950, 650, '0', 'percent', '0', 'flat', 550, 1, '<p><strong>Specifications:</strong></p>\r\n\r\n<p>Product material: ABS/electronic components</p>\r\n\r\n<p>Product size: 158*130*66mm</p>\r\n\r\n<p>Battery voltage: 3.7V</p>\r\n\r\n<p>Battery capacity: 1200mAh</p>', 0, NULL, '2023-06-07 07:36:33', '2023-06-07 07:36:33', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137925', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(10, 'admin', 1, '2023 best selling neck fan', '2023-best-selling-neck-fan-dwWRdu', 'physical', '[{\"id\":\"2\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648034c4d6e9b.png\",\"2023-06-07-648034c4d7486.png\"]', '2023-06-07-648034c4d7760.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 990, 650, '0', 'percent', '0', 'flat', 546, 1, '<p><span dir=\"auto\">𝐑𝐞𝐜𝐡𝐚𝐫𝐠𝐞𝐚𝐛𝐥𝐞 𝐏𝐨𝐫𝐭𝐚𝐛𝐥𝐞 𝐍𝐞𝐜𝐤 𝐅𝐚𝐧 <img alt=\"🤩\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t58/1/16/1f929.png\" style=\"height:16px; width:16px\" /><img alt=\"🤩\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t58/1/16/1f929.png\" style=\"height:16px; width:16px\" /><img alt=\"🤩\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t58/1/16/1f929.png\" style=\"height:16px; width:16px\" /></span></p>\r\n\r\n<p><span dir=\"auto\">যেকোনো সময় যে কোনো জায়গায় ঠাণ্ডা রাখুন নিজেকে<img alt=\"😅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t53/1/16/1f605.png\" style=\"height:16px; width:16px\" /></span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" /> বাসে অথবা অফিসে ট্রাভেলিং বা রান্নাঘর যেকোনো সময় অসহ্য গরমে ব্যবহার করতে পারবেন এই নেক ফ্যান।</span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" /> ৩টি স্পীডে চালাতে পারবেন এই ফ্যানটি।</span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" />সাথে থাকছে USB Cable এবং আপনার মোবাইল চার্জার অথবা কম্পিউটারে চার্জ করতে পারবেন। চার্জ থাকবে ৩ - ৪ ঘন্টা।</span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" />আপনি আপনার গলায় ফ্যানটি ঝুলিয়ে রাখতে পারেন।এটিকে সর্বত্র নিয়ে যেতে পারেন।</span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" />ফ্যান-কে 360&deg; পর্যন্ত ঘোরানো যায়।</span></p>\r\n\r\n<p><span dir=\"auto\"><img alt=\"✅\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t33/1/16/2705.png\" style=\"height:16px; width:16px\" />এই ফ্যানটি গলায় পরার জন্য ডিজাইন করা হয়েছে যাতে আপনার হাত মুক্ত থাকে।</span></p>', 0, NULL, '2023-06-07 07:41:56', '2023-06-07 07:41:56', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '100651', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(11, 'admin', 1, 'Portable - rechargeable juicer', 'portable-rechargeable-juicer-o1P94t', 'physical', '[{\"id\":\"3\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648035e60ae98.png\",\"2023-06-07-648035e60b882.png\",\"2023-06-07-648035e60bb68.png\"]', '2023-06-07-648035e60bec5.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 950, 650, '0', 'percent', '0', 'flat', 550, 1, NULL, 0, NULL, '2023-06-07 07:46:46', '2023-06-07 07:46:46', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '141421', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(12, 'admin', 1, 'Portable - rechargeable juicer', 'portable-rechargeable-juicer-AYvAaN', 'physical', '[{\"id\":\"3\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-6480378e2392c.png\",\"2023-06-07-6480378e24160.png\",\"2023-06-07-6480378e24338.png\",\"2023-06-07-6480378e24691.png\"]', '2023-06-07-6480378e24bca.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1750, 1450, '0', 'percent', '0', 'flat', 500, 1, NULL, 0, NULL, '2023-06-07 07:53:50', '2023-06-07 07:53:50', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '164624', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(13, 'admin', 1, 'Ninja 2-in-1 Blender', 'ninja-2-in-1-blender-zHaqkJ', 'physical', '[{\"id\":\"3\",\"position\":1}]', 3, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648037f0121ca.png\"]', '2023-06-07-648037f012a38.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 3500, 3500, '0', 'percent', '0', 'flat', 300, 1, '<p>2 Blenders in 1 &ndash; Multi-serve blender and personal blender<br />\r\nAuto-iQ Technology &ndash; One-touch blending programs do all the hard work for you<br />\r\nDurable and Powerful &ndash; 1200W motor drives interchangeable stainless-steel blades to blend tough ingredients<br />\r\nEasy to Use &ndash; Simple controls, manual settings and dishwasher-safe parts<br />\r\nIncludes 2.1L Jug, 700ml Cup with Lid, Pro Extractor Blade, Stacked Blade, Recipe Guide</p>', 0, NULL, '2023-06-07 07:55:28', '2023-06-07 07:55:28', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '173795', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(14, 'admin', 1, 'iPhone SE 2022', 'iphone-se-2022-Q1Mltk', 'physical', '[{\"id\":\"4\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-648039991b0b1.png\",\"2023-06-07-648039991b565.png\"]', '2023-06-07-648039991b7ff.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 47000, 42000, '0', 'percent', '0', 'flat', 200, 1, NULL, 0, NULL, '2023-06-07 08:02:33', '2023-06-07 08:02:33', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '133140', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(15, 'seller', 2, 'iPhone 11', 'iphone-11-Wr8PjE', 'physical', '[{\"id\":\"4\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64803a14ee2e0.png\",\"2023-06-07-64803a14ee84d.png\"]', '2023-06-07-64803a14efd9a.png', NULL, NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#FAEBD7\"]', 0, 'null', '[]', '[{\"type\":\"AliceBlue\",\"price\":56500,\"sku\":\"i1-AliceBlue\",\"qty\":2},{\"type\":\"AntiqueWhite\",\"price\":56500,\"sku\":\"i1-AntiqueWhite\",\"qty\":5}]', 0, 56500, 56499.97, '0', 'percent', '0', 'flat', 7, 1, '<h1><strong>iPhone 11</strong></h1>\r\n\r\n<p>iPhone 11 is a combination of everything but in a proper amount. It holds a completely new dual-camera system and a marvelous chipset.&nbsp; It has the toughest glass in a smartphone and day-long battery backup. All these features make the iPhone 11 pioneer among recent flagships.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Alluring Design</p>\r\n\r\n<p>Magnificent Camera</p>\r\n\r\n<p>Sustainable Battery Life</p>\r\n\r\n<p>Powerful Performance</p>\r\n\r\n<p>Top-notch Security</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>iPhone 11 - Overview</strong></h2>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Alluring Design</strong></h3>\r\n\r\n<p>iPhone 11 pro is a complete phone. Whether it comes to design or alluring colors. It packs a matte-finished back glass with perfectly fitted buttons. The round edge and the perfectly aligned dual camera make it even more beautiful. The design accomplishes with the colors. Black, Red, White, Yellow, Purple, Green every color makes the outlook different but still gorgeous.&nbsp;</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Magnificent Camera</strong></h3>\r\n\r\n<p>Comes with two different cameras: Wide and Ultrawide. But both cameras do the same. Takes awesome photos.&nbsp; Ultrawide mode increases the field of view more than four times. You can get a top-notch quality video. Furthermore, the night mode is surprising, you will get the best low-light pictures ever.&nbsp;</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Sustainable Battery Life</strong></h3>\r\n\r\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 3110 mAh non-remove-able battery. Alongside the battery, it holds a fast wired charging system. You can charge it fully with a charging cable in less than&nbsp; 1.5 hours. You can also charge the phone with a Qi wireless charger.&nbsp;</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Powerful Performance</strong></h3>\r\n\r\n<p>The phone is among the greatest performances ever thanks to the newest A13 bionic chipset with a neural engine. The chipset is a smart chip that can sustain every feature in a wiser approach in addition to being a powerful performer. Particularly in terms of battery life.</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Top-notch Security</strong></h3>\r\n\r\n<p>Privacy concerns are a constant problem for iPhone. iPhone 11&nbsp; did not modify anything. Your personal information is constantly in your hands thanks to the iPhone. Safari&#39;s smart blocking capabilities stop trackers from monitoring your browsing. It displays the banned information from your Privacy Report. So, whether you browse the web or use apps on your iPhone, it is entirely safe. Face Id is the most reliable lock solution when it comes to locking phones.</p>', 0, NULL, '2023-06-07 08:04:36', '2023-06-17 05:03:33', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '187779', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(16, 'admin', 1, 'iPhone 12 Mini', 'iphone-12-mini-6CRsq9', 'physical', '[{\"id\":\"4\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64803a85462ce.png\"]', '2023-06-07-64803a85468c1.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 60500, 57000, '0', 'percent', '0', 'flat', 200, 1, '<h1><strong>iPhone 12 Mini</strong></h1>\r\n\r\n<p>Blast past fast- the motto of the iPhone 12 series shows the significant upgrade of the iPhone 12. Unlike the other 12 series phone,iPhone 12 mini comes with some extraordinary features. It holds a super powerful chip along with an advanced dual‑camera system. Built with a ceramic shield front that&#39;s tougher than any smartphone glass. It has a bright, beautiful OLED display. Altogether, every upgraded feature comes to iPhone 12 mini yet in a compact size.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>iPhone 12 Mini Key Features</strong></h2>\r\n\r\n<p>Impeccable Design</p>\r\n\r\n<p>Advanced &amp; Impressive Chipset</p>\r\n\r\n<p>Mega Battery Life</p>\r\n\r\n<p>Excellent Camera</p>\r\n\r\n<p>MagSafe Compatibility</p>\r\n\r\n<p>Water and Dust Resistance</p>\r\n\r\n<p>Substantial Security Options</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>iPhone 12 Mini Features Overview</strong></h2>\r\n\r\n<h3><strong>Compact in Size</strong></h3>\r\n\r\n<p>iPhone 12 mini is the smallest phone in iPhone 12 series. It has a 5.7-inch display but is full of advanced features.&nbsp; This phone is perfect for those who love compact-sized phones. Though the size is compact.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Here Comes Something Great</strong>&nbsp;</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Performance</strong></p>\r\n\r\n<p>iPhone 12 mini fills with some extraordinary hardware and software. The hardware and software work together seamlessly. As a result, a great performance is coming out. iPhone holds an&nbsp; A14 Bionic chipset with the latest iOS and groundbreaking GPU. Overall this powerful and fast chipset with the latest updateable software delivers smooth performance in every aspect.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Battery Life</strong></p>\r\n\r\n<p>Comes with an upgraded non-removable battery with great battery life. In exact point, Li-Ion 2227 mAh non-remove-able battery. Alongside the battery, for the first time, iPhone introduced Magsafe, a 15W wireless charging system. You can also charge the phone with a 7.5W Qi wireless charger.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Display</strong></p>\r\n\r\n<p>iPhone 12 mini has a great Super Retina XDR display with wide color and haptic touch capacity. The iPhone 12 mini display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. It increases the viewable area. The display is so much strong and durable for its ceramic shield protection.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Design</strong></p>\r\n\r\n<p>iPhone 12 mini holds a simple yet gorgeous design. It features a&nbsp; completely new flat-edged design with aluminum edges. The phone is thinner and smarter than ever. The buttons are set in an ideal way and the camera is perfectly fitted in a great place. iPhone 12 mini is available in six colors: Blue, Green, Black, White, Product Red, and special Purple.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Camera</strong></p>\r\n\r\n<p>The phone feature a dual-camera setup with wide and ultra-wide lenses. It holds a more capable Smart HDR and improved Night mode with support for the selfie camera. Moreover, the camera introduces ultra-wide for the first time. The exclusive Night mode Time-lapse feature is added to the iPhone 12 mini camera. The camera is capable of recording Dolby Vision with 700 million colors.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Security</strong></p>\r\n\r\n<p>iPhone always helps put you in control of your personal information. Safari intelligently helps block trackers from profiling you&rsquo;re browsing. It shows you the data that have been blocked in your Privacy Report. So you can browse or run apps on your iPhone with complete security.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Resistance</strong></p>\r\n\r\n<p>It holds an IP68-rated Splash, Water, and Dust Resistant. Apple calls it the Oops resistance. So you can use the phone however you want as well as where ever you want.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Some Extra Greatness Comes with these Extra Features</strong></h3>\r\n\r\n<p>The Long-listing features are not finished yet. Here is the name of some must mentionable features&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Solution for Everything&nbsp;</strong></p>\r\n\r\n<p>The hardware and software of the iPhone 12 mini work together seamlessly to bring everything with one tap. If you want to pair new AirPods with your iPhone 12 mini, pair it with a simple one‑tap setup. On the other hand, sharing photos, videos, or contacts with nearby friends become so easy. Just AirDrop lists their names onscreen, so you can choose with a tap.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Great Durability</strong></p>\r\n\r\n<p>iPhone 12 mini is designed for long-lasting. Superstrong material build quality and IP68 resistance make iPhone incredibly durable.&nbsp; Automatic iOS updates deliver new features and security enhancements that keep your iPhone up to date. That helps your iPhone to run beautifully for a long time</p>', 0, NULL, '2023-06-07 08:06:29', '2023-06-07 08:06:29', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '135317', NULL, NULL, NULL, NULL, NULL, 6, '0.00', '0.00', '0.00'),
(17, 'admin', 1, 'Oppo F21 Pro - Official', 'oppo-f21-pro-official-ytq0Gl', 'physical', '[{\"id\":\"4\",\"position\":1}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64803bf350c0c.png\",\"2023-06-07-64803bf3510cd.png\"]', '2023-06-07-64803bf3513c0.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 28200, 25500, '0', 'percent', '0', 'flat', 199, 1, '<h1><strong>Oppo F21 Pro Official</strong></h1>\r\n\r\n<p>When it&#39;s time to talk about Oppo F21 Pro, then the first thing coming out is it&rsquo;s ultimate self portrait taking capability. It&nbsp; comes with an astounding camera that takes the standard of selfie to a new level. Alongside camera features it also holds a system performance optimizer with a long battery backup.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>All these things can be possible on a very friendly budget. So many dynamic camera modes surely gives you an opportunity&nbsp; to capture every precious moment.&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The sleek outlook&nbsp; combines with alluring colors and makes the phone&nbsp; the prime of mid level.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>4 key factors that makes the difference</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Flagship Sony IMX709 Selfie Sensor</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>AI Portrait Enhancement</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Fiberglass Leather</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Ultra Slim Retro Design</strong></p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<h2><strong>Specifications of Oppo F21Pro</strong></h2>\r\n\r\n<h3><strong>Selfie Master Camera</strong></h3>\r\n\r\n<p>The phone breaks the silence with its ultimate selfie camera. With flagship Sony IMX709 selfie sensor and several selfie modes take out of the world quality selfies in every light whether it is low or highlight.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The 64MP Triple camera gives you a great photography experience with its multiple camera features. You can capture your perfect moment with a 48MP wide main camera with great details&nbsp; and 2MP each depth and macro camera. Which helps to get precise and natural depth photos and also explore the miniature world.The dynamic night plus makes your night more dazzling by taking extraordinary night photos.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Night Plus Mode Flash Snapshot Segment 1st Microlens Camera features make the photography totally impressive and blow your mind.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>32 MP HDR selfie camera with Sony IMX709 selfie sensor, AI Portrait Enhancement, Bokeh Flare Portrait features are changing the definition of selfie capable of taking share worthy crisp self portraits and makes your moment beautiful then ever.</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Main Camera</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>64 MP(wide)</p>\r\n	</li>\r\n	<li>\r\n	<p>2 MP (macro)</p>\r\n	</li>\r\n	<li>\r\n	<p>2 MP(depth)</p>\r\n	</li>\r\n	<li>\r\n	<p>Night Plus Mode&nbsp;</p>\r\n	</li>\r\n	<li>\r\n	<p>Flash Snapshot</p>\r\n	</li>\r\n	<li>\r\n	<p>Segment 1st Microlens Camera</p>\r\n	</li>\r\n	<li>\r\n	<p>1080p Video at 30fps</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Selfie Camera</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>32MP Selfie Camera</p>\r\n	</li>\r\n	<li>\r\n	<p>Sony IMX709 selfie sensor</p>\r\n	</li>\r\n	<li>\r\n	<p>AI Portrait Enhancement</p>\r\n	</li>\r\n	<li>\r\n	<p>Bokeh Flare Portrait</p>\r\n	</li>\r\n	<li>\r\n	<p>1080p Videography at 30fps</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Mind Blowing Performance</strong>&nbsp;</h3>\r\n\r\n<p>The phone holds an Octa core Qualcomm SM6225 Snapdragon 680 4G (6 nm) processor and PowerVR GM9446.These powerful elements boost the phones performance better than ever. You will feel the smooth performance when using the phone. The phone also serves it best while gaming and increases the gaming performance.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Qualcomm SM6225 Snapdragon 680 4G (6 nm)</p>\r\n	</li>\r\n	<li>\r\n	<p>Octa-core&nbsp;</p>\r\n	</li>\r\n	<li>\r\n	<p>2.4GHz Kryo 265 Gold</p>\r\n	</li>\r\n	<li>\r\n	<p>Adreno 610</p>\r\n	</li>\r\n	<li>\r\n	<p>Android 12</p>\r\n	</li>\r\n	<li>\r\n	<p>ColorOS 12.1</p>\r\n	</li>\r\n	<li>\r\n	<p>8GB RAM</p>\r\n	</li>\r\n	<li>\r\n	<p>256 GB Storage</p>\r\n	</li>\r\n	<li>\r\n	<p>MicroSDXC support</p>\r\n	</li>\r\n	<li>\r\n	<p>UFS 2.2 Storage System</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Luxurious Retro Design</strong>&nbsp;</h3>\r\n\r\n<p>The ultra thin design with exclusive dazzling finish with fiberglass leather attached retro look makes it more fascinating to the users. It is also fingerprint proof and wear resistant and the back is so shiny. The giant AMOLED display with punch hole pattern and under display optical fingerprint makes it smoother than ever.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The AI quad Cameras set in a fantastic fitted with a vector module.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The elegance of the phone&nbsp; is filled with its color. The discerning finish with 2 marvelous colors takes the elegance level to a new level. Cosmic Black&nbsp; and Sunset orange&nbsp; are available colors of Oppo F21 Pro .</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Luxurious Retro Design</p>\r\n	</li>\r\n	<li>\r\n	<p>Lavish Back with Fiberglass Leather</p>\r\n	</li>\r\n	<li>\r\n	<p>Well patterned body design</p>\r\n	</li>\r\n	<li>\r\n	<p>Vector Patterned Camera Module</p>\r\n	</li>\r\n	<li>\r\n	<p>Ultra Slim (7.5mm)</p>\r\n	</li>\r\n	<li>\r\n	<p>Ultra Thin (175gm)</p>\r\n	</li>\r\n	<li>\r\n	<p>AMOLED Display with punch hole Pattern</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Mega Battery</strong></h3>\r\n\r\n<p>This Oppo phone contains a massive battery. 4500mAh in exact measurement. So you have not to worry about battery backup. Just go on with this long lasting battery.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Because it also has a 33W fast charging that boosts your battery within minutes.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Li-Po 4500 mAh</p>\r\n	</li>\r\n	<li>\r\n	<p>Non-removable</p>\r\n	</li>\r\n	<li>\r\n	<p>33W Fast Charging&nbsp;</p>\r\n	</li>\r\n	<li>\r\n	<p>Reverse Charging</p>\r\n	</li>\r\n</ul>', 0, NULL, '2023-06-07 08:12:35', '2023-06-17 00:22:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '157252', NULL, NULL, NULL, NULL, NULL, 5, '0.00', '0.00', '0.00'),
(18, 'admin', 1, 'Oppo Reno8 T 5G', 'oppo-reno8-t-5g-QhiCfq', 'physical', '[{\"id\":\"4\",\"position\":1}]', 4, 'kg', 1, 1, NULL, NULL, '[\"2023-06-07-64803ca66b8af.png\"]', '2023-06-07-64803ca66bef6.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 22000, 18500, '0', 'percent', '0', 'flat', 330, 1, NULL, 0, NULL, '2023-06-07 08:15:34', '2023-06-11 03:10:45', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '187325', NULL, NULL, NULL, NULL, NULL, 4, '0.00', '0.00', '0.00'),
(20, 'seller', 2, 'For testing purpose', 'for-testing-purpose-HiAvWl', 'physical', '[{\"id\":\"2\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-06-11-6485763466692.png\"]', '2023-06-11-648576346dd8e.png', NULL, NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#9966CC\",\"#FAEBD7\"]', 0, '[\"2\"]', '[{\"name\":\"choice_2\",\"title\":\"Size\",\"options\":[\"L\",\"      M\",\"      XL\"]}]', '[{\"type\":\"AliceBlue-L\",\"price\":20,\"sku\":\"Ftp-AliceBlue-L\",\"qty\":0},{\"type\":\"AliceBlue-M\",\"price\":20,\"sku\":\"Ftp-AliceBlue-M\",\"qty\":0},{\"type\":\"AliceBlue-XL\",\"price\":20,\"sku\":\"Ftp-AliceBlue-XL\",\"qty\":1},{\"type\":\"Amethyst-L\",\"price\":20,\"sku\":\"Ftp-Amethyst-L\",\"qty\":1},{\"type\":\"Amethyst-M\",\"price\":20,\"sku\":\"Ftp-Amethyst-M\",\"qty\":1},{\"type\":\"Amethyst-XL\",\"price\":20,\"sku\":\"Ftp-Amethyst-XL\",\"qty\":1},{\"type\":\"AntiqueWhite-L\",\"price\":20,\"sku\":\"Ftp-AntiqueWhite-L\",\"qty\":1},{\"type\":\"AntiqueWhite-M\",\"price\":20,\"sku\":\"Ftp-AntiqueWhite-M\",\"qty\":1},{\"type\":\"AntiqueWhite-XL\",\"price\":20,\"sku\":\"Ftp-AntiqueWhite-XL\",\"qty\":1}]', 0, 20, 15, '0', 'percent', '0', 'flat', 7, 1, '<p>For testing purpose</p>', 0, NULL, '2023-06-11 01:22:28', '2023-06-17 04:14:54', 1, 1, 'For testing purpose', 'For testing purpose', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '111497', '<p>For testing purpose</p>', 'For testing purpose', 'seller', '1m', 'For testing purpose', 4, '15.00', '25.00', '35.00'),
(21, 'admin', 1, 'For testing purpose product2', 'for-testing-purpose-product2-RgmHDG', 'physical', '[{\"id\":\"4\",\"position\":1}]', 1, 'kg', 1, 1, NULL, NULL, '[\"2023-06-11-64858a1ca6da7.png\"]', '2023-06-11-64858a1de0842.png', '0', NULL, 'youtube', NULL, '[\"#F0F8FF\",\"#FAEBD7\"]', 0, '[\"2\",\"1\"]', '[{\"name\":\"choice_2\",\"title\":\"Green\",\"options\":[\"\"]},{\"name\":\"choice_1\",\"title\":\"Red\",\"options\":[\"\"]}]', '[{\"type\":\"AliceBlue--\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"AntiqueWhite--\",\"price\":0,\"sku\":null,\"qty\":0}]', 0, 25, 20, '0', 'percent', '0', 'flat', 0, 1, '<p>For testing purpose product2</p>', 0, NULL, '2023-06-11 02:47:25', '2023-06-11 04:31:22', 1, 1, 'For testing purpose product2', 'For testing purpose product2', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '163428', '<p>For testing purpose product 2</p>', 'For testing purpose product 2', 'brand', '4y', 'For testing purpose product2', 4, '20.00', '30.00', '40.00');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_images`
--

CREATE TABLE `product_variation_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variation_images`
--

INSERT INTO `product_variation_images` (`id`, `product_id`, `variation`, `image`, `created_at`, `updated_at`) VALUES
(13, 20, '#F0F8FF', '2023-06-12-6486c035b194a.png', '2023-06-12 00:50:29', '2023-06-12 00:50:29'),
(14, 20, '#9966CC', '2023-06-12-6486c064168ad.png', '2023-06-12 00:50:29', '2023-06-12 00:51:16'),
(15, 20, '#FAEBD7', '2023-06-12-6486c035b943a.png', '2023-06-12 00:50:29', '2023-06-12 00:50:29'),
(16, 15, '#F0F8FF', '2023-06-17-648d8349ed825.png', '2023-06-17 03:56:26', '2023-06-17 03:56:26'),
(17, 15, '#FAEBD7', '2023-06-17-648d834a10bf7.png', '2023-06-17 03:56:26', '2023-06-17 03:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_weights`
--

CREATE TABLE `product_weights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_weights`
--

INSERT INTO `product_weights` (`id`, `title`, `amount`, `created_at`, `updated_at`) VALUES
(4, '0.5-1kg', '10.00', '2023-06-10 22:58:12', '2023-06-11 03:00:00'),
(5, '1.1-2.0kg', '20.00', '2023-06-11 02:59:38', '2023-06-11 02:59:38'),
(6, 'Greater than 2.0kg', '30.00', '2023-06-11 03:00:33', '2023-06-11 03:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL,
  `reply_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `delivery_man_id`, `order_id`, `comment`, `attachment`, `rating`, `status`, `is_saved`, `parent_id`, `reply_type`, `seller_id`, `created_at`, `updated_at`) VALUES
(8, 15, 3, NULL, NULL, 'Good product', '[]', 4, 1, 0, NULL, NULL, NULL, '2023-06-17 05:30:46', '2023-06-17 05:30:46'),
(9, 15, 1, NULL, NULL, 'Good', '[]', 4, 1, 0, NULL, NULL, NULL, '2023-06-17 05:30:46', '2023-06-17 05:30:46'),
(10, 15, 3, NULL, NULL, 'Thank you so much.\r\nPlease stay with us.', NULL, 0, 1, 0, 8, 'reply', 2, '2023-06-17 06:50:57', '2023-06-17 06:50:57'),
(13, 15, 1, NULL, NULL, 'Thank you', NULL, 0, 1, 0, 9, 'reply', 2, '2023-06-17 07:49:50', '2023-06-17 07:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
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
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'Rasel', 'Ahmed', '0170000000', '2023-06-05-647e41c29b3ba.png', 'sayemtutul1@gmail.com', '$2y$10$Hp.Nk2s592g9oDj3zZnW8uLHjuWZFpjAUwoDVxA4RqVcroaBIxh.2', 'approved', NULL, '2023-06-05 20:12:50', '2023-06-05 20:12:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 'Md Anwar', 'Hossain', '01794030592', '2023-06-07-648050a3bce73.png', 'anwar@gmail.com', '$2y$10$2h7qnVnW/yZdbZOe13Lm9OSB5w1Cw00JcIqyih159oZcCBlvgbL6m', 'approved', NULL, '2023-06-07 09:40:51', '2023-06-07 09:41:47', 'DBBL Bank', 'Mohammadpur', '15454654654612', 'Md Anwar Hossain', NULL, NULL, NULL, NULL, 0);

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

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2023-06-05 20:12:50', '2023-06-05 20:12:50', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 228280, '2023-06-07 09:40:51', '2023-06-17 05:40:00', 0.00, 100.00, 0.00, 0.00, 0.00);

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
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '3', 'ABC', 'home', 'Y=15 momhadpur', 'Dhaka, Bangladesh', '1207', '01700000000', '2023-06-17 00:22:36', '2023-06-17 00:22:36', NULL, 'Bangladesh', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'Deluxe Online', 'mohammadpur', '0170000000', '2023-06-05-647e41c2af6ab.png', '2023-06-05 20:12:50', '2023-06-05 20:12:50', '2023-06-05-647e41c2afa13.png'),
(2, 2, 'Our Shop BD', 'Y=15 momhadpur', '01794030592', '2023-06-07-648050a3d2d97.png', '2023-06-07 09:40:51', '2023-06-07 09:40:51', '2023-06-07-648050a3d3773.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
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
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(1, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(3, NULL, 'Md Anwar', 'Hossain', '01794030592', '2023-06-07-6480179862fd9.png', 'anwar@gmail.com', NULL, '$2y$10$IP22RUwkSCAVe3Cjp0g.UuQcFJt4lDcgwh2E.Qb7fdjYg2no2p7oy', NULL, '2023-06-07 05:36:43', '2023-06-07 05:37:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `seller_id`, `delivery_man_id`, `admin_id`, `amount`, `transaction_note`, `approved`, `created_at`, `updated_at`) VALUES
(3, 2, NULL, 1, '114140', NULL, 1, '2023-06-17 10:57:43', '2023-06-17 05:00:56'),
(4, 2, NULL, NULL, '114140', NULL, 1, '2023-06-17 05:05:46', '2023-06-17 05:06:55'),
(5, 2, NULL, NULL, '100', NULL, 0, '2023-06-17 05:40:00', '2023-06-17 05:40:00');

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
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variation_images`
--
ALTER TABLE `product_variation_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variation_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_weights`
--
ALTER TABLE `product_weights`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100008;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variation_images`
--
ALTER TABLE `product_variation_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_weights`
--
ALTER TABLE `product_weights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_variation_images`
--
ALTER TABLE `product_variation_images`
  ADD CONSTRAINT `product_variation_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
