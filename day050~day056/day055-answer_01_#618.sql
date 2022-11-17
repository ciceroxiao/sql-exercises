/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/students-report-by-geography/
 创建者：Cicero
 创建日期：2021-10-29
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：数据透视表。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 */
USE sql_daily_exercises;

-- 假设已知 continent 的值
-- id 用于选出有效值
-- COALESCE() 用于隐藏空值
select
    COALESCE(max(America), "") as America,
    COALESCE(max(Asia), "") as Asia,
    COALESCE(max(Europe), "") as Europe
from(
select
    (case
    when continent = 'America' then @r1 := @r1 + 1
    when continent = 'Asia' then @r2 := @r2 + 1
    when continent = 'Europe' then @r3 := @r3 + 1 end) as id,
    if(continent = 'America', name, null) as America,
    if(continent = 'Asia', name, null) as Asia,
    if(continent = 'Europe', name, null) as Europe
from
    student,
    (select @r1 := 0, @r2 := 0, @r3 := 0) r
order by name) as A
group by id;
