/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/c63c5b54d86e4c6d880e4834bfd70c3b?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-7
修改日期：

Cicero 的解题思路：
1. 观察薪水表 salaries 和部门领导表 dept_manager，发现两个表的共同数据为 emp_no;
2. 使用 INNER JOIN，从 薪水表 salaries 中找到对应的数据；
3. 以 salaries.emp_no 排序目标数据。
*/

SELECT
    a.emp_no,
    a.salary,
    a.FROM_date,
    a.to_date,
    b.dept_no
FROM
    salaries AS a
        INNER JOIN
    dept_manager AS b ON a.emp_no = b.emp_no
ORDER BY a.emp_no;
