/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sellers-with-no-sales/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个SQL语句, 报告所有在2020年度没有任何卖出的卖家的名字。
 结果以 seller_name 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 筛选数据：2020 年度的数据；
 4.2. 连表查询；
 4.3. 结果按照 seller_name 升序排列。
 */
USE sql_daily_exercises;

SELECT
    b.seller_name
FROM
    Orders AS A
    RIGHT JOIN Sellers AS b ON A .seller_id = b.seller_id
    AND date_format(A .sale_date, '%Y') = '2020'
WHERE
    A .order_id IS NULL
ORDER BY
    seller_name;