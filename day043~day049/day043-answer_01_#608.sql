/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/tree-node/
 创建者：Cicero
 创建日期：2021-10-17
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：标注出 Root、Leaf 和 Inner。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：——
 */
USE sql_daily_exercises;

SELECT
    id,
    (
        CASE
            WHEN p_id IS NULL THEN "Root"
            WHEN id IN (
                SELECT
                    DISTINCT p_id
                FROM
                    tree
            ) THEN "Inner"
            ELSE "Leaf"
        END
    ) AS TYPE
FROM
    tree;