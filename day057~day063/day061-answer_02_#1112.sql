/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/highest-grade-for-each-student/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到每个学生的最高分及对应的课程。如果有多个最高分，则只记录 course_id 为最小的那个。结果以 student_id 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 此题有两种解法：
 4.1.1 使用窗口函数：使用 rank() over() 来对每个学生的成绩进行排序，然后查询出每个学生的最高分。
 4.1.2 不使用窗口函数：先找到每个学生的最高峰，然后在连表，找到每个学生的最高分及对应的课程。
 */
USE sql_daily_exercises;

-- 使用窗口函数：使用 rank() over() 来对每个学生的成绩进行排序，然后查询出每个学生的最高分。
SELECT
    student_id,
    course_id,
    grade
FROM
    (
        SELECT
            student_id,
            course_id,
            grade,
            rank() over(
                PARTITION BY student_id
                ORDER BY
                    grade DESC,
                    course_id ASC
            ) AS grade_rank
        FROM
            Enrollments
    ) AS A
WHERE
    grade_rank = 1
ORDER BY
    student_id ASC;

-- 不使用窗口函数：
-- 先找到每个学生的最高分
SELECT
    student_id,
    MAX(grade) AS max_grade
FROM
    Enrollments
GROUP BY
    student_id;

-- 再连表，找到每个学生的最高分及对应的课程
SELECT
    A .student_id,
    MIN(A .course_id),
    A .grade
FROM
    Enrollments AS A
    LEFT JOIN (
        SELECT
            student_id,
            MAX(grade) AS max_grade
        FROM
            Enrollments
        GROUP BY
            student_id
    ) AS b ON A .student_id = b.student_id
WHERE
    A .grade = b.max_grade
GROUP BY
    A .student_id
ORDER BY
    A .student_id;