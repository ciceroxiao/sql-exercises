/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/e50d92b8673a440ebdf3a517b5b37d62?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-10
修改日期：

Cicero 的解题思路：
1. 首先找到各员工对应的部门；
2. 其次找到各部门对应的领导；
3. 再找到各个部门的领导所对应的号码；
4. 如果部门领导的号码等于员工的号码，则不显示该员工的信息。
*/

SELECT
    a.emp_no,
    b.emp_no AS "manager"
FROM
    dept_emp AS a
        LEFT JOIN
    dept_manager AS b ON a.dept_no = b.dept_no
WHERE
    a.emp_no != b.emp_no;
