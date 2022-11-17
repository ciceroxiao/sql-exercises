/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f257dfc1b55e42e19eec004aa3cb4174?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-4
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：“查找购买个数超过20,质量小于50的商品，按照商品id升序排序”
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到购买个数 sum(trans.count) > 20 的商品 trans.good_id；
 4.2 其次，联结表 goods，找到 goods.weight < 50 的商品；
 4.3 最后，查询结果以 goods.id 升序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    b.id,
    b.name,
    b.weight,
    A .total
FROM
    (
        SELECT
            goods_id,
            SUM(COUNT) AS total
        FROM
            trans
        GROUP BY
            goods_id
        HAVING
            SUM(COUNT) > 20
    ) AS A
    LEFT JOIN goods AS b ON A .goods_id = b.id
WHERE
    b.weight < 50
ORDER BY
    b.id ASC;