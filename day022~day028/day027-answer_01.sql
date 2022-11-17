/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/4ae8cff2505f4d7cb68fb0ec7cf80c57?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-1
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询在 2025-10-15 以后，同一个用户下单 2 个以及 2 个以上状态为购买成功的 C++ 课程或 Java 课程或 Python 课程的订单信息，并且按照 order_info 的 id 升序排序。
 1.1 date > '2025-10-15'
 1.2 GROUP BY user_id
 1.3 count(status = completed) >= 2
 1.4 product_name IN ('C++', 'Java', 'Python')
 1.5 ORDER BY id
 2. 案例：见题目。
 3. 公式：
 核心公式：
 3.1 筛选成功购买 2 个及 2 个以上课程的用户：COUNT(1) >= 2
 4. 实现：
 4.1 先找到成功购买 2 个及 2 个以上课程的用户 user_id；
 4.2 找到对应用户 user_id 的 order_info；
 4.3 再使用 WHERE 过滤 date、product_name 和 status；
 4.4 最后，使用 ORDER BY id ASC 排序数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    id,
    A .user_id,
    product_name,
    status,
    client_id,
    DATE
FROM
    order_info AS A
    INNER JOIN (
        SELECT
            user_id
        FROM
            order_info
        GROUP BY
            user_id
        HAVING
            COUNT(1) > 1
    ) AS b ON A .user_id = b.user_id
WHERE
    DATE > '2025-10-15'
    AND status = 'completed'
    AND product_name IN ('C++', 'Java', 'Python')
ORDER BY
    id ASC;