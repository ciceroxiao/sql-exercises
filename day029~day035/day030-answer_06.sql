/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/048ed413ac0e4cf4a774b906fc87e0e7?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：“查询向user_id = 1 的用户，推荐其关注的人喜欢的音乐。"
 条件： 
 1.1 不要推荐该用户已经喜欢的音乐
 1.2 按music的id升序排列
 1.3 返回的结果中不应当包含重复项
 2. 案例：见题目
 3. 公式：——
 4. 实现：
 4.1 先找到 user_id = 1 的用户所关注的人；
 4.2 再找到其所关注的人喜欢的音乐；
 4.3 
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- a. 先找到 user_id = 1 所关注的人喜欢的音乐
-- b. 其次，找到 user_id = 1 所喜欢的音乐
-- 从 a. 所得数据中删去 b. 所得数据
SELECT
    DISTINCT(music_name)
FROM
    follow AS A
    LEFT JOIN music_likes AS b ON A .follower_id = b.user_id
    LEFT JOIN music AS C ON b.music_id = C .id
WHERE
    A .user_id = 1
    AND music_name NOT IN (
        SELECT
            DISTINCT(music_name)
        FROM
            follow AS A
            LEFT JOIN music_likes AS b ON A .user_id = b.user_id
            LEFT JOIN music AS C ON b.music_id = C .id
        WHERE
            A .user_id = 1
    )
ORDER BY
    b.music_id;