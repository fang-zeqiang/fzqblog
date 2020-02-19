---
title: "SQL学习笔记"
date: 2019-12-19T16:31:45+08:00
lastmod: 2019-12-19T16:31:45+08:00
draft: false
keywords: []
description: ""
tags: ["SQL"]
categories: ["学术笔记"]
author: ""
---

<!--more-->

## DML

SELECT
UPDATE
DELETE
INSERT INTO

## DDL

CREATE DATABASE
ALTER DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE
CREATE INDEX
DROP INDEX

## DISTINCT

```sql
SELECT Company FROM Orders
```

| Company |
| ------ |
| a |
| b |
| a |

```sql
SELECT DISTINCT Company FROM Orders
```

| Company |
| ------ |
| a |
| b |

## WHERE

| 操作符 |
| ------ |
| <>	不等于 |
| BETWEEN	在某个范围内 |
| LIKE	搜索某种模式 |

- Tip: SQL 使用单引号来环绕文本值（大部分数据库系统也接受双引号

## ORDER BY

```sql
SELECT * FROM Orders ORDER BY Company
```

先按Company字母顺序优先，遇到字母相同的再按数字优先！

```sql
SELECT * FROM Orders ORDER BY Company,OrderNumber
```

降序

```sql
SELECT * FROM Orders ORDER BY Company DESC
```

升序降序

```sql
SELECT * FROM Orders ORDER BY Compant DESC, OrderNumber ASC
```

## INSERT INTO 

注意这里Persons表里列名Address和City不用加引号

```sql
INSERT INTO Persons (Address,City) VALUES ('XXX','XXX')
```

## UPDATE

```sql
UPDATE Persons SET Address='xxx' WHERE City='xxx'
```

## DELETE 

用于删除**行**

```sql
DELETE FROM Persons WHERE City='XXX'
```

## TOP

```sql
SELECT *
FROM Persons
LIMIT 5
```