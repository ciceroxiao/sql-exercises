/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-users-with-valid-e-mails/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一条 SQL 语句，查询拥有有效邮箱的用户。
 有效的邮箱包含符合下列条件的前缀名和域名：
 - 前缀名（必须以字母开头）：
 - 字母（大写或小写）
 - 数字 0-9
 - 下划线 _
 - 点号 (不能作为第一个字符)
 - 反斜杠 /
 - 横杠 -
 - 域名：
 - @leetcode.com
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用正则即可。
 */
USE sql_daily_exercises;

SELECT
    user_id,
    name,
    mail
FROM
    Users
WHERE
    regexp_like(
        mail,
        "^[a-zA-Z]+[- | a-z0-9A-Z . _]*@leetcode.com"
    );