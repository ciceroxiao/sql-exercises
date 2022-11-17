/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/consecutive-numbers/
 创建者：Cicero
 创建日期：2021-10-18
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：查询至少连续出现 3 次的数字。
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先使用窗口函数 LAG() 得到每个当前数字的前一数字；
 4.2 比较当前数字和前一数字。如果两者相等，则意味着该数字连续出现。
 4.3 然后再统计数字出现的次数；
 4.4 最后，注意去重。
 */
USE sql_daily_exercises;

SELECT
    DISTINCT B.Num AS ConsecutiveNums
FROM
    (
        SELECT
            A .Num,
            A .Lag_num,
            SUM(A .diff) over(
                ORDER BY
                    A .Id
            ) AS sum_diff
        FROM
            (
                SELECT
                    Id,
                    Num,
                    LAG(Num) over(
                        ORDER BY
                            Id
                    ) AS Lag_num,
                    IF(
                        LAG(Num) over(
                            ORDER BY
                                Id
                        ) - Num = 0,
                        0,
                        1
                    ) AS diff
                FROM
                    Logs
            ) AS A
    ) AS B
GROUP BY
    B .Num,
    B .sum_diff
HAVING
    COUNT(*) >= 3;