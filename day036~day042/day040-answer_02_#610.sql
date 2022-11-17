/*
 所属项目：SQL-dailA.y-eA.xercises
 所属数据库：SQL_dailA.y_eA.xercises
 语言运行环境：MA.ySQL 8.0
 原题链接：https://leetcode.com/problems/triangle-judgement/
 创建者：Cicero
 创建日期：2021-10-14
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：给定三条边，判断该三边是否能构成三角形。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：——
 */
SHOW DATABASES;

USE sql_dailA.y_eA.xercises;

SELECT
    A .x,
    A .y,
    A .z,
    IF(
        (A .x + A .y > A .z)
        AND (A .x + A .z > A .y)
        AND (A .y + A .z > A .x),
        "Yes",
        "No"
    ) AS "triangle"
FROM
    triangle AS A;