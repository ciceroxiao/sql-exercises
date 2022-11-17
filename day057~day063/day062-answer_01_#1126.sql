/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/active-businesses/
 创建者：Cicero
 创建日期：2021-11-12
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 活跃业务的定义如下：某事件类型的发生数量超过该类型的平均值，则该事件类型为有效事件。如果某业务的有效事件数量大于 1，则该业务为活跃业务。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 使用窗口函数：avg(occurences) over (partition by event_type) 找到每个事件类型的平均值。
 4.2 再按 event_type 分组、计数，找到每个事件类型的有效事件数量。
 4.3 最后，找到活跃业务。
 */
USE sql_daily_exercises;

SELECT
    business_id
FROM
    (
        SELECT
            business_id,
            event_type,
            occurences,
            AVG(occurences) over (PARTITION BY event_type) AS avg_occurences
        FROM
            Events
    ) AS A
WHERE
    occurences > avg_occurences
GROUP BY
    business_id
HAVING
    COUNT(*) > 1;