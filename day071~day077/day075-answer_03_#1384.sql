/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/total-sales-amount-by-year/
 创建者：Cicero
 创建日期：2021-11-25
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        编写一段 SQL 查询，展示每个产品每年的销售总额，其他包括 product_id、product_name、report_year 和 total_amout。具体参看题目示例。
        销售日期介于 2018 年到 2020 年之间。
        返回的结果按照 product_id 和 report_year 排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 依次找到 2018 年、2019 年 和 2020 年各产品的销售总额，再连表即可。
      每一年都有四种情况，比如说 2018 年：
        - period_start < 2018 and period_end = 2018: days = period_end - "2018-01-01"
        - period_start = 2018 and period_end = 2018: days = period_end - period_start + 1
        - period_start < 2018 and period_end > 2018: days = "2019-01-01" - "2018-01-01"
        - period_start = 2018 and period_end > 2018: days = "2019-01-01" - period_start
    按照上面四种情况，依次得到每一年的销售总额，再联结数据即可。
 */


USE sql_daily_exercises;

-- 2018 年
select
    a1.product_id,
    b1.product_name,
    '2018' as report_year,
    (case
        when year(a1.period_start) < 2018 and year(a1.period_end) = 2018 then average_daily_sales * datediff(a1.period_end, '2018-01-01')
        when year(a1.period_start) = 2018 and year(a1.period_end) = 2018 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2018 and year(a1.period_end) > 2018 then average_daily_sales * datediff('2019-01-01', '2018-01-01')
        when year(a1.period_start) = 2018 and year(a1.period_end) > 2018 then average_daily_sales * datediff('2019-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0; -- 去除销售额为 null 的情况

-- 2019 年
select
    a1.product_id,
    b1.product_name,
    '2019' as report_year,
    (case
        when year(a1.period_start) < 2019 and year(a1.period_end) = 2019 then average_daily_sales * datediff(a1.period_end, '2019-01-01')
        when year(a1.period_start) = 2019 and year(a1.period_end) = 2019 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2019 and year(a1.period_end) > 2019 then average_daily_sales * datediff('2020-01-01', '2019-01-01')
        when year(a1.period_start) = 2019 and year(a1.period_end) > 2019 then average_daily_sales * datediff('2020-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0; -- 去除销售额为 null 的情况

-- 2020 年
select
    a1.product_id,
    b1.product_name,
    '2020' as report_year,
    (case
        when year(a1.period_start) < 2020 and year(a1.period_end) = 2020 then average_daily_sales * (datediff(a1.period_end, '2020-01-01') + 1)
        when year(a1.period_start) = 2020 and year(a1.period_end) = 2020 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2020 and year(a1.period_end) > 2020 then average_daily_sales * datediff('2021-01-01', '2020-01-01')
        when year(a1.period_start) = 2020 and year(a1.period_end) > 2020 then average_daily_sales * datediff('2021-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0; -- 去除销售额为 null 的情况

-- 联合数据
(
    select
    a1.product_id,
    b1.product_name,
    '2018' as report_year,
    (case
        when year(a1.period_start) < 2018 and year(a1.period_end) = 2018 then average_daily_sales * datediff(a1.period_end, '2018-01-01')
        when year(a1.period_start) = 2018 and year(a1.period_end) = 2018 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2018 and year(a1.period_end) > 2018 then average_daily_sales * datediff('2019-01-01', '2018-01-01')
        when year(a1.period_start) = 2018 and year(a1.period_end) > 2018 then average_daily_sales * datediff('2019-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0
)
union
(
    select
    a1.product_id,
    b1.product_name,
    '2019' as report_year,
    (case
        when year(a1.period_start) < 2019 and year(a1.period_end) = 2019 then average_daily_sales * datediff(a1.period_end, '2019-01-01')
        when year(a1.period_start) = 2019 and year(a1.period_end) = 2019 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2019 and year(a1.period_end) > 2019 then average_daily_sales * datediff('2020-01-01', '2019-01-01')
        when year(a1.period_start) = 2019 and year(a1.period_end) > 2019 then average_daily_sales * datediff('2020-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0
)
union
(
    select
    a1.product_id,
    b1.product_name,
    '2020' as report_year,
    (case
        when year(a1.period_start) < 2020 and year(a1.period_end) = 2020 then average_daily_sales * (datediff(a1.period_end, '2020-01-01') + 1)
        when year(a1.period_start) = 2020 and year(a1.period_end) = 2020 then average_daily_sales * (datediff(a1.period_end, a1.period_start) + 1)
        when year(a1.period_start) < 2020 and year(a1.period_end) > 2020 then average_daily_sales * datediff('2021-01-01', '2020-01-01')
        when year(a1.period_start) = 2020 and year(a1.period_end) > 2020 then average_daily_sales * datediff('2021-01-01', a1.period_start)
        end) as total_amout
from
    Sales as a1
    left join Product as b1 on a1.product_id = b1.product_id
having
    total_amout > 0
)
order by
    product_id,
    report_year;