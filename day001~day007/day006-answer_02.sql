/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/32c53d06443346f4a2f2ca733c19660c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-10
修改日期：

Cicero 的解题思路：
思路 A:
1. 观察表 employees 和表 dept_manager，发现两表的共同数据为 emp_no；
2. 使用子查询，从表 dept_manager 得到 emp_no 数据；
3. 使用 WHERE 找到仅在表 employees 中存在的 emp_no 数据。此数据即为目标数据。

思路 B:
1. 观察表 employees 和表 dept_manager，发现两表的共同数据为 emp_no；
2. 使用子查询，从表 dept_manager 得到 emp_no 数据；
3. 使用 LEFT JOIN 联结表 employees 和表 dept_manager；
4. 使用 WHERE 查询不存在表 dept_manager 中的数据。
*/

/* 思路 A 的实现：
SELECT
    a.emp_no
FROM
    employees AS a
WHERE a.emp_no not in (SELECT
                            b.emp_no
                        FROM
                            dept_manager AS b);
*/

-- 思路 B 的实现：
SELECT
    a.emp_no
FROM
    employees AS a
        LEFT JOIN
    dept_manager AS b ON a.emp_no = b.emp_no
WHERE
    b.emp_no IS NULL;
