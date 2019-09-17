---
title: "结合JavaScript直接抓取网站内容"
date: 2019-08-14T00:09:26+08:00
draft: false
tags: ["cheatsheet","JavaScript","Python"]
categories: ["技术栈"]
---

该方法用于解决“爬虫操作繁琐与手动复制太累”的情况

<!--more-->

思路：

1. 将目标网页当前页**另存为**本地文件

2. 先分析要提取内容所在**标签**或**类名**

3. 在网页的低端**插入容器**用以显示要抓取的内容

4. 在网页**源代码**的插入JS代码命令

5. 该段JS使得目标内容在容器中显示

6. 复制目标内容至txt文件进行预处理
   
   ---

## 1. 将目标网页当前页另存为本地文件

在chrome打开目标网页，右键另存为到桌面，可以看到有 xxx.html 与 xxx_file（文件夹），将 xxx.html 用文本编辑器打开（推荐使用sublime）



## 2. 先分析要提取内容所在**标签**或类名

可以 `cmd+F`或者`ctrl+F`查找目标内容，如笔者想要查找以下内容

```html
<div class="item-box">
    <div style="cursor: pointer" class="collo_cn_content">
        A看电视和电影 B 不和别人交流 C 影响交流能力
        ...
        特定化：特别是现在大家可以手机看电影等
     </div>
     <div id="collapse758" class="collapse">
        翻译：不要回答！不要回答！不要回答！
        词汇：depict,de facto,simutaneous
        ...
        you got it!
     </div>
     ...
</div>   
```

观察此时中文内容所在容器的**id或类名**，比如此时的`class="item-box"`，`class="collo_cn_content"`和`class="collapse"`，进一步分析可得`item-box`包含了`collo_cn_content`和`collapse`两个类下的目标内容，故之后选用此类名作定位**关键词**，记住这个**item-box**

## 3. 在网页的低端**插入容器**用以显示要抓取的内容

在网页源代码的主题段底端（存放位置顺随心意就行，笔者这里以底端为例）

如一下代码的**后四行**，在主题部分的末尾添加容器，用以待会存放显示目标内容

```html
<div class="footer-wrapper">
    <div class="footer-content-wrapper">
        <div class="icp">
            闽ICP备xxxxx号
        </div>
    </div>
<div id="cn_content">
    在这里显示目标内容 !
    show targeted contents there !
</div>
```

## 4. 在网页**源代码**的插入JS代码命令

插入如下命令

```javascript
<script type="text/javascript">
    var content = document.getElementById("cn_content");
    var ch = document.getElementsByClassName("item-box");
    for(var i=0;i<ch.length;i++){
        content.innerText += "\n" + ch[i].innerText;
    }
</script>
```

`content`存放所定位到的所有目标内容，将`content`定位到如下之前写好的容器里

```javascript
<div id="cn_content">
 在这里显示目标内容 !
 show targeted contents there !
</div>
```

## 5. 该段JS使得目标内容在容器中显示

完成如上操作后，即可打开已经修改过的网页

**注意!** 如果数据量大如3w+，需要等待页面响应或者优化js代码，如缩小定位范围来减少浏览器查找时间）

经过调试后目标内容显示成功，可直接在页面上选中**复制进 txt 文件**中

## 6. 实用python对txt文件进行预处理

数据预处理这里笔者以**删除空白行**为例

```python
def clearBlankLine():
    file1 = open('/Users/xxx.txt', 'r', encoding='utf-8') 
    # 要去掉空行的文件 
    file2 = open('/Users/xxx_processed.txt', 'w', encoding='utf-8') 
    # 生成没有空行的文件
    try:
        for line in file1.readlines():
            if line == '\n':
                line = line.strip("\n")
            file2.write(line)
    finally:
        file1.close()
        file2.close()

if __name__ == '__main__':
    clearBlankLine()
```

处理完文件中的空白行后根据需要进行进一步数据处理，如分词等让目标内容能更好的为我们所用！


