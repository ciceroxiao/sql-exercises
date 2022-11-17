/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/4bcb6a7d3e39423291d2f7bdbbff87f8?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-15
修改日期：

Cicero 的解题思路：
汇总各个部门当前员工的title类型的分配数目，
即结果给出部门编号dept_no、dept_name、
其部门下所有的员工的title以及该类型title对应的数目count，
结果按照dept_no升序排序
1. 找到各个部门下的员工：联结表 departments 和表 dept_emp，得到各个部门下的员工数量
2. 根据员工 emp_no，找到各个员工的 title；
3. 
*/

SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a.dept_no,
    b.dept_name,
    c.title,
    COUNT(c.title) AS "count"
FROM
    dept_emp AS a
        LEFT JOIN
    departments AS b ON a.dept_no = b.dept_no
        LEFT JOIN
    titles AS c ON a.emp_no = c.emp_no
GROUP BY
    a.dept_no,
    c.title
ORDER BY
    a.dept_no ASC;
