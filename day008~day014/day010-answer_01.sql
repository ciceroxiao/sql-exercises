/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/6a62b6c0a7324350a6d9959fa7c21db3?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-14
修改日期：

Cicero 的解题思路：
1. 联结表 departments 和表 dept_emp,查询各个部门的员工 emp_no；
2. 再联结表 dept_emp 和表 salaries，查询各个员工拥有的工资条数；
3. 最后使用 GROUP BY、以字段 dept_no 分组查询 count(salary) 即可得到目标数据。
*/

SELECT
    a.dept_no,
    a.dept_name,
    COUNT(c.salary) as "sum"
FROM
    departments AS a
        LEFT JOIN
    dept_emp AS b ON a.dept_no = b.dept_no
        LEFT JOIN
    salaries AS c ON b.emp_no = c.emp_no
GROUP BY
    a.dept_no;