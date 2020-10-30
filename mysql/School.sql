SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `roleId` int(11) NOT NULL,
    `username` varchar(50) NOT NULL UNIQUE,
    `firstName` varchar(50) NULL,
    `lastName` varchar(50) NULL,
    `email` varchar(50) NOT NULL UNIQUE,
    `password` varchar(128),
    `createdAt` timestamp NOT NULL,
    `updatedAt` timestamp NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `user_role_fk` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Course
-- ----------------------------
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Period
-- ----------------------------
DROP TABLE IF EXISTS `Period`;
CREATE TABLE `Period`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `startDate` datetime NULL,
    `endDate` datetime NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for CourseClass
-- ----------------------------
DROP TABLE IF EXISTS `CourseClass`;
CREATE TABLE `CourseClass` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `courseId` int(11) NOT NULL,
    `userId` int(11) NOT NULL,
    `periodId` int(11) NOT NULL,
    `capacity` int(11) NULL,
    `createdAt` timestamp NOT NULL,
    `updatedAt` timestamp NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `courseclass_course_fk` FOREIGN KEY (`courseId`) REFERENCES `Course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `courseclass_user_fk` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `courseclass_period_fk` FOREIGN KEY (`periodId`) REFERENCES `Period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Day
-- ----------------------------
DROP TABLE IF EXISTS `Day`;
CREATE TABLE `Day`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Schedule
-- ----------------------------
DROP TABLE IF EXISTS `Schedule`;
CREATE TABLE `Schedule` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `dayId` int(11) NOT NULL,
    `courseClassId` int(11) NOT NULL,
    `startTime` time NULL,
    `endTime` time NULL,
    `createdAt` timestamp NOT NULL,
    `updatedAt` timestamp NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `schedule_day_fk` FOREIGN KEY (`dayId`) REFERENCES `Day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `schedule_courseclass_fk` FOREIGN KEY (`courseClassId`) REFERENCES `CourseClass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for RecordBook
-- ----------------------------
DROP TABLE IF EXISTS `RecordBook`;
CREATE TABLE `RecordBook` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `userId` int(11) NOT NULL,
    `periodId` int(11) NOT NULL,
    `courseClassId` int(11) NOT NULL,
    `qualification` decimal(10, 6) NULL,
    `createdAt` timestamp NOT NULL,
    `updatedAt` timestamp NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `recordbook_user_fk` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `recordbook_period_fk` FOREIGN KEY (`periodId`) REFERENCES `Period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `recordbook_courseclass_fk` FOREIGN KEY (`courseClassId`) REFERENCES `CourseClass` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;