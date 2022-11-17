/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/ads-performance/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        一家公司正在进行广告投放，每天都会投放一些广告，每个广告都有一个唯一的 ID，每个广告都有一个唯一的用户 ID。
        现在，这家公司想了解每个广告的表现。广告的表现由 Click-Through-Rate（CTR）给出：
        CTR = 0, if Ad total clicks + Ad total views = 0;
        CTR = (Ad total clicks) / (Ad total clicks + Ad total views) * 100, otherwise.
        编写 SQL 语句，计算出每个广告的 CTR。
        CTR 保留两位小数，四舍五入。
        结果按照 CTR 降序、ad_id 升序排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接按照 ad_id 分组求值即可。
 */
USE sql_daily_exercises;

SELECT
    ad_id,
    round(
        ifnull(
            SUM(action = 'Clicked') /(SUM(action = 'Clicked') + SUM(action = 'Viewed')) * 100,
            0
        ),
        2
    ) ctr
FROM
    Ads
GROUP BY
    ad_id
ORDER BY
    ctr DESC,
    ad_id;