/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-users-with-valid-e-mails/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Users;
create table if not exists Users(
    user_id int primary key,
    name    varchar(255) not null,
    mail    varchar(255) not null
);
insert into Users values(1, 'Winston',      'winston@leetcode.com');
insert into Users values(2, 'Jonathan',     'jonathanisgreat');
insert into Users values(3, 'Annabelle',    'bella-@leetcode.com');
insert into Users values(4, 'Sally',        'sally.come@leetcode.com');
insert into Users values(5, 'Marwan',       'quarz#2020@leetcode.com');
insert into Users values(6, 'David',        'david69@gmail.com');
insert into Users values(7, 'Shapiro',      '.shapo@leetcode.com');

-- 核验数据
select * from Users;
