---
title: "基于文本挖掘分析谷歌招聘信息"
date: 2019-11-20T10:53:54+08:00
draft: false
tags: ["Data Mining"]
categories: ["技术栈","数据可视化"] 
shortcodes: true
---
结合Python与Echarts的数据挖掘项目
<!--more-->

## 前情提要

本项目代码已公开在Coding平台，[点击链接](https://dev.tencent.com/u/cupcake/p/DataMining-GoogleJob/git)查看源代码，所有python的主要结构都是：

    1. 读取数据
    2. 数据处理
    3. 调用pyecharts包
    4. 生成html图

## 为什么会做这个？

我们（我和奚宇星）先是在网上搜罗有趣的数据集，看到kaggle上有人爬取了2018年谷歌在全球招聘的信息，里面包含了职位，类别，职责，最低条件和优先资格，这引起了笔者的注意。因为笔者正处周围同学都在找工作的氛围中（南财即将就业的大四学子），许多同学为了科技大厂不断的刷题，改简历去追求与自己较为对口的岗位，这让我产生一个想法：能不能用数据分析的方法提高自己进入某个企业的概率；故我们找到这个数据集，虽然不是最新的数据，但不失为一个模拟锻炼的机会。


## Dataset

共有1250像这样的数据，由于是英文，无需像中文那样进行复杂的分词工作，这就给我们文本挖掘带来很大的便利，不过要提前注意在词频统计阶段要剔除对数据分析无用的单词词，比如人称主语，停用词，数字。

## 聚类分析

这是我们这次数据挖掘的重点

我们希望挖掘工作类别之间的关系，用人工理解工作类别的方式，对职责中的高频词汇，取有效值进行人工分类，各取五个，先粗略的分为市场营销，管理决策，技术类；先对各个类别进行词频统计，跳过无关项。

```python
rt={'管理决策':['manage','strategy','solution','management','lead'],
    '技术':['develop','technical','cloud','client','build'],
    '市场营销':['product','business','customer','sale','marketing']}    
for i in rt.keys():
    tmp[i]=sum(map(lambda s:getCounts(s,freq),rt[i]))/len(t)
tmp['n']=category
```

对每个类别进行类似打分的操作，让三个维度的数值维持在0~10之间，方便平衡三个尺度在一个合理的范围内进行聚类分析

```python
for i in scores:
    cs[i['n']][0]+=1
    cs[i['n']][1]+=i['管理决策']
    cs[i['n']][2]+=i['技术']
    cs[i['n']][3]+=i['市场营销']
```

最后调用Python的sklearn包直接实现聚类，先设置类簇为3，再设置随机种子为9，使得每一次相同条件的聚类结果相同，不过目前暂时不需要调整kmeans的参数来优化模型，kmeans的聚类结果足够我们找出一些规律。

```python
from sklearn.cluster import KMeans
for k,v in cs.items():
kmeans=KMeans(n_clusters=3, random_state=9)
res=kmeans.fit_predict(datasets)
```

- 我们发现偏重技术与市场营销的岗位如Technical Solution技术解决方案，销售运营Sales Operations，销售与会计管理Sales&Account Management，这些岗位联系较大，申请人在投递对应岗位的时候可以参考这些联系较为紧密的招聘信息，对自己的简历和面试做好相应准备，比如第二志愿可以选择相似的职位，而不是仅仅凭借岗位的名字判断。

- 第二个类簇主要是那些对市场营销和技术要求中等的岗位，产品与客户支持Product & Customer Support，用户体验与设计User Experience & Design，营销与交流Marketing & Communications等，在投递该类型岗位的时候就可以一次投递相似的多个岗位，因为从聚类的结果来看这几个岗位在高频词上具有相关性。

- 第三个类簇主要是那些单纯的技术岗位，如软件工程Software Engineering，技术设施维护Technical Infrastructure，网络工程Network Engineering，硬件工程Hardware Engineering，在投递这些岗位的时候应该侧重自身的一些相关的技术特长，可以减少描述一些市场营销与决策管理方面的能力，为你的其它匹配技能与项目经历腾出空间。

* [点击我查看聚类三维图](/html/工作类别聚类.html)


## 其它数据维度

为了找出职位较多的区域，利用Echarts高交互性的特点，我们可以在图表中调节使用左下角的热力柱，找出热点区域，调整到41时发现地图上剩下6个国家，美国、爱尔兰、英国、德国、新加
坡和中国。

- [点击我查看地理热点图](/html/世界地图.html)

我们发现销售&客户管理以及市场营销&沟通是一个这个公司招聘岗位里的大头，约占所有职位的27％。但是，职位招聘最少的岗位是（基于职位发布数）：数据中心与网络、技术写作、IT与数据管理、开发者关系、网络工程，偏重于技术开发，这里就能看出公司经费开销的比重

- [点击我查看类别柱状图](/html/工作类别.html)


- [岗位职责](/html/职责.html)

- [最低条件](/html/最低条件.html)

- [优先条件](/html/优先条件.html)