/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d6dd656483b545159d3aa89b4c26004e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-26
 修改日期：
 
 Cicero 的解题思路：
 1. 明确任务：每一个日期里面，找到正常用户之间发送邮件失败的概率。
 数据保留三位小数，以日期升序排序。
 2. 先排除有非正常用户参与的邮件数据：
    2.1 先找到非正常用户的用户 id;
    2.2 联结表 email 和 user，排除有非正常用户参与的邮件数据。
 3. 而后以日期为分类依据，找到各日期中失败的次数，并计算当日失败的频率：
    3.1 使用 GROUP BY 以 email.date 为分类依据，对 2. 所获得数据进行分组；
    3.2 使用 SUM 函数与 CASE 函数，求得各日期中失败的次数；
    3.3 再使用 ROUND 函数，指定频率计算结果的小数位数。
 4. 按照任务要求，返回指定数据：
    4.1 使用 ORDER BY 对数据结果进行排序，得到指定数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .date,
    round(
        SUM(
            CASE
                A .type
                WHEN "no_completed" THEN 1
                ELSE 0
            END
        ) / COUNT(A .type),
        3
    ) AS "p"
FROM
    email AS A
    LEFT JOIN (
        SELECT
            id
        FROM
            USER
        WHERE
            is_blacklist = 1
    ) AS b ON A .send_id != b.id
    OR A .receive_id != b.id
GROUP BY
    A .date
ORDER BY
    A .date ASC;