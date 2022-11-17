/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/048ed413ac0e4cf4a774b906fc87e0e7?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

CREATE TABLE `follow` (
`user_id` int(4) NOT NULL,
`follower_id` int(4) NOT NULL,
PRIMARY KEY (`user_id`,`follower_id`));

CREATE TABLE `music_likes` (
`user_id` int(4) NOT NULL,
`music_id` int(4) NOT NULL,
PRIMARY KEY (`user_id`,`music_id`));

CREATE TABLE `music` (
`id` int(4) NOT NULL,
`music_name` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO follow VALUES(1,2);
INSERT INTO follow VALUES(1,4);
INSERT INTO follow VALUES(2,3);

INSERT INTO music_likes VALUES(1,17);
INSERT INTO music_likes VALUES(2,18);
INSERT INTO music_likes VALUES(2,19);
INSERT INTO music_likes VALUES(3,20);
INSERT INTO music_likes VALUES(4,17);

INSERT INTO music VALUES(17,'yueyawang');
INSERT INTO music VALUES(18,'kong');
INSERT INTO music VALUES(19,'MOM');
INSERT INTO music VALUES(20,'Sold Out');
