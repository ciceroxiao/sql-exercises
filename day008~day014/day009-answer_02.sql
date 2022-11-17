/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/5a7975fabe1146329cee4f670c27ad55?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-13
修改日期：

Cicero 的解题思路：
1. 
*/

SELECT
    a.last_name,
    a.first_name,
    c.dept_name
FROM
    employees AS a
        LEFT JOIN
    dept_emp AS b1 ON a.emp_no = b1.emp_no
        LEFT JOIN
    departments AS c ON b1.dept_no = c.dept_no;
