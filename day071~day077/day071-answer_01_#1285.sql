/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 数据库 Logs 中的某些 id 已移除。
 编写一个 SQL 语句，找出在 Logs 中的所有连续区间的起始和结束 id。
 结果以 start_id 升序排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 如果某些数字处于连续区间中，则它们与自己的排名的差相同。以此来辨识连续区间。
 使用窗口函数 rank() 实现各个数字与自己的排名的差。
 */
USE sql_daily_exercises;

SELECT
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM
(
        SELECT
            log_id,
            (
                log_id - rank() over (
                    ORDER BY
                        log_id
                )
            ) AS id_rank_diffrence
        FROM
            Logs
    ) AS A
GROUP BY
    id_rank_diffrence;