/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/reported-posts-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到：在被用户标记为“Spam”的帖子中，被管理员删除的帖子的每日平均占比。结果保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 连表查询，找到各日期的被删除的帖子数量，并计算每日删除帖子数量占比。
 4.2 再找到每日删除帖子数量占比的平均值。
 */

USE sql_daily_exercises;

-- 先找到所有被用户标记为“Spam”、且被管理员删除的帖子
select
    a.post_id,
    a.action_date,
    a.action,
    a.extra
from
    Actions as a
    left join
    Removals as b
    on a.post_id = b.post_id
where
    a.extra = 'Spam';

-- 再找到每日删除帖子数量的占比
select
    round(count(distinct b.post_id) / count(distinct a.post_id) * 100, 2) as daily_spam_removel
from
    Actions as a
    left join
    Removals as b
    on a.post_id = b.post_id
where
    a.extra = 'Spam'
group by
    a.action_date;

-- 最后找到每日删除帖子数量占比的平均值
select
    round(avg(daily_spam_removel), 2) as average_daily_percent
from
    (select
    round(count(distinct b.post_id) / count(distinct a.post_id) * 100, 2) as daily_spam_removel
from
    Actions as a
    left join
    Removals as b
    on a.post_id = b.post_id
where
    a.extra = 'Spam'
group by
    a.action_date) as c;