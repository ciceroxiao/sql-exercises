/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/exchange-seats/
 创建者：Cicero
 创建日期：2021-10-12
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：交换相邻 Id 的 Student。如果 Id 总数量是奇数，那么，最后一位 Id 无需交换 Student。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：需求看似是交换 Student，实则是“交换”相邻 Id 的值。如此一来，事情就简单许多。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    (
        CASE
            WHEN id % 2 = 0 THEN id - 1
            WHEN (id % 2 <> 0)
            AND (
                id = (
                    SELECT
                        COUNT(*)
                    FROM
                        seat
                )
            ) THEN id
            ELSE id + 1
        END
    ) AS id,
    student
FROM
    seat
ORDER BY
    id ASC;