/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/fc7344ece7294b9e98401826b94c6ea5?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-13
修改日期：

Cicero 的解题思路：
1. 此题中，两名员工的工资均只有一次变动；
2. 找到两名员工工资变动前的工资情况，即两名员工入职时的工资情况；
3. 其后，再找到两名员工工资变动后的工资数据；
4. 将两名员工工资变动前后的 salary 值相减，即得到 salary 的变动情况。

扩展：
    如果某人工资有多次（大于一次）变动情况，那么该如何查询变动情况呢？
*/

SELECT
    b2.emp_no,
    (b2.salary - c.salary) as "growth"
FROM
    salaries AS b2
        LEFT JOIN
    (SELECT
        b1.emp_no,
        b1.from_date,
        b1.to_date,
        b1.salary
    FROM
        employees AS a
            LEFT JOIN
        salaries AS b1 ON a.emp_no = b1.emp_no
    WHERE
        a.hire_date = b1.from_date) AS c ON b2.emp_no = c.emp_no
WHERE
    b2.from_date = c.to_date
        AND
    (b2.salary - c.salary) != 0;

-- 网络上其他回答者的思路（多表联结）：
SELECT
    a1.emp_no,
    (a1.salary - a2.salary) as "growth"
FROM
    salaries AS a1
        LEFT JOIN
    employees as b ON a1.emp_no = b.emp_no
        LEFT JOIN
    salaries AS a2 ON b.emp_no = a2.emp_no
                        AND
                      b.hire_date = a2.from_date
WHERE
    (a1.salary - a2.salary) != 0
ORDER BY
    (a1.salary - a2.salary) DESC;
