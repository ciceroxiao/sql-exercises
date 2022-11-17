### 在 MySQL 中，不要使用 utf8，而是使用 **utf8mb4**

原文链接：https://adamhooper.medium.com/in-mysql-never-use-utf8-use-utf8mb4-11761243e434

原因：MySQL 中的「utf8」是一种「专属编码」，只能存储 3 个字节；而 utf8mb4 能存储 4 个字节，这才是真正的「utf8」。


### 在 MySQL 中，如何清空命令行界面？

在 Linux 中：mysql> "system clear";

在 Win 中：mysql> "s"ystem cls";


### 在 MySQL 中，如何查看命令执行时间？

首先，在命令行界面输入："set profiling=1;"；
其次，**输入某个命令后**，再输入："show profiles;"，即可查看命令的执行时间。


### 解决 SQL 需求的步骤

2021-9-27：解决 SQL 需求的步骤和编写 Python 程序的步骤是一样的。

Step1：确定需求，即确定任务所需的数据；

Step2：尝试描述数据的结果，看自己理解的需求是否就是任务的需求；

Step3：经过 Step1 和 Step1 后，就书写公式，搞明白如何得到所需的数据；

Step4：用代码实现公式；

Step5：运行代码，看是否能得到目标数据；

Step6：优化代码，看是否能够更快地得到目标数据；同时，保存公式和代码，以备下次需要。