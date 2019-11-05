-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2019 at 12:26 PM
-- Server version: 10.3.18-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ehsansey_ehcan_ir`
--

-- --------------------------------------------------------

--
-- Table structure for table `snippet_table`
--

CREATE TABLE `snippet_table` (
  `id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `title` text NOT NULL,
  `data` text NOT NULL,
  `tags` text NOT NULL COMMENT ',,,',
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snippet_table`
--

INSERT INTO `snippet_table` (`id`, `lang`, `title`, `data`, `tags`, `description`) VALUES
(10, 'css', 'Box shadow', '    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);', 'css', ''),
(11, 'javascript', 'jQuery Selector', '$(\"input[id*=\'DiscountType\']\") //Contains\r\n$(\"input[id^=\'DiscountType\']\") //Starts With\r\n$(\"input[id$=\'DiscountType\']\") //Ends With\r\n$(\"input[id!=\'DiscountType\']\") //id is not a given string\r\n$(\"input[id~=\'DiscountType\']\") //id contains a given word, delimited by spaces\r\n$(\"input[id|=\'DiscountType\']\") //id is equal to a given string or starting with that string followed by a hyphen', 'jquery', ''),
(5, 'css', 'CSS Debuger', '/*! debug.css | MIT License | zaydek.github.com/debug.css */\r\n*:not(path):not(g) {\r\n	color:                    hsla(210, 100%, 100%, 0.9) !important;\r\n	background:               hsla(210, 100%,  50%, 0.5) !important;\r\n	outline:    solid 0.25rem hsla(210, 100%, 100%, 0.5) !important;\r\n\r\n	box-shadow: none !important;\r\n}', 'css', ''),
(4, 'php', 'Validate reCaptcha', '	$post_data = http_build_query(\r\n		array(\r\n			\'secret\' => \'6Lfa72gUAAAAAGSaiv7sNmCQ_53jhXtWpsXR8eJO\',\r\n			\'response\' => $_POST[\'g-recaptcha-response\'],\r\n			\'remoteip\' => $_SERVER[\'REMOTE_ADDR\']\r\n		)\r\n	);\r\n	$opts = array(\'http\' =>\r\n		array(\r\n			\'method\'  => \'POST\',\r\n			\'header\'  => \'Content-type: application/x-www-form-urlencoded\',\r\n			\'content\' => $post_data\r\n		)\r\n	);\r\n	$context  = stream_context_create($opts);\r\n	$response = file_get_contents(\'https://www.google.com/recaptcha/api/siteverify\', false, $context);\r\n	$result = json_decode($response);\r\n	if ($result->success) {echo \'good\';}\r\n	if (!$result->success) {\r\n		throw new Exception(\'Gah! CAPTCHA verification failed. Please email me directly at: jstark at jonathanstark dot com\', 1);\r\n	}', 'php,,,reCaptcha', ''),
(8, 'apache', '.htaccess setting', 'AddOutputFilterByType DEFLATE text/plain\r\nAddOutputFilterByType DEFLATE text/html\r\nAddOutputFilterByType DEFLATE text/css\r\nAddOutputFilterByType DEFLATE application/javascript\r\nAddOutputFilterByType DEFLATE application/x-javascript\r\n\r\nRewriteEngine On\r\n\r\nRewriteCond %{HTTPS} off [OR]\r\nRewriteCond %{HTTP_HOST} ^www\\.ehcan\\.ir [NC]\r\nRewriteRule ^(.*)$ https://ehcan.ir/$1 [L,R=301]\r\n\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteCond $1 !\\.(html)\r\nRewriteRule ^(.*)$ index.php?/$1 [L,QSA]', 'htaccess,,,GZIP,,,HTML Compression,,,Force non-www Redirect', ''),
(16, 'php', 'Digit Grouping', 'number_format($members[\'cashAll\'],0,NULL,\'٫\')', 'digit', ''),
(17, 'php', 'Base64 Image Save', 'if (preg_match(\'/^data:image\\/(\\w+);base64,/\', $data, $type)) {\r\n        $data = substr($data, strpos($data, \',\') + 1);\r\n        $type = strtolower($type[1]); // jpg, png, gif\r\n\r\n        if (!in_array($type, [ \'jpg\', \'jpeg\', \'gif\', \'png\' ])) {\r\n            $json[\'response\'] = \'invalid image type\';   $valid = false;\r\n        }\r\n\r\n        $data = base64_decode($data);\r\n\r\n        if ($data === false) {\r\n            $json[\'response\'] = \'base64_decode failed\'; $valid = false;\r\n        }\r\n    }\r\n    else {\r\n        $json[\'response\'] = \'did not match data URI with image data\';   $valid = false;\r\n    }\r\n\r\n    if($valid){\r\n        file_put_contents( \"assets/uploads/{$name}.{$type}\", $data);\r\n        $json[\'response\'] = \'success\';\r\n    }', 'php,,,image,,,base64', 'Save image to file from API'),
(18, 'php', 'timestamp -> persian', '$date = explode(\' \',$row[\'timestamp\'])[0];\r\n$time = explode(\' \',$row[\'timestamp\'])[1];\r\n$d = explode( \'-\',$date );\r\n$row[\'date\'] = gregorian_to_jalali($d[0],$d[1],$d[2],\'٫\') . \'&nbsp;&nbsp;&nbsp;\'. $time;', 'jdf', ''),
(19, 'javascript', 'on ajax success', '$( document ).ajaxSuccess(function( event, xhr, settings ) {\r\nif ( settings.url == \"/siteAPI/pageTransactions/-1\" ) {\r\n    var temp = JSON.parse(xhr.responseText);\r\n    $(\'h4.text-black.inline\').html(\'تمامی پرداخت‌ها <span class=\"badge badge-primary pfont\">\'+temp.recordsTotal+\' سوال</span>\');\r\n    // console.log(temp.recordsTotal);\r\n}\r\n});', 'js,,,ajax', ''),
(21, 'git', 'Save git credential', 'git config credential.helper store', 'git', ''),
(29, 'bash', 'git webhook puller', '<?php\r\n\r\n$json[\'main\'][\'out\']     = exec( \'git pull 2>&1\', $json[\'main\'][\'output\'], $json[\'main\'][\'return\']);\r\n\r\necho json_encode( $json, JSON_PRETTY_PRINT );\r\n\r\n', 'bash', '');

-- --------------------------------------------------------

--
-- Table structure for table `snippet_themes`
--

CREATE TABLE `snippet_themes` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snippet_themes`
--

