/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f41b94b4efce4b76b27dd36433abe398?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-28
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：得到各个岗位分数的平均数，结果保留三位小数。并且，结果以岗位分数的平均数来降序排序。
 2. 案例：-
 3. 公式：round(avg(grade.score), 3)
 4. 实现：
 4.1 使用 GROUP BY 以字段 grade.job 分组；
 4.2 使用 round(avg(grade.score), 3) 计算各个岗位分数的平均数，结果保留三位小数。
 4.3 最终结果，以各个岗位分数的平均数降序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    job,
    round(AVG(score), 3) AS avg_score
FROM
    grade
GROUP BY
    job
ORDER BY
    AVG(score) DESC;