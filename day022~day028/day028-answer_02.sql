/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d6f4a37f966145da8900ba9edcc4c068?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-2
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：在 day028 的基础上，此题做了如下改变：
 1.1 if is_group_buys == 'Yes', then source = "GroupBuy";
 else source = "client_id → client.name"
 1.2 COUNT(source)
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到如何各项条件的用户信息；
 4.2 根据条件显示 source；
 4.3 显示 COUNT(source)，即 cnt；
 4.4 最后，以 source 升序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    (
        CASE
            WHEN is_group_buy = 'Yes' THEN "GroupBuy"
            ELSE C .name
        END
    ) AS source,
    COUNT(1) AS cnt
FROM
    order_info AS A
    LEFT JOIN (
        SELECT
            user_id
        FROM
            order_info
        WHERE
            DATE > '2025-10-15'
            AND product_name IN ('C++', 'Java', 'Python')
            AND status = 'completed'
        GROUP BY
            user_id
        HAVING
            COUNT(1) >= 2
    ) AS b ON A .user_id = b.user_id
    LEFT JOIN client AS C ON A .client_id = C .id
WHERE
    DATE > '2025-10-15'
    AND product_name IN ('C++', 'Java', 'Python')
    AND status = 'completed'
GROUP BY
    source
ORDER BY
    source ASC;