INSERT INTO `snippet_themes` (`id`, `name`, `url`) VALUES
(1, 'a11y-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/a11y-dark.min.css'),
(2, 'a11y-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/a11y-light.min.css'),
(3, 'agate.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/agate.min.css'),
(4, 'an-old-hope.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/an-old-hope.min.css'),
(5, 'androidstudio.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/androidstudio.min.css'),
(6, 'arduino-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/arduino-light.min.css'),
(7, 'arta.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/arta.min.css'),
(8, 'ascetic.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/ascetic.min.css'),
(9, 'atelier-cave-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-cave-dark.min.css'),
(10, 'atelier-cave-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-cave-light.min.css'),
(11, 'atelier-dune-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-dune-dark.min.css'),
(12, 'atelier-dune-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-dune-light.min.css'),
(13, 'atelier-estuary-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-estuary-dark.min.css'),
(14, 'atelier-estuary-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-estuary-light.min.css'),
(15, 'atelier-forest-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-forest-dark.min.css'),
(16, 'atelier-forest-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-forest-light.min.css'),
(17, 'atelier-heath-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-heath-dark.min.css'),
(18, 'atelier-heath-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-heath-light.min.css'),
(19, 'atelier-lakeside-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-lakeside-dark.min.css'),
(20, 'atelier-lakeside-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-lakeside-light.min.css'),
(21, 'atelier-plateau-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-plateau-dark.min.css'),
(22, 'atelier-plateau-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-plateau-light.min.css'),
(23, 'atelier-savanna-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-savanna-dark.min.css'),
(24, 'atelier-savanna-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-savanna-light.min.css'),
(25, 'atelier-seaside-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-seaside-dark.min.css'),
(26, 'atelier-seaside-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-seaside-light.min.css'),
(27, 'atelier-sulphurpool-dark.min.c', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-sulphurpool-dark.min.css'),
(28, 'atelier-sulphurpool-light.min.', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atelier-sulphurpool-light.min.css'),
(29, 'atom-one-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atom-one-dark.min.css'),
(30, 'atom-one-dark-reasonable.min.c', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atom-one-dark-reasonable.min.css'),
(31, 'atom-one-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/atom-one-light.min.css'),
(32, 'brown-paper.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/brown-paper.min.css'),
(33, 'brown-papersq.png', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/brown-papersq.png'),
(34, 'codepen-embed.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/codepen-embed.min.css'),
(35, 'color-brewer.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/color-brewer.min.css'),
(36, 'darcula.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/darcula.min.css'),
(37, 'dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/dark.min.css'),
(38, 'darkula.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/darkula.min.css'),
(39, 'default.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/default.min.css'),
(40, 'docco.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/docco.min.css'),
(41, 'dracula.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/dracula.min.css'),
(42, 'far.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/far.min.css'),
(43, 'foundation.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/foundation.min.css'),
(44, 'github.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/github.min.css'),
(45, 'github-gist.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/github-gist.min.css'),
(46, 'gml.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/gml.min.css'),
(47, 'googlecode.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/googlecode.min.css'),
(48, 'grayscale.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/grayscale.min.css'),
(49, 'gruvbox-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/gruvbox-dark.min.css'),
(50, 'gruvbox-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/gruvbox-light.min.css'),
(51, 'hopscotch.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/hopscotch.min.css'),
(52, 'hybrid.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/hybrid.min.css'),
(53, 'idea.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/idea.min.css'),
(54, 'ir-black.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/ir-black.min.css'),
(55, 'isbl-editor-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/isbl-editor-dark.min.css'),
(56, 'isbl-editor-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/isbl-editor-light.min.css'),
(57, 'kimbie.dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/kimbie.dark.min.css'),
(58, 'kimbie.light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/kimbie.light.min.css'),
(59, 'lightfair.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/lightfair.min.css'),
(60, 'magula.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/magula.min.css'),
(61, 'mono-blue.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/mono-blue.min.css'),
(62, 'monokai.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/monokai.min.css'),
(63, 'monokai-sublime.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/monokai-sublime.min.css'),
(64, 'nord.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/nord.min.css'),
(65, 'obsidian.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/obsidian.min.css'),
(66, 'ocean.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/ocean.min.css'),
(67, 'paraiso-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/paraiso-dark.min.css'),
(68, 'paraiso-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/paraiso-light.min.css'),
(69, 'pojoaque.jpg', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/pojoaque.jpg'),
(70, 'pojoaque.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/pojoaque.min.css'),
(71, 'purebasic.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/purebasic.min.css'),
(72, 'qtcreator_dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/qtcreator_dark.min.css'),
(73, 'qtcreator_light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/qtcreator_light.min.css'),
(74, 'railscasts.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/railscasts.min.css'),
(75, 'rainbow.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/rainbow.min.css'),
(76, 'routeros.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/routeros.min.css'),
(77, 'school-book.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/school-book.min.css'),
(78, 'school-book.png', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/school-book.png'),
(79, 'shades-of-purple.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/shades-of-purple.min.css'),
(80, 'solarized-dark.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/solarized-dark.min.css'),
(81, 'solarized-light.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/solarized-light.min.css'),
(82, 'sunburst.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/sunburst.min.css'),
(83, 'tomorrow.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/tomorrow.min.css'),
(84, 'tomorrow-night.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/tomorrow-night.min.css'),
(85, 'tomorrow-night-blue.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/tomorrow-night-blue.min.css'),
(86, 'tomorrow-night-bright.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/tomorrow-night-bright.min.css'),
(87, 'tomorrow-night-eighties.min.cs', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/tomorrow-night-eighties.min.css'),
(88, 'vs.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/vs.min.css'),
(89, 'vs2015.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/vs2015.min.css'),
(90, 'xcode.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/xcode.min.css'),
(91, 'xt256.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/xt256.min.css'),
(92, 'zenburn.min.css', '//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.13.1/build/styles/zenburn.min.css');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `snippet_table`
--
ALTER TABLE `snippet_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `snippet_themes`
--
ALTER TABLE `snippet_themes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `snippet_table`
--
ALTER TABLE `snippet_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `snippet_themes`
--
ALTER TABLE `snippet_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
