---
title: "如何在Hugo静态博客中嵌入echarts图表"
date: 2019-11-15T23:50:41+08:00
draft: false
tags: ["Hugo","Javascripts"]
categories: ["技术栈"]
---

数据可视化嵌入实验

<!--more-->

## 为啥想做这个

想在hugo博客里写一些数据可视化的作品，感觉echarts的可交互性最好，故在网上搜索嵌入方法。看到最好的解决方案是前端大神[Alili](https://alili.tech/archive/r5ibcpo557h/)的一篇博文

---

## 具体实现方法

Hugo静态页面支持一种叫做**Shortcodes**的特性（or功能），是一个可以传参的小模板

---

### 1.创建shortcodes模板文件

在目录 **./themes/even/layouts/shortcodes**下创建文件**echarts.html**，如果没有shortcodes文件夹就自己创建一个。紧接着在echarts.html文件中输入以下代码（具体功能可以自定义）

```javascript
    <div id="echarts{{ .Get `height` }}" style="width: 100%;height: {{.Get `height`}}px;margin: 0 auto"></div>
    <script src="https://cdn.bootcss.com/echarts/3.8.0/echarts.common.min.js"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts{{ .Get `height` }}'));
        // 指定图表的配置项和数据
        var option = JSON.parse({{ .Inner }})
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
```
### 2.在博客文章中的具体使用

在文章中任意位置插入如下代码，这里以echarts官方教程为例子。这里要注意字符型要加上双引号""，如 **"title"**，而数值型不用。 **特别注意：这里echarts标签<...>复制的时候与花括号{ }前后的空格要去掉**

```
    {{ <echarts height="500"> }}
        {"title":{"text":"ECharts 入门示例"},"tooltip":{},"legend":{"data":["销量"]},"xAxis":{"data":["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]},"yAxis":{},"series":[{"name":"销量","type":"bar","data": [5, 20, 36, 10, 10, 20]}]}
    {{ </echarts> }}
```

---

## 效果

### 样例1

{{<echarts height="500">}}
    {"title":{"text":"ECharts 入门示例"},"tooltip":{},"legend":{"data":["销量"]},"xAxis":{"data":["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]},"yAxis":{},"series":[{"name":"销量","type":"bar","data": [5, 20, 36, 10, 10, 20]}]}
{{</echarts>}}

### 样例2

{{<echarts height="600">}}
   {
    "title": [
        {
            "text": "\u5de5\u4f5c\u7c7b\u522b",
            "left": "auto",
            "top": "auto",
            "textStyle": {
                "fontSize": 18
            },
            "subtextStyle": {
                "fontSize": 12
            }
        }
    ],
    "toolbox": {
        "show": true,
        "orient": "vertical",
        "left": "95%",
        "top": "center",
        "feature": {
            "saveAsImage": {
                "show": true,
                "title": "save as image"
            },
            "restore": {
                "show": true,
                "title": "restore"
            },
            "dataView": {
                "show": true,
                "title": "data view"
            }
        }
    },
    "series_id": 7447549,
    "tooltip": {
        "trigger": "item",
        "triggerOn": "mousemove|click",
        "axisPointer": {
            "type": "line"
        },
        "textStyle": {
            "fontSize": 14
        },
        "backgroundColor": "rgba(50,50,50,0.7)",
        "borderColor": "#333",
        "borderWidth": 0
    },
    "series": [
        {
            "type": "bar",
            "name": "\u5de5\u4f5c\u7c7b\u522b",
            "data": [
                0,
                168,
                165,
                115,
                101,
                98,
                86,
                84,
                74,
                60,
                50,
                46,
                40,
                31,
                31,
                26,
                25,
                16,
                11,
                6,
                5,
                5,
                5,
                2,
                0
            ],
            "barCategoryGap": "20%",
            "label": {
                "normal": {
                    "show": false,
                    "position": "top",
                    "textStyle": {
                        "fontSize": 12
                    }
                },
                "emphasis": {
                    "show": true,
                    "textStyle": {
                        "fontSize": 12
                    }
                }
            },
            "markPoint": {
                "data": []
            },
            "markLine": {
                "data": []
            },
            "seriesId": 7447549
        }
    ],
    "legend": [
        {
            "data": [
                "\u5de5\u4f5c\u7c7b\u522b"
            ],
            "selectedMode": "multiple",
            "show": true,
            "left": "center",
            "top": "top",
            "orient": "horizontal",
            "textStyle": {
                "fontSize": 12
            }
        }
    ],
    "animation": true,
    "xAxis": [
        {
            "show": true,
            "nameLocation": "middle",
            "nameGap": 25,
            "nameTextStyle": {
                "fontSize": 14
            },
            "axisTick": {
                "alignWithLabel": false
            },
            "inverse": false,
            "boundaryGap": true,
            "type": "category",
            "splitLine": {
                "show": false
            },
            "axisLine": {
                "lineStyle": {
                    "width": 1
                }
            },
            "axisLabel": {
                "interval": 0,
                "rotate": 15,
                "margin": 8,
                "textStyle": {
                    "fontSize": 12
                }
            },
            "data": [
                "",
                "Sales & Account Management",
                "Marketing & Communications",
                "Finance",
                "Technical Solutions",
                "Business Strategy",
                "People Operations",
                "User Experience & Design",
                "Program Management",
                "Partnerships",
                "Product & Customer Support",
                "Legal & Government Relations",
                "Administrative",
                "Software Engineering",
                "Sales Operations",
                "Hardware Engineering",
                "Real Estate & Workplace Services",
                "Manufacturing & Supply Chain",
                "Technical Infrastructure",
                "Network Engineering",
                "Developer Relations",
                "Technical Writing",
                "IT & Data Management",
                "Data Center & Network",
                ""
            ]
        }
    ],
    "yAxis": [
        {
            "show": true,
            "nameLocation": "middle",
            "nameGap": 25,
            "nameTextStyle": {
                "fontSize": 14
            },
            "axisTick": {
                "alignWithLabel": false
            },
            "inverse": false,
            "boundaryGap": true,
            "type": "value",
            "splitLine": {
                "show": true
            },
            "axisLine": {
                "lineStyle": {
                    "width": 1
                }
            },
            "axisLabel": {
                "interval": "auto",
                "formatter": "{value} ",
                "rotate": 45,
                "margin": 8,
                "textStyle": {
                    "fontSize": 12
                }
            }
        }
    ],
    "color": [
        "#c23531",
        "#2f4554",
        "#61a0a8",
        "#d48265",
        "#749f83",
        "#ca8622",
        "#bda29a",
        "#6e7074",
        "#546570",
        "#c4ccd3",
        "#f05b72",
        "#ef5b9c",
        "#f47920",
        "#905a3d",
        "#fab27b",
        "#2a5caa",
        "#444693",
        "#726930",
        "#b2d235",
        "#6d8346",
        "#ac6767",
        "#1d953f",
        "#6950a1",
        "#918597",
        "#f6f5ec"
    ]
}
{{</echarts>}}
