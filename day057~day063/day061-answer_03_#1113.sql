/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/reported-posts/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：假设今天是 2019-07-05，查询昨天内，各报告原因的帖子数量。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 筛选数据：先找到属于昨天的数据；再找到 action 是“report”的数据。
 4.2 分组：按照 extra 分组，求出每种 extra 的帖子数量。注意去重，因为用户可能重复提交。
 */
USE sql_daily_exercises;

SELECT
    extra AS report_reason,
    COUNT(DISTINCT post_id) AS report_count
FROM
    Actions
WHERE
    date_sub("2019-07-05", INTERVAL 1 DAY) = action_date
    AND action = 'report'
GROUP BY
    extra
ORDER BY
    report_count ASC;