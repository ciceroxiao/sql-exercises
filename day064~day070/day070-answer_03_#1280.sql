/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/students-and-examinations/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写一个 SQL 语句，查询出每个学生参加每一门科目测试的次数，结果按 student_id 和 subject_name 排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：——
 */
USE sql_daily_exercises;

SELECT
    A .student_id,
    A .student_name,
    b.subject_name,
    SUM(
        CASE
            WHEN A .student_id = C .student_id
            AND C .subject_name = b.subject_name THEN 1
            ELSE 0
        END
    ) AS attended_exams
FROM
    Students AS A,
    Subjects AS b,
    Examinations AS C
GROUP BY
    student_id,
    subject_name
ORDER BY
    student_id,
    subject_name;