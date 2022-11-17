/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/queries-quality-and-percentage/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        query_quality = avg(rating / position)
        poor query percentage = count(rating < 3) / count(rating)
        编写一个 SQL 查询，找到每个 query_name、query_quality 和 poor query percentage。
        query_quality 和 poor query percentage 的结果保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接按照题目要求实现即可。
 */


USE sql_daily_exercises;

select
    query_name,
    round(sum(rating/position) / count(rating), 2) as query_quality,
    round(sum(case when rating < 3 then 1 else 0 end) / count(rating) * 100, 2) as poor_query_percentage
from
    Queries
group by
    query_name;