/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/percentage-of-users-attended-a-contest/
 创建者：Cicero
 创建日期：2021-12-6
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        写一条 SQL 语句，查询各赛事的用户注册百分率，保留两位小数。
        结果表按 percentage 的降序排序，若相同则按 contest_id 的升序排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 按 contest_id 统计各赛事的用户注册百分率即可。
 */

USE sql_daily_exercises;

select
    contest_id,
    round(count(user_id) / (select count(1) from Users) * 100, 2) as percentage
from
    Register
group by
    contest_id
order by
    percentage desc,
    contest_id asc;