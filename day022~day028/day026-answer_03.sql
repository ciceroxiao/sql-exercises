/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/4ca4137cb490420cad06d2147ae67456?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-30
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询在2025-10-15以后，同一个用户下单2个以及2个以上状态为购买成功的C++课程或Java课程或Python课程的user_id，并且按照user_id升序排序。
 1.1 date: > '2025-10-15'
 1.2 status: = 'completed'
 1.3 user_id: group by user_id
 1.4 count(1) > 1
 2. 案例：见题目。
 3. 公式：None。
 4. 实现：
 4.1 首先，使用 WHERE 筛选出 date > '2025-10-15' AND status = 'completed' 的数据‘
 4.2 其次，使用 GROUP BY user_id，对用户分组
 4.3 再其次，使用 HAVING COUNT(1) > 1 筛选出下单 2 个或 2 个以上成功购买的数据；
 4.4 最后，按照 user_id 升序排列。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    user_id
FROM
    order_info
WHERE
    DATE > '2025-10-15'
    AND status = 'completed'
GROUP BY
    user_id
HAVING
    COUNT(1) > 1
ORDER BY
    user_id ASC;