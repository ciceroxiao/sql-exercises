/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/create-a-session-bar-chart/
 创建者：Cicero
 创建日期：2021-11-27
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 你想知道用户在你的 APP 上的活动时间。因此，你决定统计访问区间如下：
 - [0-5>
 - [5-10>
 - [10-15>
 - 15 or more
 你需要统计每个区间的频率，并以此绘制柱状图。
 编写 SQL 查询，返回 （bin, total）。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 分区间统计后，再 union 数据：
 4.2. 先转换数据，再计数：
 */
USE sql_daily_exercises;

-- 分区间统计后，再 union 数据：
SELECT
    '[0-5>' AS bin,
    COUNT(session_id) AS total
FROM
    Sessions
WHERE
    DURATION < (60 * 5)
UNION
SELECT
    '[5-10>' AS bin,
    COUNT(session_id) AS total
FROM
    Sessions
WHERE
    DURATION >= (60 * 5)
    AND DURATION < (60 * 10)
UNION
SELECT
    '[10-15>' AS bin,
    COUNT(session_id) AS total
FROM
    Sessions
WHERE
    DURATION < (60 * 15)
    AND DURATION >= (60 * 10)
UNION
SELECT
    '15 or more' AS bin,
    COUNT(session_id) AS total
FROM
    Sessions
WHERE
    DURATION >= (60 * 15)
);

-- 先转换数据，再计数：
WITH t1 AS (
    SELECT
        session_id,
        CASE
            WHEN DURATION / 60 >= 0
            AND DURATION / 60 < 5 THEN '[0-5>'
            WHEN DURATION / 60 < 10 THEN '[5-10>'
            WHEN DURATION / 60 < 15 THEN '[10-15>'
            ELSE '15 or more'
        END AS bin
    FROM
        Sessions
),
t2 AS (
    SELECT
        "[0-5>" AS bin
    UNION
    SELECT
        "[5-10>"
    UNION
    SELECT
        "[10-15>"
    UNION
    SELECT
        "15 or more"
)
SELECT
    t2.bin,
    COUNT(t1.bin) AS total
FROM
    t2
    LEFT JOIN t1 ON t1.bin = t2.bin
GROUP BY
    t2.bin;