/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/friendly-movies-streamed-last-month/
 创建者：Cicero
 创建日期：2021-11-30
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查询在 2020 年 6 月份播放的儿童适宜电影的电影名称。
 结果以任意顺序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 连表查询：
 4.1.1. dateformat(program_date, '%Y-%m') = '2020-06'
 4.1.2. Kids_content = 'Y'
 4.1.3. content_type = 'Movies'
 */
USE sql_daily_exercises;

SELECT
    title
FROM
    Content AS A
    JOIN TVProgram AS b ON A .content_id = b.content_id
WHERE
    date_format(b.program_date, '%Y-%m') = '2020-06'
    AND A .Kids_content = 'Y'
    AND A .content_type = 'Movies'
GROUP BY
    title;