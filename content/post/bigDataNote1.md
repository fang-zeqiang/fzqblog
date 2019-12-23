---
title: "BigDataNote1"
date: 2019-12-17T21:28:50+08:00
lastmod: 2019-12-17T21:28:50+08:00
draft: false
keywords: ["big data","Hive","Spark"]
description: ""
tags: ["Spark","MapReduce"]
categories: [""]
author: ""

# You can also close(false) or open(true) something for this content.
# P.S. comment can only be closed
comment: true
toc: true
---

今天参加了奇安信的测试，对大数据的行业需求有了一定了解

<!--more-->

### Hbase Cell

- HBase是建立在Hadoop文件系统之上的分布式**面向列**的数据库。
- 开源项目，是横向扩展的。
- HBase是一个数据模型，类似于谷歌的大表设计，可以提供快速随机访问海量结构化数据。
- 它利用了Hadoop的文件系统（HDFS）提供的**容错能力**
- 它是Hadoop的生态系统，提供对数据的**随机实时读/写访问**，是Hadoop文件系统的一部分

| 行式数据库 | 列式数据库 |
| ------ | ------ |
| 它适用于联机事务处理（OLTP） | 它适用于在线分析处理（**OLAP**） |
| 这样的数据库被设计为**小数目**的行和列 | 面向列的数据库设计的**巨大表** |


### YARN

Apache Hadoop YARN （Yet Another Resource Negotiator，另一种资源协调者）是一种新的 Hadoop 资源管理器，它是一个通用资源管理系统，可为上层应用提供统一的资源管理和调度，它的引入为集群在利用率、资源统一管理和数据共享等方面带来了巨大好处。

YARN的基本思想是将JobTracker的两个主要功能（资源管理和作业调度/监控）分离，主要方法是创建一个全局的ResourceManager（RM）和若干个针对应用程序的ApplicationMaster（AM）。

### MapReduce

MapReduce是一种编程模型，用于大规模数据集（大于1TB）的并行运算。

MapReduce是面向大数据并行处理的计算模型、框架和平台，它隐含了以下三层含义：
1. MapReduce是一个基于集群的高性能并行**计算平台**（Cluster Infrastructure）。它允许用市场上普通的商用服务器构成一个包含数十、数百至数千个节点的分布和并行计算集群。
2. MapReduce是一个并行计算与运行**软件框架**（Software Framework）。
3. MapReduce是一个并行程序设计**模型与方法**（Programming Model & Methodology）。

### Block VS Split

1. 一个split不会包含零点几或者几点几个Block，一定是包含大于等于1个整数个Block
2. 一个split不会包含两个File的Block,不会跨越File边界
3. split和Block的关系是一对多的关系
4. maptasks的个数最终决定于splits的长度

- 用户 锁

- Spark HDFS

- HDFS架构组成

- TaskTracker

- 查准率 vs 查全率

- MapReduce 考虑本地性

- SQL语句
  
  Order vs Group
  Where vs Having

- Spark vs MapReduce 性能

- 边，度数，点的数量至少有几个

- OLAP
  
  Green plum
  Oracle
  Hive
  MySQL

- Spark Streaming

- Spark context

- Spark SQL 支持哪些格式数据
  
  text
  json
  csv
  parquet

- 高阶回归过拟合问题
