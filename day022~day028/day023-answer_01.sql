/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/7cc3c814329546e89e71bb45c805c9ad?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-27
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查找每个用户的最近登录信息，其包括用户姓名、设备信息、最近登录日期。
 并且，查询结果按照 user.name 升序排序。
 2. 先找到每个用户的最近登录日期和姓名；
 3. 其次，找到最近登录日期对应的 client_id；
 4. 再其次，找到 client_id 所对应的设备名称 client.name；
 5. 最后，将查询得到的结果以 user.name  升序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    d.name,
    C .name,
    DATE
FROM
    login AS A
    LEFT JOIN (
        SELECT
            DISTINCT(user_id),
            FIRST_VALUE(DATE) over(
                ORDER BY
                    DATE DESC
            ) AS last_login
        FROM
            login
    ) AS b ON A .user_id = b.user_id
    LEFT JOIN client AS C ON A .client_id = C .id
    LEFT JOIN USER AS d ON A .user_id = d.id
WHERE
    A .date = b.last_login;