/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/dbfafafb2ee2482aa390645abd4463bf?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-9
修改日期：

Cicero 的解题思路：
1. 观察员工表 employees 和部门表 dept_emp，发现两个表的共同数据列为 emp_no；
2. 使用 left join 联结 employees 和 dept_emp，得到目标数据。
*/

SELECT
    a.last_name,
    a.first_name,
    b.dept_no
FROM
    employees AS a
        LEFT JOIN
    dept_emp AS b ON a.emp_no = b.emp_no;
