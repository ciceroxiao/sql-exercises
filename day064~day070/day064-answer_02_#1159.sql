/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/market-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-14
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句，查询每位用户按日期升序卖出的第二件商品的品牌，其是否是他们自己喜爱的品牌。
 如果某位用户卖出的商品数量不足 2 件，则其对应的结果是“no”。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先用窗口函数，以时间升序，找到每位用户卖出的第二件商品；
 4.2 再连表，查看每位用户卖出的第二件商品的品牌是否是他们自己喜爱的品牌。
 */
USE sql_daily_exercises;

-- 先用窗口函数，以时间升序，找到每位用户卖出的第二件商品；
SELECT
    A .item_id,
    b.seller_id,
    A .item_brand
FROM
    Items AS A
    LEFT JOIN (
        SELECT
            order_id,
            order_date,
            item_id,
            buyer_id,
            seller_id,
            row_number() over (
                PARTITION BY seller_id
                ORDER BY
                    order_date
            ) AS item_rank
        FROM
            orders
    ) AS b ON A .item_id = b.item_id
WHERE
    b.item_rank = 2;

-- 再连表，查看每位用户卖出的第二件商品的品牌是否是他们自己喜爱的品牌。
SELECT
    C .user_id,
    (
        CASE
            WHEN C .favorite_brand = d.item_brand THEN 'yes'
            ELSE 'no'
        END
    ) AS 2nd_item_fav_brand
FROM
    Users AS C
    LEFT JOIN (
        SELECT
            A .item_id,
            b.seller_id,
            A .item_brand
        FROM
            Items AS A
            LEFT JOIN (
                SELECT
                    order_id,
                    order_date,
                    item_id,
                    buyer_id,
                    seller_id,
                    row_number() over (
                        PARTITION BY seller_id
                        ORDER BY
                            order_date
                    ) AS item_rank
                FROM
                    orders
            ) AS b ON A .item_id = b.item_id
        WHERE
            b.item_rank = 2
    ) AS d ON C .user_id = d.seller_id;