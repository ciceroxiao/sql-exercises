/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/count-student-number-in-departments/
 创建者：Cicero
 创建日期：2021-10-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到各个公寓中的学生数量。如果公寓没有学生，则学生数量为 0。结果以各个公寓的学生数量降序排序；如果有公寓的学生数量是相同的，则以公寓名称升序排序。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先连接表 department 和表 student，找到各个公寓对应的学生；
 4.2 再使用 GROUP BY 分组，COUNT(student_id) 找到各个公寓的学生数量；
 4.3 最后，按照各公寓的学生数量、公寓名称排序。
 */
USE sql_daily_exercises;

SELECT
    A .dept_name,
    COUNT(B.student_id) AS student_number
FROM
    department AS A
    LEFT JOIN student AS B ON A .dept_id = B.dept_id
GROUP BY
    A .dept_id
order BY
    student_number desc,
    A .dept_name;