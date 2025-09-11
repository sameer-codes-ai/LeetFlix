-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: leetflix
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` varchar(36) NOT NULL,
  `post_id` varchar(36) NOT NULL,
  `content` text NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('494fd0da-97e0-4ccd-b686-ef03340c0f69','5458bd30-e155-421f-ab19-12a52a951020','hello','user_7vtv5tz0d','2025-09-12 01:30:53'),('ee1cd11a-a1a3-4a9d-912b-2f0296b02406','5458bd30-e155-421f-ab19-12a52a951020','hi','user_fot5dkvf4','2025-09-12 01:45:37');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `sno` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'aaryang0108@gmail.com','','2025-09-10 17:07:30'),(2,'aaryang0108@gmail.com','','2025-09-10 19:26:26'),(3,'aaryang0108@gmail.com','','2025-09-10 19:26:58'),(4,'aa@gmail.com','','2025-09-10 19:27:49'),(5,'aaryang0108@gmail.com','','2025-09-10 19:46:28'),(6,'aaryang0108@gmail.com','','2025-09-10 20:45:00'),(7,'aaryang0108@gmail.com','','2025-09-10 20:50:58'),(8,'12@gmail.com','','2025-09-10 20:51:31'),(9,'aaryang0108@gmail.com','','2025-09-10 21:19:57'),(10,'aaryang0108@gmail.com','','2025-09-11 16:28:39'),(11,'aaryang0108@gmail.com','','2025-09-11 16:29:02'),(12,'aaryang0108@gmail.com','','2025-09-11 16:43:09'),(13,'aaryang0108@gmail.com','','2025-09-11 17:01:41'),(14,'aaryang0108@gmail.com','','2025-09-11 17:01:47'),(15,'aaryang0108@gmail.com','','2025-09-11 17:02:08'),(16,'o@gmail.com','','2025-09-11 17:11:20'),(17,'aaryang0108@gmail.com','','2025-09-11 17:24:46'),(18,'aaryang0108@gmail.com','','2025-09-11 17:46:15');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (401,0,'Hey, how you doin\'?',0),(402,0,'This guy says hello, I wanna kill myself.',1),(403,0,'You just pulled a \"Monica\".',0),(404,0,'There is no \"we\" in \"friends\".',0),(405,401,'A lemur',0),(406,401,'A dog',0),(407,401,'A capuchin monkey',1),(408,401,'A turtle',0),(409,405,'Karen',0),(410,405,'Mrs. Bing',0),(411,405,'Ursula',0),(412,405,'Estelle Leonard',1),(413,409,'Jill Goodacre',1),(414,409,'George Clooney',0),(415,409,'Bruce Willis',0),(416,409,'Brad Pitt',0),(417,413,'Gary',0),(418,413,'David',0),(419,413,'Roger',0),(420,413,'Parker',1),(421,417,'A new entertainment unit',1),(422,417,'A new couch',0),(423,417,'A giant TV',0),(424,417,'A foosball table',0),(425,421,'Tanya',0),(426,421,'Janice',1),(427,421,'Aurora',0),(428,421,'Estelle',0),(429,425,'An accountant',0),(430,425,'A chef',1),(431,425,'A teacher',0),(432,425,'A waitress',0),(433,429,'Moe',0),(434,429,'Marcel',1),(435,429,'Bobo',0),(436,429,'George',0),(437,433,'Susan',0),(438,433,'Carol',1),(439,433,'Julie',0),(440,433,'Mona',0),(441,437,'Her new boyfriend',0),(442,437,'Her partner, Susan',1),(443,437,'Ross\'s mom',0),(444,437,'A man she just met',0),(445,441,'The pies',0),(446,441,'The potatoes',1),(447,441,'The cranberries',0),(448,441,'The turkey',0),(449,445,'Estelle',1),(450,445,'Carol',0),(451,445,'Andrea',0),(452,445,'Julie',0),(453,449,'The Daily Grind',0),(454,449,'Central Perk',1),(455,449,'The Coffee Bean',0),(456,449,'Starbucks',0),(457,453,'Monica',1),(458,453,'Joey',0),(459,453,'Chandler',0),(460,453,'Phoebe',0),(461,457,'She goes on a trip',0),(462,457,'She starts dating a new guy',1),(463,457,'She goes to a therapist',0),(464,457,'She buys new clothes',0),(465,461,'Parker',1),(466,461,'Gary',0),(467,461,'David',0),(468,461,'Roger',0),(469,37,'Hey, how you doin\'?',0),(470,37,'This guy says hello, I wanna kill myself.',1),(471,37,'You just pulled a \"Monica\".',0),(472,37,'There is no \"we\" in \"friends\".',0),(473,38,'A lemur',0),(474,38,'A dog',0),(475,38,'A capuchin monkey',1),(476,38,'A turtle',0),(477,39,'Karen',0),(478,39,'Mrs. Bing',0),(479,39,'Ursula',0),(480,39,'Estelle Leonard',1),(481,40,'Jill Goodacre',1),(482,40,'George Clooney',0),(483,40,'Bruce Willis',0),(484,40,'Brad Pitt',0),(485,41,'Gary',0),(486,41,'David',0),(487,41,'Roger',0),(488,41,'Parker',1),(489,42,'A new entertainment unit',1),(490,42,'A new couch',0),(491,42,'A giant TV',0),(492,42,'A foosball table',0),(493,43,'Tanya',0),(494,43,'Janice',1),(495,43,'Aurora',0),(496,43,'Estelle',0),(497,44,'An accountant',0),(498,44,'A chef',1),(499,44,'A teacher',0),(500,44,'A waitress',0),(501,45,'Moe',0),(502,45,'Marcel',1),(503,45,'Bobo',0),(504,45,'George',0),(505,46,'Susan',0),(506,46,'Carol',1),(507,46,'Julie',0),(508,46,'Mona',0),(509,0,'Sparky',0),(510,0,'Stella',1),(511,0,'Princess',0),(512,0,'Oreo',0),(513,509,'Kissing',1),(514,509,'Singing',0),(515,509,'Dancing',0),(516,509,'Holding hands',0),(517,513,'Grease',0),(518,513,'A Chorus Line',1),(519,513,'Les Misérables',0),(520,513,'Cats',0),(521,517,'She has a new best friend',0),(522,517,'She is secretly dating someone',0),(523,517,'She is skipping school',0),(524,517,'She is using drugs',1),(525,521,'The Dunphy Haunted House',0),(526,521,'A Haunted Mansion',0),(527,521,'The Dunphy House of Horrors',1),(528,521,'A Haunted Castle',0),(529,525,'A diorama of a jungle',1),(530,525,'A volcano',0),(531,525,'A model of a plane',0),(532,525,'A book about war',0),(533,529,'A squirrel',0),(534,529,'A bird',0),(535,529,'A raccoon',0),(536,529,'A duck',1),(537,533,'Keep it',0),(538,533,'Give it away',1),(539,533,'Sell it',0),(540,533,'Donate it',0),(541,537,'Brenda',0),(542,537,'Susan',0),(543,537,'Kari',1),(544,537,'Kelly',0),(545,541,'Ms. Clark',1),(546,541,'Ms. Walker',0),(547,541,'Ms. Miller',0),(548,541,'Ms. Johnson',0),(549,545,'He asks a girl out in person.',0),(550,545,'He writes a love letter to a girl.',1),(551,545,'He asks Gloria to help him.',0),(552,545,'He asks Jay for advice.',0),(553,549,'Serena',1),(554,549,'Alex',0),(555,549,'Claire',0),(556,549,'Gloria',0),(557,553,'His old bowling ball',0),(558,553,'His old golf clubs',1),(559,553,'His old baseball bat',0),(560,553,'His old bowling shoes',0),(561,557,'That his father is mad at him.',0),(562,557,'That his father doesn\'t love him.',0),(563,557,'That his father is disappointed in him.',0),(564,557,'That his father doesn\'t approve of his lifestyle.',1),(565,561,'Get a client to sign a contract.',1),(566,561,'Sell a house.',0),(567,561,'Take a real estate test.',0),(568,561,'Get a new car.',0),(569,565,'Mice',0),(570,565,'Roaches',0),(571,565,'Termites',1),(572,565,'Ants',0),(573,569,'Claire',0),(574,569,'Alex',0),(575,569,'Gloria',0),(576,569,'Haley',1),(577,47,'Sparky',0),(578,47,'Stella',1),(579,47,'Princess',0),(580,47,'Oreo',0),(581,48,'Kissing',1),(582,48,'Singing',0),(583,48,'Dancing',0),(584,48,'Holding hands',0),(585,49,'Grease',0),(586,49,'A Chorus Line',1),(587,49,'Les Misérables',0),(588,49,'Cats',0),(589,50,'She has a new best friend',0),(590,50,'She is secretly dating someone',0),(591,50,'She is skipping school',0),(592,50,'She is using drugs',1),(593,51,'The Dunphy Haunted House',0),(594,51,'A Haunted Mansion',0),(595,51,'The Dunphy House of Horrors',1),(596,51,'A Haunted Castle',0),(597,52,'A diorama of a jungle',1),(598,52,'A volcano',0),(599,52,'A model of a plane',0),(600,52,'A book about war',0),(601,53,'A squirrel',0),(602,53,'A bird',0),(603,53,'A raccoon',0),(604,53,'A duck',1),(605,54,'Keep it',0),(606,54,'Give it away',1),(607,54,'Sell it',0),(608,54,'Donate it',0),(609,55,'Brenda',0),(610,55,'Susan',0),(611,55,'Kari',1),(612,55,'Kelly',0),(613,56,'Ms. Clark',1),(614,56,'Ms. Walker',0),(615,56,'Ms. Miller',0),(616,56,'Ms. Johnson',0),(617,58,'Sparky',0),(618,58,'Stella',1),(619,58,'Princess',0),(620,58,'Oreo',0),(621,59,'Kissing',1),(622,59,'Singing',0),(623,59,'Dancing',0),(624,59,'Holding hands',0),(625,60,'Grease',0),(626,60,'A Chorus Line',1),(627,60,'Les Misérables',0),(628,60,'Cats',0),(629,61,'She has a new best friend',0),(630,61,'She is secretly dating someone',0),(631,61,'She is skipping school',0),(632,61,'She is using drugs',1),(633,62,'The Dunphy Haunted House',0),(634,62,'A Haunted Mansion',0),(635,62,'The Dunphy House of Horrors',1),(636,62,'A Haunted Castle',0),(637,63,'A diorama of a jungle',1),(638,63,'A volcano',0),(639,63,'A model of a plane',0),(640,63,'A book about war',0),(641,64,'A squirrel',0),(642,64,'A bird',0),(643,64,'A raccoon',0),(644,64,'A duck',1),(645,65,'Keep it',0),(646,65,'Give it away',1),(647,65,'Sell it',0),(648,65,'Donate it',0),(649,66,'Brenda',0),(650,66,'Susan',0),(651,66,'Kari',1),(652,66,'Kelly',0),(653,67,'Ms. Clark',1),(654,67,'Ms. Walker',0),(655,67,'Ms. Miller',0),(656,67,'Ms. Johnson',0),(657,68,'He asks a girl out in person.',0),(658,68,'He writes a love letter to a girl.',1),(659,68,'He asks Gloria to help him.',0),(660,68,'He asks Jay for advice.',0),(661,69,'Serena',1),(662,69,'Alex',0),(663,69,'Claire',0),(664,69,'Gloria',0),(665,70,'His old bowling ball',0),(666,70,'His old golf clubs',1),(667,70,'His old baseball bat',0),(668,70,'His old bowling shoes',0),(669,71,'That his father is mad at him.',0),(670,71,'That his father doesn\'t love him.',0),(671,71,'That his father is disappointed in him.',0),(672,71,'That his father doesn\'t approve of his lifestyle.',1),(673,72,'Get a client to sign a contract.',1),(674,72,'Sell a house.',0),(675,72,'Take a real estate test.',0),(676,72,'Get a new car.',0),(677,73,'Mice',0),(678,73,'Roaches',0),(679,73,'Termites',1),(680,73,'Ants',0),(681,74,'Claire',0),(682,74,'Alex',0),(683,74,'Gloria',0),(684,74,'Haley',1),(685,75,'Alex gets a perfect score on her ACT.',1),(686,75,'Alex gets into a good college.',0),(687,75,'Alex gets a perfect score on a test.',0),(688,75,'Alex gets a perfect score on her SAT.',0),(689,76,'Donate it',0),(690,76,'Scrap it',0),(691,76,'Repair it',0),(692,76,'Sell it',1),(693,77,'Karen',0),(694,77,'Brenda',1),(695,77,'Stacy',0),(696,77,'Sarah',0),(697,0,'Glendale High',0),(698,0,'Rattlesnake High',0),(699,0,'Eastwood High School',1),(700,0,'Dunphy High',0),(701,697,'Brazil',0),(702,697,'Mexico',0),(703,697,'Venezuela',0),(704,697,'Colombia',1),(705,701,'Bozo',0),(706,701,'Fizbo',1),(707,701,'Pickles',0),(708,701,'Binky',0),(709,705,'A neighbor\'s window',0),(710,705,'A raccoon',0),(711,705,'Luke',1),(712,705,'A bird',0),(713,709,'Teach her to play the piano.',0),(714,709,'Start a baby modeling career for her.',0),(715,709,'Join a baby music class.',1),(716,709,'Sign her up for baby soccer.',0),(717,713,'Manny',0),(718,713,'Luke',1),(719,713,'Joe',0),(720,713,'Alex',0),(721,717,'Andy',0),(722,717,'Manny',0),(723,717,'Ethan',1),(724,717,'Dylan',0),(725,721,'Flying',0),(726,721,'Spiders',1),(727,721,'Clowns',0),(728,721,'Heights',0),(729,725,'A fairy',1),(730,725,'A witch',0),(731,725,'A cheerleader',0),(732,725,'A clown',0),(733,729,'He paints a huge portrait of himself as a clown.',0),(734,729,'He brings home an abandoned baby.',0),(735,729,'He creates a giant photo collage of their lives.',0),(736,729,'He rents a \"Starry Night\" themed party bus.',1),(737,733,'The narrator',0),(738,733,'The director',0),(739,733,'Cameraman',1),(740,733,'There is no documentary filmmaker.',0),(741,737,'Claire',0),(742,737,'Manny',0),(743,737,'Gloria',1),(744,737,'Haley',0),(745,741,'Mittens',0),(746,741,'Scrambles',1),(747,741,'Shadow',0),(748,741,'Whiskers',0),(749,745,'Ethan',0),(750,745,'Dylan',1),(751,745,'Andy',0),(752,745,'Phil',0),(753,749,'Stealing a bike',0),(754,749,'Jaywalking',0),(755,749,'Disorderly conduct',1),(756,749,'Speeding',0),(757,753,'Magic',0),(758,753,'Fencing',1),(759,753,'Tango',0),(760,753,'Bowling',0),(761,757,'A robot',0),(762,757,'A model of the Mona Lisa',0),(763,757,'A flying machine',1),(764,757,'A painting',0),(765,78,'Glendale High',0),(766,78,'Rattlesnake High',0),(767,78,'Eastwood High School',1),(768,78,'Dunphy High',0),(769,79,'Brazil',0),(770,79,'Mexico',0),(771,79,'Venezuela',0),(772,79,'Colombia',1),(773,80,'Bozo',0),(774,80,'Fizbo',1),(775,80,'Pickles',0),(776,80,'Binky',0),(777,81,'A neighbor\'s window',0),(778,81,'A raccoon',0),(779,81,'Luke',1),(780,81,'A bird',0),(781,82,'Teach her to play the piano.',0),(782,82,'Start a baby modeling career for her.',0),(783,82,'Join a baby music class.',1),(784,82,'Sign her up for baby soccer.',0),(785,83,'Manny',0),(786,83,'Luke',1),(787,83,'Joe',0),(788,83,'Alex',0),(789,84,'Andy',0),(790,84,'Manny',0),(791,84,'Ethan',1),(792,84,'Dylan',0),(793,85,'Flying',0),(794,85,'Spiders',1),(795,85,'Clowns',0),(796,85,'Heights',0),(797,86,'A fairy',1),(798,86,'A witch',0),(799,86,'A cheerleader',0),(800,86,'A clown',0),(801,87,'He paints a huge portrait of himself as a clown.',0),(802,87,'He brings home an abandoned baby.',0),(803,87,'He creates a giant photo collage of their lives.',0),(804,87,'He rents a \"Starry Night\" themed party bus.',1),(805,88,'The narrator',0),(806,88,'The director',0),(807,88,'Cameraman',1),(808,88,'There is no documentary filmmaker.',0),(809,89,'Claire',0),(810,89,'Manny',0),(811,89,'Gloria',1),(812,89,'Haley',0),(813,90,'Mittens',0),(814,90,'Scrambles',1),(815,90,'Shadow',0),(816,90,'Whiskers',0),(817,91,'Ethan',0),(818,91,'Dylan',1),(819,91,'Andy',0),(820,91,'Phil',0),(821,92,'Stealing a bike',0),(822,92,'Jaywalking',0),(823,92,'Disorderly conduct',1),(824,92,'Speeding',0),(825,93,'Magic',0),(826,93,'Fencing',1),(827,93,'Tango',0),(828,93,'Bowling',0),(829,94,'A robot',0),(830,94,'A model of the Mona Lisa',0),(831,94,'A flying machine',1),(832,94,'A painting',0),(833,95,'To retrieve a sweater.',1),(834,95,'To say goodbye.',0),(835,95,'To apologize.',0),(836,95,'To get some of her stuff back.',0),(837,96,'Koa Kea Resort',0),(838,96,'Koa Koa Resort',1),(839,96,'Koala Resort',0),(840,96,'Koa Resort',0),(841,97,'Painting',0),(842,97,'Dancing',0),(843,97,'Poetry',1),(844,97,'Singing',0),(845,98,'Glendale High',0),(846,98,'Rattlesnake High',0),(847,98,'Eastwood High School',1),(848,98,'Dunphy High',0),(849,99,'Brazil',0),(850,99,'Mexico',0),(851,99,'Venezuela',0),(852,99,'Colombia',1),(853,100,'Bozo',0),(854,100,'Fizbo',1),(855,100,'Pickles',0),(856,100,'Binky',0),(857,101,'A neighbor\'s window',0),(858,101,'A raccoon',0),(859,101,'Luke',1),(860,101,'A bird',0),(861,102,'Teach her to play the piano.',0),(862,102,'Start a baby modeling career for her.',0),(863,102,'Join a baby music class.',1),(864,102,'Sign her up for baby soccer.',0),(865,103,'Manny',0),(866,103,'Luke',1),(867,103,'Joe',0),(868,103,'Alex',0),(869,104,'Andy',0),(870,104,'Manny',0),(871,104,'Ethan',1),(872,104,'Dylan',0),(873,105,'Flying',0),(874,105,'Spiders',1),(875,105,'Clowns',0),(876,105,'Heights',0),(877,106,'A fairy',1),(878,106,'A witch',0),(879,106,'A cheerleader',0),(880,106,'A clown',0),(881,107,'He paints a huge portrait of himself as a clown.',0),(882,107,'He brings home an abandoned baby.',0),(883,107,'He creates a giant photo collage of their lives.',0),(884,107,'He rents a \"Starry Night\" themed party bus.',1),(885,108,'The narrator',0),(886,108,'The director',0),(887,108,'Cameraman',1),(888,108,'There is no documentary filmmaker.',0),(889,109,'Claire',0),(890,109,'Manny',0),(891,109,'Gloria',1),(892,109,'Haley',0),(893,110,'Mittens',0),(894,110,'Scrambles',1),(895,110,'Shadow',0),(896,110,'Whiskers',0),(897,111,'Ethan',0),(898,111,'Dylan',1),(899,111,'Andy',0),(900,111,'Phil',0),(901,112,'Stealing a bike',0),(902,112,'Jaywalking',0),(903,112,'Disorderly conduct',1),(904,112,'Speeding',0),(905,113,'Magic',0),(906,113,'Fencing',1),(907,113,'Tango',0),(908,113,'Bowling',0),(909,114,'A robot',0),(910,114,'A model of the Mona Lisa',0),(911,114,'A flying machine',1),(912,114,'A painting',0),(913,115,'To retrieve a sweater.',1),(914,115,'To say goodbye.',0),(915,115,'To apologize.',0),(916,115,'To get some of her stuff back.',0),(917,116,'Koa Kea Resort',0),(918,116,'Koa Koa Resort',1),(919,116,'Koala Resort',0),(920,116,'Koa Resort',0),(921,117,'Painting',0),(922,117,'Dancing',0),(923,117,'Poetry',1),(924,117,'Singing',0),(925,119,'A lemur',0),(926,119,'A dog',0),(927,119,'A capuchin monkey',1),(928,119,'A turtle',0),(929,120,'Karen',0),(930,120,'Mrs. Bing',0),(931,120,'Ursula',0),(932,120,'Estelle Leonard',1),(933,121,'Jill Goodacre',1),(934,121,'George Clooney',0),(935,121,'Bruce Willis',0),(936,121,'Brad Pitt',0),(937,122,'Gary',0),(938,122,'David',0),(939,122,'Roger',0),(940,122,'Parker',1),(941,123,'A new entertainment unit',1),(942,123,'A new couch',0),(943,123,'A giant TV',0),(944,123,'A foosball table',0),(945,124,'Tanya',0),(946,124,'Janice',1),(947,124,'Aurora',0),(948,124,'Estelle',0),(949,125,'An accountant',0),(950,125,'A chef',1),(951,125,'A teacher',0),(952,125,'A waitress',0),(953,126,'Moe',0),(954,126,'Marcel',1),(955,126,'Bobo',0),(956,126,'George',0),(957,127,'Susan',0),(958,127,'Carol',1),(959,127,'Julie',0),(960,127,'Mona',0),(961,128,'Her new boyfriend',0),(962,128,'Her partner, Susan',1),(963,128,'Ross\'s mom',0),(964,128,'A man she just met',0),(965,129,'The pies',0),(966,129,'The potatoes',1),(967,129,'The cranberries',0),(968,129,'The turkey',0),(969,130,'Estelle',1),(970,130,'Carol',0),(971,130,'Andrea',0),(972,130,'Julie',0),(973,131,'The Daily Grind',0),(974,131,'Central Perk',1),(975,131,'The Coffee Bean',0),(976,131,'Starbucks',0),(977,132,'Monica',1),(978,132,'Joey',0),(979,132,'Chandler',0),(980,132,'Phoebe',0),(981,133,'She goes on a trip',0),(982,133,'She starts dating a new guy',1),(983,133,'She goes to a therapist',0),(984,133,'She buys new clothes',0),(985,134,'Parker',1),(986,134,'Gary',0),(987,134,'David',0),(988,134,'Roger',0),(989,135,'Hey, how you doin\'?',0),(990,135,'This guy says hello, I wanna kill myself.',1),(991,135,'You just pulled a \"Monica\".',0),(992,135,'There is no \"we\" in \"friends\".',0),(993,136,'A lemur',0),(994,136,'A dog',0),(995,136,'A capuchin monkey',1),(996,136,'A turtle',0),(997,137,'Karen',0),(998,137,'Mrs. Bing',0),(999,137,'Ursula',0),(1000,137,'Estelle Leonard',1),(1001,138,'Jill Goodacre',1),(1002,138,'George Clooney',0),(1003,138,'Bruce Willis',0),(1004,138,'Brad Pitt',0),(1005,139,'Gary',0),(1006,139,'David',0),(1007,139,'Roger',0),(1008,139,'Parker',1),(1009,140,'A new entertainment unit',1),(1010,140,'A new couch',0),(1011,140,'A giant TV',0),(1012,140,'A foosball table',0),(1013,141,'Tanya',0),(1014,141,'Janice',1),(1015,141,'Aurora',0),(1016,141,'Estelle',0),(1017,142,'An accountant',0),(1018,142,'A chef',1),(1019,142,'A teacher',0),(1020,142,'A waitress',0),(1021,143,'Moe',0),(1022,143,'Marcel',1),(1023,143,'Bobo',0),(1024,143,'George',0),(1025,144,'Susan',0),(1026,144,'Carol',1),(1027,144,'Julie',0),(1028,144,'Mona',0),(1029,145,'Her new boyfriend',0),(1030,145,'Her partner, Susan',1),(1031,145,'Ross\'s mom',0),(1032,145,'A man she just met',0),(1033,146,'The pies',0),(1034,146,'The potatoes',1),(1035,146,'The cranberries',0),(1036,146,'The turkey',0),(1037,147,'Estelle',1),(1038,147,'Carol',0),(1039,147,'Andrea',0),(1040,147,'Julie',0),(1041,148,'The Daily Grind',0),(1042,148,'Central Perk',1),(1043,148,'The Coffee Bean',0),(1044,148,'Starbucks',0),(1045,149,'Monica',1),(1046,149,'Joey',0),(1047,149,'Chandler',0),(1048,149,'Phoebe',0),(1049,150,'She goes on a trip',0),(1050,150,'She starts dating a new guy',1),(1051,150,'She goes to a therapist',0),(1052,150,'She buys new clothes',0),(1053,151,'Parker',1),(1054,151,'Gary',0),(1055,151,'David',0),(1056,151,'Roger',0),(1057,152,'Rats',1),(1058,152,'Roaches',0),(1059,152,'Termites',0),(1060,152,'Ants',0),(1061,153,'Julie',0),(1062,153,'Susan',1),(1063,153,'Andrea',0),(1064,153,'Mona',0),(1065,154,'David',0),(1066,154,'Paolo',1),(1067,154,'Gary',0),(1068,154,'Roger',0),(1069,155,'Ursula',0),(1070,155,'Estelle',1),(1071,155,'Phoebe',0),(1072,155,'Gunther',0),(1073,156,'A foosball table',0),(1074,156,'A new couch',0),(1075,156,'A giant TV',1),(1076,156,'A new kitchen',0),(1077,157,'Emily',0),(1078,157,'Chloe',0),(1079,157,'Monica',0),(1080,157,'Julie',1),(1081,1077,'The One with the Prom Video',0),(1082,1077,'The One Where Ross Finds Out',1),(1083,1077,'The One with Rachel\'s Kiss',0),(1084,1077,'The One with the Breakup',0),(1085,158,'A new foosball table',0),(1086,158,'A giant entertainment center',1),(1087,158,'A large bird',0),(1088,158,'A new TV',0),(1089,159,'The Bus Song',1),(1090,159,'The Smelly Cat Song',0),(1091,159,'Central Perk Song',0),(1092,159,'The Cat on the Bus',0),(1093,160,'A head chef',0),(1094,160,'A waitress',0),(1095,160,'A sous chef',1),(1096,160,'A restaurant manager',0),(1097,161,'Marlon',0),(1098,161,'Marley',0),(1099,161,'Marcel',1),(1100,161,'Milo',0),(1101,1097,'Phoebe\'s parents',0),(1102,1097,'Carol and Susan',1),(1103,1097,'Monica and Chandler',0),(1104,1097,'Ross and Julie',0),(1105,162,'Phoebe\'s twin',0),(1106,162,'Chloe',0),(1107,162,'Melanie',1),(1108,162,'A model',0),(1109,163,'He has to get a tan',0),(1110,163,'He has to learn to use a fork',1),(1111,163,'He has to get a makeover',0),(1112,163,'He has to learn how to sing',0),(1113,1109,'He auditions for a new movie',0),(1114,1109,'He auditions for a role on a TV show',1),(1115,1109,'He gets a part in a play',0),(1116,1109,'He goes to an acting class',0),(1117,164,'A data analyst',0),(1118,164,'A computer programmer',0),(1119,164,'A financial analyst',0),(1120,164,'A transponster',1),(1121,1117,'She helps them plan the wedding',0),(1122,1117,'She sings at the wedding',1),(1123,1117,'She bakes their cake',0),(1124,1117,'She helps them pick out the flowers',0),(1125,165,'Ginger',0),(1126,165,'Ursula',1),(1127,165,'Janice',0),(1128,165,'Chloe',0),(1129,166,'She separates them into different piles',1),(1130,166,'She keeps them in the closet',0),(1131,166,'She hangs them on the door',0),(1132,166,'She folds them into animals',0),(1133,167,'Ginger',0),(1134,167,'Janice',0),(1135,167,'Frankie',0),(1136,167,'Aurora',1),(1137,168,'Ursula',0),(1138,168,'Estelle',1),(1139,168,'Phoebe',0),(1140,168,'Gunther',0),(1141,169,'A foosball table',0),(1142,169,'A new couch',0),(1143,169,'A giant TV',1),(1144,169,'A new kitchen',0),(1145,170,'Emily',0),(1146,170,'Chloe',0),(1147,170,'Monica',0),(1148,170,'Julie',1),(1149,1145,'The One with the Prom Video',0),(1150,1145,'The One Where Ross Finds Out',1),(1151,1145,'The One with Rachel\'s Kiss',0),(1152,1145,'The One with the Breakup',0),(1153,171,'A new foosball table',0),(1154,171,'A giant entertainment center',1),(1155,171,'A large bird',0),(1156,171,'A new TV',0),(1157,172,'The Bus Song',1),(1158,172,'The Smelly Cat Song',0),(1159,172,'Central Perk Song',0),(1160,172,'The Cat on the Bus',0),(1161,173,'A head chef',0),(1162,173,'A waitress',0),(1163,173,'A sous chef',1),(1164,173,'A restaurant manager',0),(1165,174,'Marlon',0),(1166,174,'Marley',0),(1167,174,'Marcel',1),(1168,174,'Milo',0),(1169,1165,'Phoebe\'s parents',0),(1170,1165,'Carol and Susan',1),(1171,1165,'Monica and Chandler',0),(1172,1165,'Ross and Julie',0),(1173,175,'Phoebe\'s twin',0),(1174,175,'Chloe',0),(1175,175,'Melanie',1),(1176,175,'A model',0),(1177,176,'He has to get a tan',0),(1178,176,'He has to learn to use a fork',1),(1179,176,'He has to get a makeover',0),(1180,176,'He has to learn how to sing',0),(1181,1177,'He auditions for a new movie',0),(1182,1177,'He auditions for a role on a TV show',1),(1183,1177,'He gets a part in a play',0),(1184,1177,'He goes to an acting class',0),(1185,177,'A data analyst',0),(1186,177,'A computer programmer',0),(1187,177,'A financial analyst',0),(1188,177,'A transponster',1),(1189,1185,'She helps them plan the wedding',0),(1190,1185,'She sings at the wedding',1),(1191,1185,'She bakes their cake',0),(1192,1185,'She helps them pick out the flowers',0),(1193,178,'Ginger',0),(1194,178,'Ursula',1),(1195,178,'Janice',0),(1196,178,'Chloe',0),(1197,179,'She separates them into different piles',1),(1198,179,'She keeps them in the closet',0),(1199,179,'She hangs them on the door',0),(1200,179,'She folds them into animals',0),(1201,180,'Ginger',0),(1202,180,'Janice',0),(1203,180,'Frankie',0),(1204,180,'Aurora',1),(1205,181,'Ursula',0),(1206,181,'Estelle',1),(1207,181,'Phoebe',0),(1208,181,'Gunther',0),(1209,182,'A foosball table',0),(1210,182,'A new couch',0),(1211,182,'A giant TV',1),(1212,182,'A new kitchen',0),(1213,183,'Emily',0),(1214,183,'Chloe',0),(1215,183,'Monica',0),(1216,183,'Julie',1),(1217,184,'The One with the Prom Video',0),(1218,184,'The One Where Ross Finds Out',1),(1219,184,'The One with Rachel\'s Kiss',0),(1220,184,'The One with the Breakup',0),(1221,185,'A new foosball table',0),(1222,185,'A giant entertainment center',1),(1223,185,'A large bird',0),(1224,185,'A new TV',0),(1225,186,'The Bus Song',1),(1226,186,'The Smelly Cat Song',0),(1227,186,'Central Perk Song',0),(1228,186,'The Cat on the Bus',0),(1229,187,'A head chef',0),(1230,187,'A waitress',0),(1231,187,'A sous chef',1),(1232,187,'A restaurant manager',0),(1233,188,'Marlon',0),(1234,188,'Marley',0),(1235,188,'Marcel',1),(1236,188,'Milo',0),(1237,189,'Phoebe\'s parents',0),(1238,189,'Carol and Susan',1),(1239,189,'Monica and Chandler',0),(1240,189,'Ross and Julie',0),(1241,190,'Phoebe\'s twin',0),(1242,190,'Chloe',0),(1243,190,'Melanie',1),(1244,190,'A model',0),(1245,191,'He has to get a tan',0),(1246,191,'He has to learn to use a fork',1),(1247,191,'He has to get a makeover',0),(1248,191,'He has to learn how to sing',0),(1249,192,'He auditions for a new movie',0),(1250,192,'He auditions for a role on a TV show',1),(1251,192,'He gets a part in a play',0),(1252,192,'He goes to an acting class',0),(1253,193,'A data analyst',0),(1254,193,'A computer programmer',0),(1255,193,'A financial analyst',0),(1256,193,'A transponster',1),(1257,194,'She helps them plan the wedding',0),(1258,194,'She sings at the wedding',1),(1259,194,'She bakes their cake',0),(1260,194,'She helps them pick out the flowers',0),(1261,195,'Ginger',0),(1262,195,'Ursula',1),(1263,195,'Janice',0),(1264,195,'Chloe',0),(1265,196,'She separates them into different piles',1),(1266,196,'She keeps them in the closet',0),(1267,196,'She hangs them on the door',0),(1268,196,'She folds them into animals',0),(1269,197,'Ginger',0),(1270,197,'Janice',0),(1271,197,'Frankie',0),(1272,197,'Aurora',1),(1273,198,'A babysitter',1),(1274,198,'A busker',0),(1275,198,'A clown',0),(1276,198,'A homeless person',0),(1277,199,'The Game of Life',0),(1278,199,'The Game of Charades',0),(1279,199,'The Game of Scrabble',0),(1280,199,'The Game of Chandler',1),(1281,200,'She is too competitive with them',1),(1282,200,'She tries to get everyone to clean her apartment',0),(1283,200,'She gets a new apartment',0),(1284,200,'She tries to get everyone to play a new game',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` varchar(36) NOT NULL,
  `series` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('5458bd30-e155-421f-ab19-12a52a951020','Stranger Things','First life','first time testing','user_9pmpu0375','2025-09-12 00:48:30'),('6d0fbcd7-ed52-445f-9ffc-f17a1b886e4e','Stranger Things','2am','final test','user_rxy1eayhg','2025-09-12 02:39:39');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `qno` int(11) NOT NULL,
  `text` varchar(500) NOT NULL,
  `show_name` varchar(255) NOT NULL,
  `season` int(25) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What is the name of the new dog that Jay and Gloria get?','Modern Family',2),(2,2,'In the episode \"The Kiss,\" what do Mitchell and Cameron have trouble doing in public?','Modern Family',2),(3,3,'What musical does Cameron direct at the high school in \"The Musical Man\"?','Modern Family',2),(4,4,'What does Claire think is the cause of Haley\'s sudden change in behavior in \"Unplugged\"?','Modern Family',2),(5,5,'In \"Halloween,\" what is the name of the haunted house that Claire creates?','Modern Family',2),(6,6,'In \"The Help,\" what does Manny ask Jay to help him with for his book report?','Modern Family',2),(7,7,'What does Phil find in his new car that he thinks is a sign?','Modern Family',2),(8,8,'In \"The Help,\" what does Gloria want to do with the new dog?','Modern Family',2),(9,9,'In \"Strangers on a Treadmill,\" what is the name of the woman Phil flirts with at the gym?','Modern Family',2),(10,10,'What is the name of the new teacher that Luke gets in \"The Old Wagon\"?','Modern Family',2),(11,11,'What does Manny do to get a date for a school dance?','Modern Family',2),(12,12,'In \"Manny Get Your Gun,\" what is the name of the girl Manny wants to ask to a party?','Modern Family',2),(13,13,'What does Jay refuse to get rid of in \"The Old Wagon\"?','Modern Family',2),(14,14,'In \"The Kiss,\" what does Mitchell tell Jay he is afraid of?','Modern Family',2),(15,15,'What does Phil have to do for his real estate license in \"The Musical Man\"?','Modern Family',2),(16,16,'In \"Chirp,\" what does Jay and Gloria\'s house get infested with?','Modern Family',2),(17,17,'In \"Halloween,\" who dresses up as a trampy cat?','Modern Family',2),(18,18,'What does Claire and Phil\'s youngest daughter do that impresses them?','Modern Family',2),(19,19,'In \"The Old Wagon,\" what do the Dunphys try to do with their old station wagon?','Modern Family',2),(20,20,'In \"The Help,\" what is the name of the new babysitter that Mitchell and Cameron hire?','Modern Family',2),(78,1,'What is the name of the high school Claire and Phil attended?','Modern Family',1),(79,2,'What country is Gloria Pritchett originally from?','Modern Family',1),(80,3,'In the episode \"Fizbo,\" what is the name of Cameron\'s clown alter ego?','Modern Family',1),(81,4,'In \"The Bicycle Thief,\" what does Phil accidentally shoot with a BB gun?','Modern Family',1),(82,5,'What does Cameron want to do with Lily in the first season?','Modern Family',1),(83,6,'What is the name of Phil and Claire\'s youngest son?','Modern Family',1),(84,7,'What is the name of Manny\'s school bully?','Modern Family',1),(85,8,'What is Claire\'s biggest fear?','Modern Family',1),(86,9,'In the episode \"Fizbo,\" what costume does Gloria wear to Lily\'s party?','Modern Family',1),(87,10,'In the episode \"Starry Night,\" what does Cameron do that upsets the entire family?','Modern Family',1),(88,11,'What is the name of the unseen documentary filmmaker who interviews the family?','Modern Family',1),(89,12,'In the episode \"Coal Digger,\" who is the \"coal digger\" referred to by Jay?','Modern Family',1),(90,13,'What is the name of the cat that Haley and Alex secretly bring home?','Modern Family',1),(91,14,'In the pilot episode, what is the name of the boy Haley is dating?','Modern Family',1),(92,15,'In \"The Incident,\" what does Mitchell get arrested for?','Modern Family',1),(93,16,'What is the theme of the party Phil throws in \"En Garde\"?','Modern Family',1),(94,17,'In \"Come Fly With Me,\" what does Manny build for his school report on Leonardo da Vinci?','Modern Family',1),(95,18,'In \"The Incident,\" why does Claire visit her old boyfriend?','Modern Family',1),(96,19,'What is the name of the resort where the family goes on vacation in \"Hawaii\"?','Modern Family',1),(97,20,'What hobby does Manny pursue to express his feelings?','Modern Family',1),(119,1,'What kind of animal does Ross get as a pet in Season 1?','Friends',1),(120,2,'What is the name of Joey\'s agent in Season 1?','Friends',1),(121,3,'In the episode \"The One With the Blackout,\" which famous actor gets trapped in an ATM vestibule with Chandler?','Friends',1),(122,4,'What is the name of the man who breaks up with Phoebe by leaving her a Post-it note?','Friends',1),(123,5,'What does Joey buy for his and Chandler\'s apartment that they get robbed of?','Friends',1),(124,6,'What is the name of the woman that Chandler falls for who he later finds out is a \"transponster\"?','Friends',1),(125,7,'What is Monica\'s job in Season 1?','Friends',1),(126,8,'What is the name of Ross\'s monkey in Season 1?','Friends',1),(127,9,'What is the name of Ross\'s ex-wife who is pregnant with his child?','Friends',1),(128,10,'In \"The One with the Sonogram at the End,\" who is Ross\'s ex-wife having a baby with?','Friends',1),(129,11,'In the Thanksgiving episode, \"The One Where the Underdog Gets Away,\" what does Monica accidentally burn?','Friends',1),(130,12,'What is the name of the woman that Joey helps to deliver a baby in \"The One with the Birth\"?','Friends',1),(131,13,'What is the name of the coffee shop where the friends spend most of their time?','Friends',1),(132,14,'Who is the one to say the line \"Welcome to the real world. It sucks. You\'re gonna love it\" in the pilot episode?','Friends',1),(133,15,'In \"The One with the Ick Factor,\" what does Monica do to try and get over her obsession with her ex-boyfriend?','Friends',1),(134,16,'What is the name of the man who breaks up with Phoebe by leaving her a Post-it note?','Friends',1),(181,1,'What is the name of Joey\'s agent?','Friends',2),(182,2,'What does Joey buy with his first big paycheck that he is very proud of?','Friends',2),(183,3,'Who does Rachel find out that Ross is dating in \"The One with the Two Parts\"?','Friends',2),(184,4,'In what episode do Rachel and Ross finally kiss?','Friends',2),(185,5,'What item does Joey buy that he and Chandler fight about in the apartment?','Friends',2),(186,6,'What is the name of the new song Phoebe writes in \"The One with the Baby on the Bus\"?','Friends',2),(187,7,'What job does Monica get at the beginning of the second season?','Friends',2),(188,8,'What is the name of the monkey that Ross gets?','Friends',2),(189,9,'In \"The One with the Lesbian Wedding,\" who gets married?','Friends',2),(190,10,'What is the name of Joey\'s love interest in \"The One with the Prom Video\"?','Friends',2),(191,11,'What does Joey have to do for his role in \"The One After the Superbowl\"?','Friends',2),(192,12,'In \"The One After the Superbowl,\" what does Joey do to get his career back on track?','Friends',2),(193,13,'What is the new job that Chandler gets in \"The One with the Baby on the Bus\"?','Friends',2),(194,14,'In \"The One with the Lesbian Wedding,\" what does Phoebe do to help Carol and Susan with their wedding?','Friends',2),(195,15,'What is the name of the girl that Joey dates who is Phoebe\'s twin sister?','Friends',2),(196,16,'What does Monica do with all her towels?','Friends',2),(197,17,'What is the name of the new love interest that Chandler gets in \"The One with the Lesbian Wedding\"?','Friends',2),(198,18,'What does Phoebe pretend to be in \"The One with the Baby on the Bus\"?','Friends',2),(199,19,'What is the name of the game the friends play in \"The One with the Bullies\"?','Friends',2),(200,20,'In \"The One with the Bullies,\" what does Monica do that irritates the rest of the gang?','Friends',2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `show_name` varchar(100) NOT NULL,
  `season` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `date_taken` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`sno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_results`
