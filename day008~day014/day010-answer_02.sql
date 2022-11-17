/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：
创建者：Cicero
创建日期：2021-9-14
修改日期：

Cicero 的解题思路：
1. 使用窗口函数 dense_rank() 对字段 salary 排名；
2. 再以字段 emp_no 升序排序，即可得到目标数据。
*/
SELECT
    emp_no,
    salary,
    t_rank
FROM
    (SELECT
        emp_no,
        salary,
        DENSE_RANK() OVER w AS "t_rank"
    FROM
        salaries
    WINDOW w AS (ORDER BY
                    salary DESC)) AS a
ORDER BY
    t_rank ASC,
    emp_no ASC
;