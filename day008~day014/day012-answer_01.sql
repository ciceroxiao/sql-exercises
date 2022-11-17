/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/a158fa6e79274ac497832697b4b83658?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-16
修改日期：

Cicero 的解题思路：
使用join查询方式找出没有分类的电影id以及名称
1. 如果电影有分类，则 film_id 一定有对应的 category_id；
2. 如果电影没有分类，则 film_id 对应的 category_id 为 NULL；
3. 因此，联结表 film 和表 film_category，再使用 WHERE 条件限定语句，找出没有分类的电影 id 以及名称。
*/

SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a.film_id,
    a.title
FROM
    film AS a
        LEFT JOIN
    film_category AS b ON a.film_id = b.film_id
WHERE
    b.category_id IS NULL;
