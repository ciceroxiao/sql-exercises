/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/patients-with-a-condition/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一条 SQL 语句，查询患有 I 类糖尿病的患者 ID （patient_id）、患者姓名（patient_name）以及其患有的所有疾病代码（conditions）。
 I 类糖尿病的代码总是包含前缀 DIAB1 。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 LIKE 关键字即可。
 */
USE sql_daily_exercises;

SELECT
    patient_id,
    patient_name,
    conditions
FROM
    Patients
WHERE
    conditions LIKE '% DIAB1%'
    OR conditions LIKE 'DIAB1%';