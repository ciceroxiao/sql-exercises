/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-6
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询和“01”号的同学学习的课程完全相同的其他同学的学号和姓名
 2. 案例：
 3. 公式：
 4. 实现：
 4.1 先找到“01”号学习的课程；
 4.2 如何判断某人学习的课程和“01”号学习的课程完全相同？
 4.2.1 学习课程的数量要相同；
 4.2.2 学习课程的名称要相同；
 4.2.3 要排除“01”号自身。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    t1.sid,
    sname
FROM
    (
        SELECT
            sc.sid,
            COUNT(DISTINCT sc.cid)
        FROM
            (
                SELECT
                    cid
                FROM
                    sc
                WHERE
                    sid = '01'
            ) t1 #选出01的同学所学的课程
            LEFT JOIN sc ON t1.cid = sc.cid
        GROUP BY
            sc.sid
        HAVING
            COUNT(DISTINCT sc.cid) = (
                SELECT
                    COUNT(DISTINCT cid)
                FROM
                    sc
                WHERE
                    sid = '01'
            )
    ) t1
    LEFT JOIN student ON t1.sid = student.sid
WHERE
    t1.sid != '01';