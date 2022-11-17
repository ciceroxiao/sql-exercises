/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：
创建者：Cicero
创建日期：
修改日期：

Cicero 的解题思路：
1. 观察表 employees 和表 salaries，发现两表的共同字段为 emp_no;
2. 联结表 employees 和表 salaries 得到新表，新表中的字段包括：emp_no、first_name、last_name 和 salary；
3. 第一层子查询：找到新表中的最高薪水值；
4. 第二层子查询：再从新表中找到除最高薪水值以外的最大薪水（即薪水次高）值；
5. 第三层查询：找到薪水值等于薪水第二多的员工信息。
*/

SELECT
    a3.emp_no,
    b3.salary,
    a3.first_name,
    a3.last_name
FROM
    employees AS a3
        LEFT JOIN
    salaries AS b3 ON a3.emp_no = b3.emp_no
WHERE
    b3.salary = (SELECT
                    MAX(b1.salary)
                FROM
                    employees AS a1
                        LEFT JOIN
                    salaries AS b1 ON a1.emp_no = b1.emp_no
                WHERE
                    b1.salary < (SELECT
                                    MAX(b2.salary)
                                FROM
                                    employees AS a2
                                        LEFT JOIN
                                    salaries AS b2 ON a2.emp_no = b2.emp_no));
