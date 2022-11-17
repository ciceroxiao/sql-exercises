/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/last-person-to-fit-in-the-bus/
 创建者：Cicero
 创建日期：2021-11-17
 修改日期：2021-11-18
 
 Cicero 的解题思路：
 1. 需求：
 电梯的最大载重量为 1000。
 编写一个 SQL 查询，找到最后一个能够安全进入电梯且不超过电梯最大载重量的乘客。题目确保队列中的第一个乘客能够进入电梯。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接使用窗口函数。
 */
USE sql_daily_exercises;

SELECT
    A .person_name
FROM
(
        SELECT
            Queue.person_id,
            Queue.person_name,
            Queue.turn,
            SUM(Queue.weight) over(
                ORDER BY
                    Queue.turn
            ) AS total_weight
        FROM
            Queue
    ) AS A
WHERE
    A .total_weight <= 1000
ORDER BY
    A .turn DESC
LIMIT
    1;