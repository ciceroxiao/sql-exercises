/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/ea0c56cd700344b590182aad03cc61b8?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-28
 修改日期：
 
 Cicero 的解题思路：
 1. 审题，明确需求：找到每天新用户的留存率。
 2. 案例：
    2.1 2020-10-12 有三个新用户 A、B 和 C。倘若在 2020-10-13，A 和 B 登录过，而 C 未登录。
    2.2 那么，2020-10-12 的用户留存率为 (A, B)/(A, B, C) = 2 / 3 = 0.667 。
 3. 公式：后一天用户中、属于前一天的新用户的数量 / 前一天的新用户数量 。
 4. 实现：
    4.1 先找到每一天的新用户数量；
    4.2 再找后一天用户中、属于前一天的新用户的数量；
    4.3 其次，将没有留存率的日期找出来，并将这些日期的留存率设为 0.000；
    4.4 最后，以 date 升序排序。
    
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 找到每一天的新增用户
SELECT
    MIN(DATE) AS DATE,
    user_id
FROM
    login
GROUP BY
    user_id;

-- 以日期分类，找到每一天新用户数量。再联结 login，找到有新用户留存的日期及其新用户留存率。
SELECT
    DATE,
    round(COUNT(b.user_id) / COUNT(A .user_id), 3) AS frequency
FROM
    (
        SELECT
            MIN(DATE),
            user_id
        FROM
            login
        GROUP BY
            user_id
    ) AS A
    LEFT JOIN login AS b ON A .user_id = b.user_id
    AND b.date = date_add(A .date, INTERVAL 1 DAY)
GROUP BY
    A .date;

-- 没有新用户留存的日期，其留存率设置为 0.000
SELECT
    DATE,
    0.000 AS frequency
FROM
    login
WHERE
    DATE NOT IN (
        SELECT
            MIN(DATE) AS DATE
        FROM
            login
        GROUP BY
            user_id
    )
GROUP BY
    DATE;

-- 最后，使用 UNION，联合两次查询的结果，以 date 升序排序
SELECT
    A .date,
    round(COUNT(b.user_id) / COUNT(A .user_id), 3) AS frequency
FROM
    (
        SELECT
            MIN(DATE) AS DATE,
            user_id
        FROM
            login
        GROUP BY
            user_id
    ) AS A
    LEFT JOIN login AS b ON A .user_id = b.user_id
    AND b.date = date_add(A .date, INTERVAL 1 DAY)
GROUP BY
    A .date
UNION
SELECT
    DATE,
    0.000 AS frequency
FROM
    login
WHERE
    DATE NOT IN (
        SELECT
            MIN(DATE) AS DATE
        FROM
            login
        GROUP BY
            user_id
    )
GROUP BY
    DATE
ORDER BY
    DATE ASC;