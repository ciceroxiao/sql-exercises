/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/patients-with-a-condition/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Patients;
create table if not exists Patients (
    patient_id      int,
    patient_name    varchar(255),
    conditions       varchar(255),
    primary key (patient_id)
);
insert into Patients values (1, 'Daniel', 'YFEV COUGH');
insert into Patients values (2, 'Alice', '');
insert into Patients values (3, 'Bob', 'DIAB100 MYOP');
insert into Patients values (4, 'George', 'ACNE DIAB100');
insert into Patients values (5, 'Alain', 'DIAB201');

-- 核验数据
select * from Patients;
