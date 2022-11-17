/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/8d2c290cc4e24403b98ca82ce45d04db?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-12
修改日期：2021-9-13

Cicero 的解题思路：
原始思路：
1. 找到薪水最多的数据，即 MAX(salary)；
2. 找到薪水小于 MAX(salary) 的数据，并在此数据中找到最大值的数据。
3. 在 2. 中找到的数据，即为目标数据。

改善思路：
1. 找到薪水最多的数据，即 MAX(salary)；
2. 找到薪水小于 MAX(salary) 的数据，并在此数据中找到最大值的数据。
3. 再找到薪水排第二的薪水值；
4. 最后找到薪水等于薪水排第二的数值。
改善结果：可找到多个薪水排第二的员工信息。
*/

SELECT
    emp_no,
    salary
FROM
    salaries
WHERE
    salary = (SELECT
                MAX(salary)
              FROM
                salaries
              WHERE
                salary < (SELECT
                            MAX(salary)
                          FROM
                            salaries))
;
