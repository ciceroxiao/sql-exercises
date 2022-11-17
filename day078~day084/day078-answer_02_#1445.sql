/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/apples-oranges/
 创建者：Cicero
 创建日期：2021-11-28
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 查询，报告每一天中苹果和橘子的销售数目差。
 返回的结果，按照“ YYYY-MM-DD ”格式的 sale_date 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：按日期分组求和即可。
 */
USE sql_daily_exercises;

SELECT
    sale_date,
    SUM(
        CASE
            WHEN fruit = "apples" THEN sold_num
            ELSE - sold_num
        END
    ) AS diff
FROM
    Sales
GROUP BY
    sale_date;