--

LOCK TABLES `quiz_results` WRITE;
/*!40000 ALTER TABLE `quiz_results` DISABLE KEYS */;
INSERT INTO `quiz_results` VALUES (1,1,'Modern Family',1,7,20,'2025-09-11 16:47:54'),(2,1,'Modern Family',1,7,20,'2025-09-11 16:48:59'),(3,1,'Modern Family',1,7,20,'2025-09-11 16:56:58'),(4,4,'Modern Family',1,2,20,'2025-09-11 17:54:41'),(5,4,'Modern Family',1,20,20,'2025-09-11 17:57:51'),(6,1,'Friends',2,8,20,'2025-09-11 18:48:19'),(7,1,'Modern Family',1,5,20,'2025-09-11 20:44:09');
/*!40000 ALTER TABLE `quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `sno` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Aaryan Gupta','aaryang0108@gmail.com','scrypt:32768:8:1$xbQDuynh0s2bNTzt$8fa870ee75596b51cacafe969dcabff031eea0cc6651fde234b4e41821ea1a40ba72fd0d094dff68539f095794d0e427feb2b41d86c0ca90c8f5727fae9d9644','2025-09-10 22:37:13'),(2,'Yash Gupta','aa@gmail.com','scrypt:32768:8:1$ayG0RLZT8kKBZObr$c0ecf845f7199606d9ec42a978d46a2ab29de674c4d7e4c788a8410b2dbc234cc561d1e68084aa496dc92158ff317375255ad945e9d92c458bb8006b7e197f7b','2025-09-11 00:57:42'),(3,'qwerty','12@gmail.com','pbkdf2:sha256:1000000$F4FlS6Rz014Zl3XX$edf9b9a8cdaa621554055eef8578365be6caac5c25e49eb0fc4c86a6ea8f579e','2025-09-11 02:21:24'),(4,'omkar','o@gmail.com','pbkdf2:sha256:1000000$wq3OaJ7MGFESjk0R$1ee1f6c05a3c632900632ea52e0eb6a703293d3773f9e28b43569ce69d58de28','2025-09-11 22:41:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` varchar(36) NOT NULL,
  `post_id` varchar(36) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `vote_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`user_id`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES ('12c270e9-68e2-4114-8665-e9f9f0522e01','5458bd30-e155-421f-ab19-12a52a951020','user_9pmpu0375','upvote');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-12  3:25:39
