/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/3a303a39cc40489b99a7e1867e6507c5?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-15
 修改日期：
 
 Cicero 的解题思路：
 查找描述信息(film.description)中包含robot的电影对应的分类名称(category.name)
 以及电影数目(count(film.film_id))，
 而且还需要该分类包含电影总数量(count(film_category.category_id))>=5部
 
 题目要求两种数据：
 A. film.description 中包含“robot”的电影所对应的 category.name 和 电影数目；
 A.1 film.description 中包含“robot”的电影所对应的 category.name；
 A.2 film.description 中包含“robot”的电影所对应的电影数目
 B.film.description 中包含“robot”的电影所对应的 category.name 所包含的电影总数量 >=5 部。
 
 1. 首先在表 film.description 中查找包含 robot 的电影名称和电影 id，并统计含有 robot 的电影数量；
 2. 联结表 film 和表 film_category，得到目标电影的 category_id，并统计在各个分类下的电影数量；
 3. 再联结表 category，得到 category_id 对应的 name。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- B
/*
 SELECT
 c.name
 FROM
 film AS a
 LEFT JOIN
 film_category AS b ON a.film_id = b.film_id
 LEFT JOIN
 category AS c ON b.category_id = c.category_id
 GROUP BY
 c.name
 HAVING
 COUNT(c.name) >= 5;
 */
-- A
SELECT
    c.name,
    COUNT(a.title) as "film_numbers"
FROM
    film AS a
    LEFT JOIN film_category AS b ON a.film_id = b.film_id
    LEFT JOIN category AS c ON b.category_id = c.category_id
    LEFT JOIN (
        SELECT
            c.name
        FROM
            film AS a
            LEFT JOIN film_category AS b ON a.film_id = b.film_id
            LEFT JOIN category AS c ON b.category_id = c.category_id
        GROUP BY
            c.name
        HAVING
            COUNT(c.name) >= 5
    ) AS d ON c.name = d.name
WHERE
    a.description LIKE "%robot%"
GROUP BY
    c.name;