/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/e3870bd5d6744109a902db43c105bd50?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-22
 修改日期：
 
 Cicero 的解题思路：
 1. 参考链接：https://stackoverflow.com/questions/12344795/count-the-number-of-occurrences-of-a-string-in-a-varchar-field/43699586
 2. 使用 CHAR_LENGTH 函数计算原字符串的长度为 A；
 3. 其次用 REPLACE 替代字符串中的目标字符，而后计算替换后的字符串长度为 B；
 4. 再用 CHAR_LENGTH 计算目标字符的长度为 C；
 5. 最后用 (A - B) / C，即可得到目标字符出现的次数。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    ROUND(
        (
            CHAR_LENGTH("10,A,B") - CHAR_LENGTH(
                REPLACE("10,A,B", ",", "")
            ) / CHAR_LENGTH(",")
        )
    ) AS "cnt";