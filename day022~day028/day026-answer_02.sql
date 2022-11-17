/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d3aa5df807f046bea5003dbc04965d67?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-30
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询在2025-10-15以后状态为购买成功的C++课程或者Java课程或者Python的订单，并且按照order_info的id升序排序。
 1.1 product_name: in(C++, Java, Python)
 1.2 status: = completed
 1.3 date: > 2025-10-15
 1.4 order by: id asc
 2. 案例：见题目。
 3. 公式：None。
 4. 实现：使用 WHERE 语句即可。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    id,
    user_id,
    product_name,
    status,
    client_id,
    date
FROM
    order_info
WHERE
    date > '2025-10-15'
    AND product_name IN ('C++', "JAVA", 'Python')
    AND status = "completed"
ORDER BY
    id ASC;