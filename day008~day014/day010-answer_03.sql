/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/8fe212a6c71b42de9c15c56ce354bebe?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-14
修改日期：

Cicero 的解题思路：
1. 联结表 dept_manager 和表 dept_emp，获取各个 dept_no 的 emp_no;
2. 根据 1. 所得的 emp_no，从 salaries 中获取非 manager 员工的薪水情况。
*/

SELECT
    b.dept_no,
    b.emp_no,
    c.salary
FROM
    dept_manager AS a
        RIGHT JOIN
    dept_emp AS b ON a.dept_no = b.dept_no
        LEFT JOIN
    salaries AS c ON b.emp_no = c.emp_no
WHERE a.emp_no != b.emp_no;
