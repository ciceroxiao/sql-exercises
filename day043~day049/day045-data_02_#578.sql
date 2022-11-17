/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/get-highest-answer-rate-question/
 创建者：Cicero
 创建日期：2021-10-19
 修改日期：
 */
USE sql_daily_exercises;

DROP TABLE IF EXISTS survey_log;

CREATE TABLE IF NOT EXISTS survey_log (
    UID INT,
    action VARCHAR(255),
    question_id INT,
    answer_id INT,
    q_num INT,
    TIMESTAMP INT
);

Truncate TABLE survey_log;

INSERT INTO
    survey_log (
        UID,
        action,
        question_id,
        answer_id,
        q_num,
        TIMESTAMP
    )
VALUES
    ('5', 'show', '285', NULL, '1', '123');

INSERT INTO
    survey_log (
        UID,
        action,
        question_id,
        answer_id,
        q_num,
        TIMESTAMP
    )
VALUES
    ('5', 'answer', '285', '124124', '1', '124');

INSERT INTO
    survey_log (
        UID,
        action,
        question_id,
        answer_id,
        q_num,
        TIMESTAMP
    )
VALUES
    ('5', 'show', '369', NULL, '2', '125');

INSERT INTO
    survey_log (
        UID,
        action,
        question_id,
        answer_id,
        q_num,
        TIMESTAMP
    )
VALUES
    ('5', 'skip', '369', NULL, '2', '126');