/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/exchange-seats/
 创建者：Cicero
 创建日期：2021-10-14
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：寻找得票数最多的人。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先统计得票数；
 4.2 再找到得票数最多的候选人 CandidateId：获胜者只有 1 个；
 4.3 再连接表 Candidate，找到候选人对应的名字。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先统计得票数
-- 再找到得票数最多的候选人 CandidateId：获胜者只有 1 个
-- 再连接表 Candidate，找到候选人对应的名字
SELECT
    A .Name
FROM
    Candidate AS A
    INNER JOIN (
        SELECT
            C.CandidateId,
            COUNT(C.CandidateId) AS vote_fre
        FROM
            Vote AS C
        GROUP BY
            C.CandidateId
        ORDER BY
            vote_fre DESC
        LIMIT
            1
    ) AS B ON A .id = B.CandidateId;