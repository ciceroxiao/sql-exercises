/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/165d88474d434597bcd2af8bf72b24f1?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询中位数。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 本题的关键是找中位数。
 4.2 在本题中，可利用此法找中位数（参考牛客网网友@SunburstRun的解法）：
 数据排序后，如果某数的正序下标和逆序下标均大于等于数据数量的一半，那么，次数即为中位数。
 4.3 按照以上思路，先找到各分数的正序和逆序排序；
 4.4 再找到相关数据即可。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    grade
FROM
    (
        SELECT
            grade,
            (
                SELECT
                    SUM(NUMBER)
                FROM
                    class_grade
            ) AS total,
            SUM(NUMBER) over(
                ORDER BY
                    grade ASC
            ) AS asc_rank,
            SUM(NUMBER) over(
                ORDER BY
                    grade DESC
            ) AS desc_rank
        FROM
            class_grade
    ) AS A
WHERE
    asc_rank >= (total / 2)
    AND desc_rank >= (total / 2)
ORDER BY
    grade;