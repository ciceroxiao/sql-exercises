/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/95078e5e1fba4438b85d9f11240bc591?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-23
 修改日期：
 
 Cicero 的解题思路：
 1.此题有两种解读：
 a. 查找排除（当前员工的）最大、最小salary之后的当前(to_date = '9999-01-01' )员工的平均工资avg_salary。
 b.  查找排除(所有员工的）最大、最小salary之后的当前(to_date = '9999-01-01' )员工的平均工资avg_salary。
 2. 由于没有沟通对象，此处给出 b. 的解法：
 2.1 先找到表中的最大、最小 salary；
 2.2 其次去除表中的最大、最小 salary；
 2.3 使用 WHERE 限定员工类型；
 2.4 求平均工资。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    AVG(salary) AS avg_salary
FROM
    salaries
WHERE
    to_date = '9999-01-01'
    AND salary < (
        SELECT
            MAX(salary)
        FROM
            salaries
    )
    AND salary > (
        SELECT
            MIN(salary)
        FROM
            salaries
    );