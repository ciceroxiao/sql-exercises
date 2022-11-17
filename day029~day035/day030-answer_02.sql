/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/1bfe3870034e4efeb4b4aa6711316c3b?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：“查找积分增加最高的用户的名字，以及他的总积分是多少(此题数据保证积分最高的用户有且只有1个)”。
 即找到积分增加最高的用户名字及其总积分。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到各用户增加的总积分；
 4.2 其次，选取增加的总积分最高的那位（此题中只有一位最高）；
 4.3 最后联结表 user，得到 user.name。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    name,
    SUM(grade_num) AS grade_sum
FROM
    grade_info AS A
    LEFT JOIN USER AS b ON A .user_id = b.id
GROUP BY
    user_id
LIMIT
    1;