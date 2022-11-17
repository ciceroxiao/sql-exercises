/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/2f2e556d335d469f96b91b212c4c203e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-16
 修改日期：
 
 Cicero 的解题思路：
 你能使用子查询的方式找出属于Action分类的所有电影对应的title,description吗
 1. 联结表 category 和表 film_category，先找到 category.name 为 Action 对应的 film_category.film_id；
 2. 再联结表 film_category 和表 film，找到 1. 中 film_category.film_id 所对应的 film.title 和 film.description。
 */
SHOW DATABASES;

USE sql_daily_exercises;

/*
 -- 多表联结查询
 SELECT
    c.title,
    c.description
 FROM
    category AS a
        INNER JOIN
    film_category AS b ON a.category_id = b.category_id
        INNEr JOIN
    film AS c ON b.film_id = c.film_id
 WHERE
    a.name = "Action";
 */



-- 使用子查询
-- 1. 先找到 category.name 为 Action 的 category.category_id；
-- 2. 再找到 film_category.category_id 等于 1. 所得的 category.category_id 对应的 film_category.film_id；
-- 3. 最后，找到 2. 所得的 film_category.film_id 对应的 film.title 和 film.description。
SELECT
    film.title,
    film.description
FROM
    film
WHERE
    film.film_id IN (
        SELECT
            film_category.film_id
        FROM
            film_category
        WHERE
            film_category.category_id IN (
                SELECT
                    category.category_id
                FROM
                    category
                WHERE
                    category.name = "Action"
            )
    );