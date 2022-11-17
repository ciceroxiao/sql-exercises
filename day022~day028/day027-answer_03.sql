/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/348afda488554ceb922efd2f3effc427?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-1
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：在 day027-answer_02 的基础上，再输入对应用户第二次成功购买课程的日期。
 2. 案例：见原题，
 3. 公式：核心公式：MAX(IF(CONDITION, A, B))
 4. 实现：
 4.1 先得到对应数据的 user_id、date、rank() as date_rank；
 4.2 再以 user_id 为分组依据，使用 GROUP BY 对新数据分组；
 4.3 使用 IF 来筛选 date_rank 分别为 1、2 的数据；
 4.4 使用 MAX() 来忽略 date_rank 中的 NULL；
 4.5 使用 COUNT(1) 来计数；
 4.6 最后，使用 ORDER BY user_id ASC 来升序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先得到对应数据的 user_id、date、rank() as date_rank
SELECT
    user_id,
    DATE,
    rank() over(
        PARTITION BY user_id
        ORDER BY
            DATE ASC
    ) AS date_rank
FROM
    order_info
WHERE
    DATE > '2025-10-15'
    AND status = 'completed'
    AND product_name IN ('C++', 'Java', 'Python');

-- 再以 user_id 为分组依据，使用 GROUP BY 对新数据分组
-- 使用 IF 来筛选 date_rank 分别为 1、2 的数据
-- 使用 MAX() 来忽略 date_rank 中的 NULL
-- 使用 COUNT(1) 来计数
SELECT
    user_id,
    MAX(IF(date_rank = 1, DATE, NULL)) AS first_buy_date,
    MAX(IF(date_rank = 2, DATE, NULL)) AS second_buy_date,
    COUNT(1) AS cnt
FROM
    (
        SELECT
            user_id,
            DATE,
            rank() over(
                PARTITION BY user_id
                ORDER BY
                    DATE ASC
            ) AS date_rank
        FROM
            order_info
        WHERE
            DATE > '2025-10-15'
            AND status = 'completed'
            AND product_name IN ('C++', 'Java', 'Python')
    ) AS A
GROUP BY
    user_id
ORDER BY
    user_id ASC;