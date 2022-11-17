/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/6d4a4cff1d58495182f536c548fee1ae?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-9
修改日期：

Cicero 的解题思路：
1. 首先使用 GRUOP BY 函数分组，以 emp_no 为分组依据；
2. 其次使用 COUNT() 函数来统计各个组别的数量；
3. 使用 HAVING 选出组别数量大于 15 的 emp_no
*/

SELECT
    a.emp_no,
    COUNT(a.emp_no) AS t
FROM
    salaries AS a
GROUP BY
    a.emp_no
HAVING
    COUNT(a.emp_no) > 15;
