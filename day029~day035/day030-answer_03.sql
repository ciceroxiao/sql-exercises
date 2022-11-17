/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/b6248d075d2d4213948b2e768080dc92?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：此题是 day030_02 的“变种”：积分增加最高的用户可能不止一个。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到各个用户增加的总积分；
 4.2 再使用 DENSE_RANK 对用户增加的总积分逆序排序；
 4.3 找到排序为 1 的用户 grade_info.user_id；
 4.4 然后，联结表 user，得到对应的 user.name；
 4.5 最后，按照 ORDER BY user_id ASC 排序数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    user_id,
    NAME,
    grade_sum
FROM
    (
        SELECT
            user_id,
            SUM(grade_num) AS grade_sum,
            DENSE_RANK() over(
                ORDER BY
                    SUM(grade_num) DESC
            ) AS total_rank
        FROM
            grade_info
        GROUP BY
            user_id
    ) AS A
    LEFT JOIN USER AS b ON A .user_id = b.id
WHERE
    A .total_rank = 1
ORDER BY
    user_id ASC;