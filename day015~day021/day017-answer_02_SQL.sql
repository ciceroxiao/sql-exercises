/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/aeaa116185f24f209ca4fa40e226de48?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-21
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 参考链接：https://dev.mysql.com/doc/refman/8.0/en/create-table-foreign-keys.html
ALTER TABLE
    audit
ADD
    FOREIGN KEY(EMP_no) REFERENCES employees_test(id);