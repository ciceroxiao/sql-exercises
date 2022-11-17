/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d2b7e2a305a7499fb310dc82a43820e8?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：day030_03 的“变种”：总积分最高的人不仅仅不止一个，而且在增加积分的同时，还存在减分。
 2. 案例：见题目。
 3. 公式：
 4. 实现：
 4.1 首先，将 grade_info.grade_num 按照 grade_info.type 转化为正负数；
 4.2 其次，使用 GROUP BY grade_info.user_id 对数据分组、使用 SUM(grade_num) 计算总积分；
 4.3 再其次，使用 DENSE_RANK() 排序；
 4.4 找到 DENSE_RANK() = 1 的grade_info.user_id；
 4.5 联结表 user，找到对应的 user.name；
 4.6 使用 ORDER BY user_id ASC 排序数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    b.user_id,
    C .name,
    b.grade_sum
FROM
    (
        SELECT
            user_id,
            SUM(grade_num_dealed) AS grade_sum,
            DENSE_RANK() over(
                ORDER BY
                    SUM(grade_num_dealed) DESC
            ) AS total_rank
        FROM
            (
                SELECT
                    user_id,
                    (
                        CASE
                            WHEN TYPE = "add" THEN grade_num
                            ELSE grade_num * (-1)
                        END
                    ) AS grade_num_dealed
                FROM
                    grade_info
            ) AS A
        GROUP BY
            user_id
    ) AS b
    LEFT JOIN USER AS C ON b.user_id = C .id
WHERE
    total_rank = 1;