/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/
 创建者：Cicero
 创建日期：2021-11-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 为每张发票 invoice_id 编写 SQL 查询，以查找以下内容：
 - customer_name：与发票相关的客户名称；
 - price：发票的价格；
 - contacts_cnt：该顾客的联系人数量；
 - trusted_contacts_cnt：可信联系人的数量（既是该顾客的联系人又是商店顾客的联系人数量，即“可信联系人的电子邮件存在于客户表中”）。
 查询结果以 invoice_id 顺序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 连表查询 customer_name 和 price;
 4.2. 连表查询 count(distinct Contact.contact_id) as contacts_cnt;
 4.3. 连表查询和子查询 trusted_contacts_cnt;
 4.4. 按照 invoice_id 顺序排列结果。
 */
USE sql_daily_exercises;

SELECT
    A .invoice_id,
    b.customer_name,
    A .price,
    COUNT(DISTINCT C .contact_name) AS contacts_cnt,
    ifnull(
        SUM(
            C .contact_email IN (
                SELECT
                    email
                FROM
                    Customers
            )
        ),
        0
    ) AS trusted_contacts_cnt
FROM
    Invoices AS A
    LEFT JOIN Customers AS b ON A .user_id = b.customer_id
    LEFT JOIN Contacts AS C ON A .user_id = C .user_id
GROUP BY
    A .invoice_id;