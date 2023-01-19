-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: rooms
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groupz;
DROP TABLE IF EXISTS users_groupz;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS groupz_rooms;

CREATE TABLE users (
  user_id int PRIMARY KEY,
  user_name varchar(30) NOT NULL
);

CREATE TABLE groupz (
  group_id int PRIMARY KEY,
  group_name varchar(30) NOT NULL
);

CREATE TABLE rooms (
  room_id int PRIMARY KEY,
  room_name varchar(30) NOT NULL
);

CREATE TABLE users_groupz (
	user_id int,
    group_id int
);

CREATE TABLE groupz_rooms (
	group_id int,
    room_id int
);

INSERT INTO users ( user_id, user_name) VALUES ( 1, 'Modesto');
INSERT INTO users ( user_id, user_name) VALUES ( 2, 'Ayine');
INSERT INTO users ( user_id, user_name) VALUES ( 3, 'Chris');
INSERT INTO users ( user_id, user_name) VALUES ( 4, 'Cheong');
INSERT INTO users ( user_id, user_name) VALUES ( 5, 'Saulut');
INSERT INTO users ( user_id, user_name) VALUES ( 6, 'Heidy');

INSERT INTO groupz ( group_id, group_name) VALUES ( 1, 'IT');
INSERT INTO groupz ( group_id, group_name) VALUES ( 2, 'Sales');
INSERT INTO groupz ( group_id, group_name) VALUES ( 3, 'Admin');
INSERT INTO groupz ( group_id, group_name) VALUES ( 4, 'Ops');

INSERT INTO rooms ( room_id, room_name) VALUES ( 1, '101');
INSERT INTO rooms ( room_id, room_name) VALUES ( 2, '102');
INSERT INTO rooms ( room_id, room_name) VALUES ( 3, 'A');
INSERT INTO rooms ( room_id, room_name) VALUES ( 4, 'B');

INSERT INTO users_groupz ( user_id, group_id) VALUES ( 1, 1);
INSERT INTO users_groupz ( user_id, group_id) VALUES ( 2, 1);
INSERT INTO users_groupz ( user_id, group_id) VALUES ( 3, 2);
INSERT INTO users_groupz ( user_id, group_id) VALUES ( 4, 2);
INSERT INTO users_groupz ( user_id, group_id) VALUES ( 5, 3);

INSERT INTO groupz_rooms ( group_id, room_id) VALUES ( 1, 1);
INSERT INTO groupz_rooms ( group_id, room_id) VALUES ( 1, 2);
INSERT INTO groupz_rooms ( group_id, room_id) VALUES ( 2, 2);
INSERT INTO groupz_rooms ( group_id, room_id) VALUES ( 2, 3);

# All groups, user in each group. All groups should appear.
SELECT groupz.group_name, users.user_name
FROM groupz
LEFT JOIN users_groupz
ON groupz.group_id = users_groupz.group_id
LEFT JOIN users 
ON users_groupz.user_id = users.user_id;

# All rooms, groups in each room. All rooms appear. 
SELECT rooms.room_name, groupz.group_name
FROM rooms
LEFT JOIN groupz_rooms
ON rooms.room_id = groupz_rooms.room_id
LEFT JOIN groupz 
ON groupz_rooms.group_id = groupz.group_id;

# List of users, groups they belong, rooms asigned.
# Sorted by user, group, room
SELECT users.user_name, groupz.group_name, rooms.room_name
FROM users
LEFT JOIN users_groupz
ON users.user_id = users_groupz.user_id
LEFT JOIN groupz
ON users_groupz.group_id = groupz.group_id
LEFT JOIN groupz_rooms
ON groupz.group_id = groupz_rooms.group_id
LEFT JOIN rooms
ON groupz_rooms.room_id = rooms.room_id
ORDER BY users.user_name, groupz.group_name, rooms.room_name