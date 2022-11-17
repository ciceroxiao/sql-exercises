/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/get-the-second-most-recent-activity/
 创建者：Cicero
 创建日期：2021-11-25
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一段 SQL 查询，展示每一位用户最近第二次的活动。如果用户仅有一次活动，则展示用户的第一次活动。
 一个用户不能同时进行超过一项活动。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：数据的关键在于：有第二次活动的，取第二次活动的数据；无第二次活动的，取第一次活动的数据。
 4.1. 如何找到有第二次活动的数据？窗口函数 rank() 排名后，取各个用户的第二次活动的数据；
 4.2. 如何找到无第二次活动的数据？关键点在于，要排除那些有第二次活动的数据。分类计数。使用窗口函数 count() 计数，
 如果窗口中的数据为 1，则说明该用户只有一次活动，不是第二次活动。
 */
USE sql_daily_exercises;

SELECT
    username,
    activity,
    startDate,
    endDate
FROM
(
        SELECT
            username,
            activity,
            startDate,
            endDate,
            rank() over (
                PARTITION BY username
                ORDER BY
                    startDate DESC
            ) AS activity_rank,
            COUNT(*) over (PARTITION BY username) AS activity_count
        FROM
            UserActivity
    ) AS A
WHERE
    A .activity_rank = 2
    OR A .activity_count = 1;