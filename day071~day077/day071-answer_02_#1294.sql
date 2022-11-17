/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/weather-type-in-each-country/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查询每个国家在 2019 年 11 月份的天气状况。
 如果某国的 weather_state 平均值小于或等于 15，则该国的天气状况为 Cold；
 如果某国的 weather_state 平均值大于或等于 25，则该国的天气状况为 Hot；
 否则，该国的天气状况为 Warm。
 以任意顺序返回每个国家的天气状况。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 筛选数据：先找到 2019 年 11 月份的数据。
 4.2. 处理数据：再分组、求平均值。
 4.3. 输出数据：连表，输出每个国家的名称和天气状况。
 */
USE sql_daily_exercises;

-- 筛选数据
SELECT
    A .country_name,
    (
        CASE
            WHEN (SUM(b.weather_state) / COUNT(b.day)) <= 15 THEN "Cold"
            WHEN (SUM(b.weather_state) / COUNT(b.day)) >= 25 THEN "Hot"
            ELSE "Warm"
        END
    ) AS weather_type
FROM
    countries AS A
    JOIN weather AS b ON A .country_id = b.country_id
WHERE
    b.day BETWEEN '2019-11-01'
    AND '2019-11-30'
GROUP BY
    A .country_id;