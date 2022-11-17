/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/get-highest-answer-rate-question/
 创建者：Cicero
 创建日期：2021-10-19
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到 the highest answer rate 对应的 question_id；
 2. 案例：——
 3. 公式：the answer rate = count("show") / count("answer")
 4. 实现：
 4.1 以 GROUP BY question_id 分组；
 4.2 统计各题回答总数；
 4.3 统计各题 "answer" 的数量；
 4.4 利用公式得到答案。
 */


USE sql_daily_exercises;

select
    question_id as "survey_log"
from
    survey_log
GROUP by
    question_id
order by
    count(answer_id) / (count(*)/2) desc
LIMIT 1;

-- 因为 Cicero 没有开 LeetCode 会员，因此无法验证答案。
-- 不过，Cicero 猜想，the highest answer rate 多半不止一题。
-- 因此，比较稳妥的方式是：使用窗口函数 DENSE_RANK() 排序，而后选取排列第一的数据。