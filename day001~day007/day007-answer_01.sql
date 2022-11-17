/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/4a052e3e1df5435880d4353eb18a91c6?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-11
修改日期：

Cicero 的解题思路：
思路 A：
1. 观察表 dept_emp 和表 salaries，发现两表的共同字段为 emp_no；
2. 以字段 emp_no 联结表 dept_emp 和表 salaries 来得到临时新表。
   临时新表中包括的字段：emp_no、dept_no 和 salary；
3. 其次以字段 dept_no 为结果集、使用 GROUP BY 聚合临时新表；
4. 再使用 HAVING 来筛选目标数据；
5. 按照部门编号 dept_no 升序排列。
备注：思路 A 错误。比如说，一个部门有多人同时领着最高薪水，则无法显示。
（Cicero 在原始数据后面加了一项测试数据，发现思路 A 无法同时显示多个拥有最高薪水的员工信息）

思路 B：
1. 以思路 A 为基础，先找到各个部门中最高薪水：
1.1 以字段 emp_no 联结表 dept_emp 和表 salaries 来得到临时新表 c；
1.2 临时新表中包括的字段：emp_no 和 maxSalary。
2. 联结表 dept_emp 、表 salaries 和表 c，找到对应部门中、对应最高薪水的员工信息；
3. 按照部门编号 dept_no 升序排列
备注：思路 B 错误。比如说，部门 2 与部门 1 有相同的最高工资，则无法显示部门 2 的最高工资。
改善：在 1. 中，使用 GROUP BY 和 MAX 来得到各个部门中最高薪水，以解决上面提到错误。
*/

/* 思路 A 的实现：
SELECT
    a.dept_no,
    a.emp_no,
    b.salary AS "maxSalary"
FROM
    dept_emp AS a
        INNER JOIN
    salaries AS b ON a.emp_no = b.emp_no
GROUP BY a.dept_no
HAVING b.salary = MAX(b.salary)
ORDEY BY a.dept_no ASC;
*/

-- 思路 B 的实现：
/* 思路 B 未改善前：
SELECT 
    a1.dept_no,
    a1.emp_no,
    b1.salary
FROM
    dept_emp AS a1,
    salaries AS b1,
    (SELECT
        a2.dept_no,
        b2.salary AS "maxSalary"
    FROM
        dept_emp AS a2
            INNER JOIN
        salaries AS b2 ON a2.emp_no = b2.emp_no
    GROUP BY 
        a2.dept_no) AS c
WHERE
    b1.salary = c.maxSalary
        AND
    a1.dept_no = c.dept_no
        AND
    a1.emp_no = b1.emp_no
ORDER BY a1.dept_no ASC;
*/

-- 思路 B 改善后：

SELECT 
    a1.dept_no,
    a1.emp_no,
    b1.salary
FROM
    dept_emp AS a1,
    salaries AS b1,
    (SELECT
        a2.dept_no,
        MAX(b2.salary) AS "maxSalary" -- 此处使用 MAX() 来改善思路 B
    FROM
        dept_emp AS a2
            INNER JOIN
        salaries AS b2 ON a2.emp_no = b2.emp_no
    GROUP BY 
        a2.dept_no) AS c
WHERE
    b1.salary = c.maxSalary
        AND
    a1.dept_no = c.dept_no
        AND
    a1.emp_no = b1.emp_no
ORDER BY a1.dept_no ASC;