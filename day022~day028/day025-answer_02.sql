/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/b83f8b0e7e934d95a56c24f047260d91?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-29
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找出每个岗位分数排名前两名的用户信息。
 2. 案例：岗位 Python 的用户：A-1000、B-1200、C-900，那么，目标数据为 B-1200、A-1000。
 3. 公式：None.
 4. 实现：
    4.1 先使用窗口函数对数据排序；
    4.2 而后再从排序过的数据中选取需要的数据；
    4.3 其次，联结新表和表 language，得到各个语言岗位的 name；
    4.4 最后，按照要求对结果排序。
 备注：
    此题复杂度不够。比如说，假设某科目中最高分数不止一个，那么，排名取哪种排名？
    因此，此处使用窗口函数 DENSE_RANK()。
    如果排名依据改变的话，那么只需改变窗口函数即可实现对应需求。
 */
SHOW DATABASES;

USE sql_daily_exercises;

/*
第一种方法：
    先找到各个科目中的分数最高者的信息，再找到各个科目中的分数次高者的信息。
    而后，再使用 UNION 联结两次查询的结果。
    最后，再按照题目需求排序。
    PS：不推荐使用此种方法。经本人测试，此方法过于繁琐且耗费脑力。
-- 先找到各科目的最高分数
SELECT
    language_id,
    MAX(score) AS max_score
FROM
    grade
GROUP BY
    language_id;

-- 再找到各科目中最高分数的拥有者
SELECT
    a1.id,
    a1.language_id,
    a1.score
FROM
    grade AS a1
    LEFT JOIN (
        SELECT
            language_id,
            MAX(score) AS max_score
        FROM
            grade
        GROUP BY
            language_id
    ) AS b1 ON a1.language_id = b1.language_id
WHERE
    a1.score = b1.max_score;

-- 再找到各科目中的次高分数
SELECT
    a2.language_id,
    MAX(a2.score) AS second_score
FROM
    grade AS a2
    LEFT JOIN (
        SELECT
            language_id,
            MAX(score) AS max_score
        FROM
            grade
        GROUP BY
            language_id
    ) AS b2 ON a2.language_id = b2.language_id
WHERE
    a2.score != b2.max_score
GROUP BY
    language_id;

-- 再找到各科目中次高分数拥有的信息
SELECT
    a3.id,
    a3.language_id,
    a3.score
FROM
    grade AS a3
    LEFT JOIN (
        SELECT
            a2.language_id,
            MAX(a2.score) AS second_score
        FROM
            grade AS a2
            LEFT JOIN (
                SELECT
                    language_id,
                    MAX(score) AS max_score
                FROM
                    grade
                GROUP BY
                    language_id
            ) AS b2 ON a2.language_id = b2.language_id
        WHERE
            a2.score != b2.max_score
        GROUP BY
            language_id
    ) AS b3 ON a3.language_id = b3.language_id
WHERE
    a3.score = b3.second_score;
*/

/* 
第二种方法：
    1. 先使用窗口函数对数据排序；
    2. 而后再从排序过的数据中选取需要的数据；
    3. 其次，联结新表和表 language，得到各个语言岗位的 name；
    4. 最后，按照要求对结果排序。
*/
SELECT
    A .id,
    b.name,
    A .score
FROM
    (
        SELECT
            id,
            language_id,
            score,
            dense_rank() over(
                PARTITION BY language_id
                ORDER BY
                    score DESC
            ) AS score_rank
        FROM
            grade
    ) AS A
    LEFT JOIN
    LANGUAGE AS b on A .language_id = b.id
WHERE
    A .score_rank <= 2
ORDER BY
    b.name ASC,
    A .score DESC,
    A .id ASC;