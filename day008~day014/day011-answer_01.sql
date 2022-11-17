/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/f858d74a030e48da8e0f69e21be63bef?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-15
 修改日期：
 
 Cicero 的解题思路：
 1. 获取各个部门的 manager 的 emp_no；
 2. 根据 1. 所获得的 emp_no 来获取各个部门 manager 的 salary，此新表为各个部门 manager 的 salary 表;
 3. 再联结表 salary 和表 dept_emp 得到所有员工的 salary 表；
 4. 最后，从 3. 中去除 2. 中的数据，并以题目规定形式各个员工的 salary。
 */
SHOW DATABASES;

USE sql_daily_exercises;


SELECT
    b1.dept_no,
    b1.emp_no,
    a1.salary as "emp_salary",
    d.salary as "manage_salary"
FROM
    salaries AS a1
        LEFT JOIN
    dept_emp AS b1 ON a1.emp_no = b1.emp_no,
    (SELECT
        c.dept_no,
        b2.emp_no,
        a2.salary
    FROM
        dept_manager AS c
            LEFT JOIN 
        dept_emp AS b2 ON c.dept_no = b2.dept_no
                            AND
                        c.emp_no = b2.emp_no
            LEFT JOIN
        salaries AS a2 ON b2.emp_no = a2.emp_no) AS d
WHERE
    b1.dept_no = d.dept_no
        AND
    a1.salary > d.salary;