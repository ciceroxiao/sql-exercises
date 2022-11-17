/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/c5736983c322483e9f269dd23bdf2f6f?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-2
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询指定条件下的订单 id、is_group_buy、client_id；而后，根据 client_id 显示 client_name。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到指定条件下的订单 id、is_group_buy、client_id；
 4.2 再联结表 client，得到对应 client_name；
 4.3 最后，按照 order_info.id 升序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先找到指定条件下的订单 id、is_group_buy、client_id；
SELECT
    A .id,
    A .is_group_buy,
    C .name
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
ORDER BY
    A .id ASC;

-- 再联结表 client，得到对应 client_name；
-- 最后，按照 order_info.id 升序排序。