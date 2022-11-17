/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/ec1ca44c62c14ceb990c3c40def1ec6c?tpId=82&&tqId=29754&rp=1&ru=/ta/sql&qru=/ta/sql/question-ranking
创建者：Cicero
创建日期：2021-9-6
修改日期：

Cicero 的解题思路：
1. 以 hire_date 去重；
2. 以 hire_date 升序排序；
3. 得到 hire_date 排第三的 a（倒数第三即正数第三）；
4. 得到 hire_date 为 a 的入职员工的信息。
*/

-- 此段代码实现 1.、2. 和 3. 步骤
/*
SELECT DISTINCT hire_date
FROM employees
ORDER BY hire_date
LIMIT 1 offset 2;
*/

-- 此段代码实现 4.
SELECT
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
FROM
    employees AS a
WHERE 
    hire_date = (SELECT
                    DISTINCT hire_date
                 FROM
                    employees AS b
                 ORDER BY hire_date
                 LIMIT 1 OFFSET 2);