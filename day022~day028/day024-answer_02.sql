/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/572a027e52804c058e1f8b0c5e8a65b4?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-28
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到每个用户随日期而逐渐累计的答题数量。
 2. 案例：在 2020-10-12，user_A 答题数量为 4，则累计答题数量为 4；2020-10-13，use_A 答题数量为 5，则累计答题数量为 9。以此类推。
 3. 公式：SUM(cumulative over a set of passing_number.number)
 4. 实现：
 4.1 先找到每个用户，每天刷了多少道题，以 user_id、date升序排序
 4.2 其次，找到每个 user_id 对应的 name
 4.3 调整各字段的顺序，使得各字段按要求格式输出
 4.4 使用窗口函数，得到各个用户在各个日期的累计答题数
 备注：牛客网的题目描述有错:
 “第4行表示user_id为4的用户在2020-10-13通过了2个题目”
 应该是
 “第4行表示user_id为3的用户在2020-10-13通过了2个题目”
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先找到每个用户，每天刷了多少道题，以 user_id、date升序排序
-- 其次，找到每个 user_id 对应的 name
-- 调整各字段的顺序，使得各字段按要求格式输出
-- 使用窗口函数，得到各个用户在各个日期的累计答题数
SELECT
    C .name AS u_n,
    A .date,
    SUM(NUMBER) over(
        PARTITION BY A .user_id
        ORDER BY
            A .date ASC
    ) AS ps_num
FROM
    login AS A
    LEFT JOIN passing_number AS b ON A .user_id = b.user_id
    AND A .date = b.date
    LEFT JOIN USER AS C ON A .user_id = C .id
WHERE
    b.number IS NOT NULL
ORDER BY
    A .date,
    A .user_id;