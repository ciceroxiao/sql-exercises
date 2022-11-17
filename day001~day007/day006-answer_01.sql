/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/ae51e6d057c94f6d891735a48d1c2397?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-10
修改日期：

Cicero 的解题思路：
思路 A：
1. 依照题意，使用 GROUP BY 来获取薪水 salary 的情况；
2. 使用 ORDER BY xx DESC 来逆序排序。

思路 B：
1. 使用 DISTINCT 去重；
2. 使用 ORDER BY xx DESC 来逆序排序，得到目标数据。
*/

/* 思路 A 的实现：
SELECT
    a.salary
FROM
    salaries AS a
GROUP BY a.salary
ORDER BY a.salary DESC;
*/

-- 思路B
SELECT
    DISTINCT a.salary
FROM
    salaries AS a
ORDER BY a.salary DESC;
