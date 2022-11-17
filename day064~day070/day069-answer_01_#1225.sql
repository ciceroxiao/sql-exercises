/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/report-contiguous-dates/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 系统每天运行一个任务。每个任务都独立于先前的任务。任务的状态可以是失败或是成功。
 编写一个 SQL 查询 2019-01-01 到 2019-12-31 期间任务连续同状态 period_state 的起止日期（start_date 和 end_date）。
 即如果任务失败了，就是失败状态的起止日期；如果任务成功了，就是状态的起止日期。
 最后结果按照起始日期 start_date 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：这是 gaps and island 的变种。
 4.1. 编辑数据：先连表，将两张表连接成一张表；
 4.2. 筛选数据：选择 2019-01-01 到 2019-12-31 之间的数据；
 4.3. 生成数据：利用窗口函数 rank() 和 state_date 之间的差值构建日期区间；
 4.4. 输出数据：选择每个日期区间的最小日期和最大日期；
 */
USE sql_daily_exercises;

-- 编辑数据：先连表，将两张表连接成一张表；
SELECT
    fail_date AS state_date,
    "failed" AS state
FROM
    Failed
UNION
SELECT
    success_date AS state_date,
    "succeeded" AS state
FROM
    Succeeded;

-- 筛选数据：选择 2019-01-01 到 2019-12-31 之间的数据；
-- 生成数据：利用窗口函数 rank() 和 state_date 之间的差值构建日期区间；
SELECT
    A .state_date,
    A .state,
    subdate(
        A .state_date,
        INTERVAL rank() over(
            PARTITION BY A .state
            ORDER BY
                A .state_date
        ) DAY
    ) AS date_diff
FROM
    (
        SELECT
            fail_date AS state_date,
            "failed" AS state
        FROM
            Failed
        UNION
        SELECT
            success_date AS state_date,
            "succeeded" AS state
        FROM
            Succeeded
    ) AS A
WHERE
    A .state_date BETWEEN '2019-01-01'
    AND '2019-12-31';

-- 输出数据：选择每个日期区间的最小日期和最大日期；
SELECT
    b.state AS period_state,
    MIN(b.state_date) AS start_date,
    MAX(b.state_date) AS end_date
FROM
    (
        SELECT
            A .state_date,
            A .state,
            subdate(
                A .state_date,
                INTERVAL rank() over(
                    PARTITION BY A .state
                    ORDER BY
                        A .state_date
                ) DAY
            ) AS date_diff
        FROM
            (
                SELECT
                    fail_date AS state_date,
                    "failed" AS state
                FROM
                    Failed
                UNION
                SELECT
                    success_date AS state_date,
                    "succeeded" AS state
                FROM
                    Succeeded
            ) AS A
        WHERE
            A .state_date BETWEEN '2019-01-01'
            AND '2019-12-31'
    ) AS b
GROUP BY
    b.state,
    b.date_diff
ORDER BY
    start_date;