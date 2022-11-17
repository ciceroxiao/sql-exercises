/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/active-users/
 创建者：Cicero
 创建日期：2021-11-28
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 查询，找出活跃用户的 id 和 name。
 活跃用户是指那些至少连续 5 天登录账户的用户。
 返回的结果按照 id 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 此题的核心是找到连续数据，也是 island-gaps 的变种。
 4.2. 第一种方法：
 4.2.1. 利用 date_sub() 和 dense_rank() 找到连续区间。
 此处之所以用 dense_rank() 是因为用户可能同一天会登录多次，而我们只需要知道用户某天登录过即可；
 4.2.2. 使用 count() 找到至少连续 5 天登录的用户数量；
 4.2.3. 结果按照 id 升序排列；
 4.3. 第二种方法：
 4.3.1. 利用 lead()、if() 和 datediff() 找到连续区间；
 4.3.2. 使用 count() 找到至少连续 5 天登录的用户数量；
 4.3.3. 结果按照 id 升序排列；
 */
USE sql_daily_exercises;

-- 第一种方法：
-- 利用 date_sub() 和 dense_rank() 找到连续区间
SELECT
    id,
    login_date,
    date_sub(
        login_date,
        INTERVAL dense_rank() over(
            PARTITION BY id
            ORDER BY
                login_date
        ) DAY
    ) AS date_rank
FROM
    Logins
GROUP BY
    -- 每天只保留一次登录记录
    id,
    login_date;

-- 使用 count() 找到至少连续 5 天登录的用户数量
-- 结果按照 id 升序排列
SELECT
    A .id,
    b.name
FROM
    (
        SELECT
            id,
            login_date,
            date_sub(
                login_date,
                INTERVAL dense_rank() over(
                    PARTITION BY id
                    ORDER BY
                        login_date
                ) DAY
            ) AS date_rank
        FROM
            Logins
        GROUP BY
            -- 每天只保留一次登录记录
            id,
            login_date
    ) AS A
    LEFT JOIN Accounts AS b ON A .id = b.id
GROUP BY
    A .id,
    A .date_rank
HAVING
    COUNT(A .date_rank) >= 5
ORDER BY
    A .id;

-- 第二种方法：
-- 使用 lead() 和 if() 找到连续区间
SELECT
    id,
    login_date,
    IF(
        datediff(
            lead(login_date) over(
                PARTITION BY id
                ORDER BY
                    login_date
            ),
            login_date
        ) = 1,
        0,
        1
    ) AS is_active
FROM
    Logins
GROUP BY
    -- 每天只保留一次登录记录
    id,
    login_date;

-- 使用 count() 找到至少连续 5 天登录的用户数量
-- 结果按照 id 升序排列
SELECT
    A .id,
    b.name
FROM
    (
        SELECT
            id,
            login_date,
            IF(
                datediff(
                    lead(login_date) over(
                        PARTITION BY id
                        ORDER BY
                            login_date
                    ),
                    login_date
                ) = 1,
                0,
                1
            ) AS is_active
        FROM
            Logins
        GROUP BY
            -- 每天只保留一次登录记录
            id,
            login_date
    ) AS A
    LEFT JOIN Accounts AS b ON A .id = b.id
GROUP BY
    id
HAVING
    COUNT(is_active = 0) >= 4;