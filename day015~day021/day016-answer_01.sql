/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/3d92551a6f6d4f1ebde272d20872cf05?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-20
 修改日期：
 
 Cicero 的解题思路：
 1. 观察数据，表 titles_test 中，主键是 id；
 2. 也就是说，即使某些数据的 emp_no 相同，但这些数据的 id 会不同；
 3. 因此，只保留 emp_no 相同、但 id 最小的那行数据；
 4. 使用自联结，得到目标数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;
                      
DELETE a2
FROM
    titles_test AS a1
        LEFT JOIN 
    titles_test AS a2 ON  a1.emp_no = a2.emp_no
                      AND a1.id < a2.id;

SELECT
    id,
    emp_no,
    title,
    from_date,
    to_date
FROM
    titles_test;
