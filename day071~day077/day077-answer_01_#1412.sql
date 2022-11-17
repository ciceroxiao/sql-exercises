/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-quiet-students-in-all-exams/
 创建者：Cicero
 创建日期：2021-11-27
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 成绩处于中游的学生是指至少参加过一次测试，且得分既非最高也非最低的学生。
 编写 SQL 查询，找到所有这样的学生的 student_id 和 student_name。
 查询结果以 student_id 升序排列。
 注意：不要反悔没有参加过测试的学生。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先使用窗口函数 rank() 得到每个学生各科的成绩排名：正序排名和逆序排名；
 4.2. 排除数据：只要有一个学生的成绩排名为 1，则排除这个学生的数据。
 4.2.1 再使用 group by student_id 分组；
 4.2.2 再使用 having 筛选出每个学生各科的成绩排名中没有最高成绩和最低成绩的学生；
 4.3. 连表查询学生的 student_id 和 student_name；
 4.4. 将结果按照 student_id 升序排列。 
 */
USE sql_daily_exercises;

-- rank() 函数：
SELECT
    exam_id,
    student_id,
    score,
    rank() over (
        PARTITION BY exam_id
        ORDER BY
            score DESC
    ) AS rank_desc,
    rank() over (
        PARTITION BY exam_id
        ORDER BY
            score ASC
    ) AS rank_asc
FROM
    Exam;

-- 筛选数据
SELECT
    exam_id,
    student_id,
    score,
    rank_asc,
    rank_desc
FROM
    (
        SELECT
            exam_id,
            student_id,
            score,
            rank() over (
                PARTITION BY exam_id
                ORDER BY
                    score DESC
            ) AS rank_desc,
            rank() over (
                PARTITION BY exam_id
                ORDER BY
                    score ASC
            ) AS rank_asc
        FROM
            Exam
    ) AS A
GROUP BY
    student_id
HAVING
    MIN(rank_asc) <> 1
    AND MIN(rank_desc) <> 1;

-- 连表查询 student_id 和 student_name
SELECT
    b.student_id,
    C .student_name
FROM
    (
        SELECT
            exam_id,
            student_id,
            score,
            rank_asc,
            rank_desc
        FROM
            (
                SELECT
                    exam_id,
                    student_id,
                    score,
                    rank() over (
                        PARTITION BY exam_id
                        ORDER BY
                            score DESC
                    ) AS rank_desc,
                    rank() over (
                        PARTITION BY exam_id
                        ORDER BY
                            score ASC
                    ) AS rank_asc
                FROM
                    Exam
            ) AS A
        GROUP BY
            student_id
        HAVING
            MIN(rank_asc) <> 1
            AND MIN(rank_desc) <> 1
    ) AS b
    LEFT JOIN Student C ON b.student_id = C .student_id
ORDER BY
    b.student_id;