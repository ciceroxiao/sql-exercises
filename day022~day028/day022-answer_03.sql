/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/ca274ebe6eac40ab9c33ced3f2223bb2?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-26
 修改日期：
 
 Cicero 的解题思路：
 1. 明确需求：找到每个用户最近的登陆日子，其结果以 user_id 升序排序；
 2. 相关字段：user_id、date；
 3. 使用 GROUP BY 以 user_id 依据对数据进行分类；
 4. 同时，使用 MAX(date) 找到每位用户的最近登录日期即可得到目标数据。
 
 网友的思路：
 1. 使用窗口函数 FIRST_VALUE 找到对应的数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .user_id,
    MAX(A .date) AS d
FROM
    login AS A
GROUP BY
    user_id
ORDER BY
    user_id;

-- 网友的思路
SELECT
    DISTINCT user_id,
    FIRST_VALUE(DATE) over(
        PARTITION BY user_id
        ORDER BY
            DATE DESC
    ) AS "d"
FROM
    login;