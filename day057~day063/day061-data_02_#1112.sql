/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/highest-grade-for-each-student/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Enrollments;
truncate table Enrollments;
create table if not exists Enrollments(
    student_id    int,
    course_id     int,
    grade         int,
    primary key(student_id, course_id)
);
insert into Enrollments values(1, 1, 90);
insert into Enrollments values(1, 2, 99);
insert into Enrollments values(2, 3, 95);
insert into Enrollments values(2, 2, 95);
insert into Enrollments values(3, 1, 80);
insert into Enrollments values(3, 2, 75);
insert into Enrollments values(3, 3, 82);