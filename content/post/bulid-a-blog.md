---
title: "基于Hugo与Github建立自己的博客"
date: 2019-07-27T14:31:12+08:00
draft: false
comment: true
tags: ["cheatsheet"]
categories: ["技术栈"]
---
为了总结经验，笔者借此写下利用hugo与github来建立自己的博客的经验，欢迎交流
<!--more-->

## 安装Hugo
这个过程详见另一个博主的教程 [Hugo + Github Pages 搭建个人博客](https://nusr.github.io/post/2019/2019-04-26-creat-hugo-blog/)
- 注意：以下过程均在macOS环境下运行

## 初始化Hugo项目

```bash
hugo new site [your-project-name]
```
这里以笔者的项目为例
```bash
hugo new fzqblog
```
## 载入主题

同样以笔者为例子，进入项目，从github上当一个主题下来（该主题为笔者喜爱的，有兴趣可以选择自己的）

主题会保存在项目博客根目录下的themes文件夹里

```bash
cd fzqblog
git clone https://github.com/olOwOlo/hugo-theme-even themes/even
```
## 预览Hugo静态网页
进入 fzqblog/themes/even/exampleSite 目录中，将 config.toml 文件与content 文件夹拷贝到项目根目录下即 fzqblog/ ，提示是否替换点击是的。

终端输入命令，启动 Hugo ,打开 http://localhost:1313/ 可预览:
```bash
hugo server
```
## 添加新的博客文章
```bash
hugo new post/new-article.md
```
相关模板配置信息如下:
```
---
title: "{{ replace .TranslationBaseName "-" " " | title }}"
date: {{ .Date }}
description: ""
draft: false
---

<!--more-->
```
- draft 设置为 false 或者去掉该参数才会显示
- ```<!--more-->``` 之前的内容会自动作为页面摘要

## 打包
其中even是主题名称
```bash
hugo -t even
```
## 部署到 Github Pages

```bash
# 删除打包文件夹
rm -rf public

# 打包（even是主题，用户根据自己主题名具体操作）
hugo -t even 

# 进入打包后生成的public文件夹
cd public

# Add changes to git | 创建git命令
# -A 表示所有内容
git init
git add -A 

# Commit changes | 添加允许此次变更的说明
msg = "building site `date`"
git commit -m "$msg"

# 推送到github
git push -f [your-SSH-key] master
```
- 注意：SSH key可在用户博客项目仓库中，单击Clone or Download找到

## 其它
参考[博文](https://nusr.github.io/post/2019/2019-04-26-creat-hugo-blog/)
主题样例[预览](https://blog.olowolo.com/example-site/)