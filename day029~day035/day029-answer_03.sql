/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/ae5e8273e73b4413823b676081bd355c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：“如果一个学生知道了自己综合成绩以后，最差是排第几名?”，即先排序，再求累加值。
 2. 案例：见题目。
 3. 公式：sum(number) over(order by grade asc)。
 4. 实现：直接使用窗口函数即可实现需求。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    grade,
    SUM(NUMBER) over(
        ORDER BY
            grade ASC
    ) AS t_rank
FROM
    class_grade;