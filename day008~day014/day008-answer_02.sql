/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/c8652e9e5a354b879e2a244200f1eaae?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-12
修改日期：

Cicero 的解题思路：
1. 观察表 titles 和表 salaries，发现两表的共同字段为 emp_no；
2. 联结表 titles 和表 salaries 得到指定字段：title、avg(salary)；
3. 使用 GROUP BY 得到指定数据，并以 avg(salary) 升序排序。
*/

SELECT
    a.title,
    avg(b.salary) AS "avg(s.salary)"
FROM
    titles AS a
        LEFT JOIN
    salaries AS b ON a.emp_no = b.emp_no
GROUP BY
    a.title
ORDER BY
    avg(b.salary);
