/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/reformat-department-table/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：将表格重新格式化为指定格式。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接使用 CASE WHEN 或 IF 函数即可。

 PS：为了便于理解，此题没有一键美化 SQL 语句，因此 SQL 的关键词都是小写。
 */

USE sql_daily_exercises;

-- IF
select
    id,
    sum(if(month='Jan', revenue, null)) as Jan_Revenue,
    sum(if(month='Feb', revenue, null)) as Feb_Revenue,
    sum(if(month='Mar', revenue, null)) as Mar_Revenue,
    sum(if(month='Apr', revenue, null)) as Apr_Revenue,
    sum(if(month='May', revenue, null)) as May_Revenue,
    sum(if(month='Jun', revenue, null)) as Jun_Revenue,
    sum(if(month='Jul', revenue, null)) as Jul_Revenue,
    sum(if(month='Aug', revenue, null)) as Aug_Revenue,
    sum(if(month='Sep', revenue, null)) as Sep_Revenue,
    sum(if(month='Oct', revenue, null)) as Oct_Revenue,
    sum(if(month='Nov', revenue, null)) as Nov_Revenue,
    sum(if(month='Dec', revenue, null)) as Dec_Revenue
from
    Department
group by
    id
order by
    id;

-- CASE WHEN：相对 IF 函数，执行效率更高。
select id, 
	sum(case when month = 'jan' then revenue else null end) as Jan_Revenue,
	sum(case when month = 'feb' then revenue else null end) as Feb_Revenue,
	sum(case when month = 'mar' then revenue else null end) as Mar_Revenue,
	sum(case when month = 'apr' then revenue else null end) as Apr_Revenue,
	sum(case when month = 'may' then revenue else null end) as May_Revenue,
	sum(case when month = 'jun' then revenue else null end) as Jun_Revenue,
	sum(case when month = 'jul' then revenue else null end) as Jul_Revenue,
	sum(case when month = 'aug' then revenue else null end) as Aug_Revenue,
	sum(case when month = 'sep' then revenue else null end) as Sep_Revenue,
	sum(case when month = 'oct' then revenue else null end) as Oct_Revenue,
	sum(case when month = 'nov' then revenue else null end) as Nov_Revenue,
	sum(case when month = 'dec' then revenue else null end) as Dec_Revenue
from department
group by id
order by id;