/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/team-scores-in-football-tournament/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 */

USE sql_daily_exercises;

DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Matches;

Create table If Not Exists Teams (team_id int, team_name varchar(30));
Create table If Not Exists Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int);
Truncate table Teams;
insert into Teams (team_id, team_name) values ('10', 'Leetcode FC');
insert into Teams (team_id, team_name) values ('20', 'NewYork FC');
insert into Teams (team_id, team_name) values ('30', 'Atlanta FC');
insert into Teams (team_id, team_name) values ('40', 'Chicago FC');
insert into Teams (team_id, team_name) values ('50', 'Toronto FC');
Truncate table Matches;
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('1', '10', '20', '3', '0');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('2', '30', '10', '2', '2');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('3', '10', '50', '5', '1');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('4', '20', '30', '1', '0');
insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('5', '50', '30', '1', '0');

-- 核验数据
SELECT * FROM Teams;
SELECT * FROM Matches;
