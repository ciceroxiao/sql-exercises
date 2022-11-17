/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/fix-product-name-format/
 创建者：Cicero
 创建日期：2021-12-2
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        写一个 SQL 语句报告每个月的销售情况：
        product_name 是小写字母且不包含前后空格 sale_date 格式为 ('YYYY-MM')，total 是产品在本月销售的次数。
        返回结果以 product_name 升序排列，如果有排名相同，再以 sale_date 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 本题的考点是：trim() 函数、 lower() 函数和 date_format() 函数。
 */


USE sql_daily_exercises;

select
    lower(trim(product_name)) as product_name,
    date_format(sale_date, '%Y-%m') as sale_date,
    count(1) as total
from
    Sales
group by
    lower(trim(product_name)), date_format(sale_date, '%Y-%m')
order by
    product_name, sale_date;