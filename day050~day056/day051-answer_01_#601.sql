/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/human-traffic-of-stadium/
 创建者：Cicero
 创建日期：2021-10-25
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 2. 案例：
 3. 公式：
 4. 实现：
 */

USE sql_daily_exercises;

-- 先筛选出 people >= 100 的数据，以 id 升序排序
select
    id,
    visit_date,
    people
from
    Stadium
where
    people >= 100
order by
    id asc;

-- 其次，找到每个 visit_date 值的下一个 visit_date
select
    id,
    visit_date,
    people,
    lag(id) over(order by id) as second_id
from
    Stadium
where
    people >= 100
order by
    id asc;

-- 标记 gaps
select
    id,
    visit_date,
    people,
    (case
        when abs(second_id-id) = 1 then 0
        else 1 END) as gaps
from
(
select
    id,
    visit_date,
    people,
    lag(id) over(order by id) as second_id
from
    Stadium
where
    people >= 100
order by
    id asc) as A;

-- 计算累计和
select
    id,
    visit_date,
    second_id,
    people,
    sum(gaps) over(order by id) as flag
from
(
select
    id,
    second_id,
    visit_date,
    people,
    (case
        when abs(second_id-id) = 1 then 0
        else 1 END) as gaps
from
(
select
    id,
    visit_date,
    people,
    lag(id) over(order by id) as second_id
from
    Stadium
where
    people >= 100
order by
    id asc) as A) as B;

-- 统计各个 island 的成员数量
select
    id,
    second_id,
    visit_date,
    people,
    COUNT(*) over(partition by flag) as nums
from
    (
        select
    id,
    visit_date,
    second_id,
    people,
    sum(gaps) over(order by id) as flag
from
(
select
    id,
    second_id,
    visit_date,
    people,
    (case
        when abs(second_id-id) = 1 then 0
        else 1 END) as gaps
from
(
select
    id,
    visit_date,
    people,
    lag(id) over(order by id) as second_id
from
    Stadium
where
    people >= 100
order by
    id asc) as A) as B
    ) as C;

-- 筛选连续出现 3 次或 3 次以上的数据
select
    id,
    visit_date,
    people
from
    (
        select
    id,
    second_id,
    visit_date,
    people,
    COUNT(*) over(partition by flag) as nums
from
    (
        select
    id,
    visit_date,
    second_id,
    people,
    sum(gaps) over(order by id) as flag
from
(
select
    id,
    second_id,
    visit_date,
    people,
    (case
        when abs(second_id-id) = 1 then 0
        else 1 END) as gaps
from
(
select
    id,
    visit_date,
    people,
    lag(id) over(order by id) as second_id
from
    Stadium
where
    people >= 100
order by
    id asc) as A) as B
    ) as C
    ) as D
where
    nums >= 3;