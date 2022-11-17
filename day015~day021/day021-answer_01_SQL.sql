/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/e3cf1171f6cc426bac85fd4ffa786594?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-25
 1. 先使用窗口函数 ROW_NUMBER() 对原表排序，以生成的结果作为新表 b；
 2，其次，再从新表 b 中输出 first_name 排名为奇数的数据。
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    b.first_name
FROM
    (
        SELECT
            first_name,
            ROW_NUMBER() over (
                ORDER BY
                    first_name ASC
            ) AS "rank"
        FROM
            employees
    ) AS b
WHERE
    b.rank % 2 = 1;
