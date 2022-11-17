/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/activity-participants/
 创建者：Cicero
 创建日期：2021-11-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 查询，找到既没有最多、也没有最少的参与者的活动。
 结果以任意顺序返回。Activities 表中每项活动的参与者都来自 Friends 表。
 注意：name 相同、id 不同的参与者算作两个人。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 WHERE 条件过滤掉最多、最少的参与者的活动即可。
 */
USE sql_daily_exercises;

WITH -- 统计各项活动的参与者数量
count_friends AS (
    SELECT
        activity,
        COUNT(id) AS num_of_friends
    FROM
        Friends
    GROUP BY
        activity
)
SELECT
    activity
FROM
    count_friends
WHERE
    num_of_friends < (
        SELECT
            MAX(num_of_friends)
        FROM
            count_friends
    )
    AND num_of_friends > (
        SELECT
            MIN(num_of_friends)
        FROM
            count_friends
    );