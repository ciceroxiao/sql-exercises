/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/hopper-company-queries-i/
 创建者：Cicero
 创建日期：2021-12-6
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 查询以报告 2020 年每个月的以下统计信息：
 - 截至某月底，当前在Hopper公司工作的驾驶员数量（active_drivers）。
 - 该月接受的乘车次数（accepted_rides）。 
 结果以 month 升序排列，其中 month 是月份的数字（一月是 1，二月是 2，以此类推）。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 实现 active_drivers：Drivers 表中 date <= current_year_month;
 4.2. 实现 accepted_rides：Rides 表中 date = current_year_month;
 */
USE sql_daily_exercises;

-- 构建字段 month
WITH recursive month_rec AS (
    SELECT
        1 AS MONTH
    UNION
    SELECT
        MONTH + 1
    FROM
        month_rec
    WHERE
        MONTH < 12
),
-- 构建 current_year_month
current_year_month AS (
    SELECT
        MONTH,
        date_format(
            DATE_ADD('2019-12-01', INTERVAL MONTH MONTH),
            "%Y-%m"
        ) ym
    FROM
        month_rec
)
-- 查询数据
SELECT
    MONTH,
    COUNT(DISTINCT Drivers.driver_id) active_drivers,
    COUNT(DISTINCT AcceptedRides.ride_id) accepted_rides
FROM
    current_year_month
    LEFT JOIN Rides ON ym = DATE_FORMAT(requested_at, '%Y-%m')
    LEFT JOIN Drivers ON ym >= DATE_FORMAT(join_date, '%Y-%m')
    LEFT JOIN AcceptedRides USING(ride_id)
GROUP BY
    MONTH;
