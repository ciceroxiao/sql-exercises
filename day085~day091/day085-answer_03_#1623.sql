/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/all-valid-triplets-that-can-represent-a-country/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 有一个国家只有三所学校，这个国家的每一个学生只会注册一所学校。
 这个国家正在参加一个竞赛，他们希望从这三所学校中各选出一个学生来组建一支三人的代表队。
 例如：
 member_A 是从 SchoolA 中选出的，member_B 是从 SchoolB 中选出的，member_C 是从 SchoolC 中选出的，被选中的学生具有不同的名字和 ID（没有任何两个学生拥有相同的名字、没有任何两个学生拥有相同的 ID）。
 使用上述条件，编写SQL查询语句来找到所有可能的三人国家代表队组合。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 WHERE 即可。
 */
USE sql_daily_exercises;

SELECT
    A .student_name member_A,
    b.student_name member_B,
    C .student_name member_C
FROM
    SchoolA A,
    SchoolB b,
    SchoolC C
WHERE
    A .student_id != b.student_id
    AND b.student_id != C .student_id
    AND A .student_id != C .student_id
    AND A .student_name != b.student_name
    AND b.student_name != C .student_name
    AND A .student_name != C .student_name;