---
title: "如何修改Hosts文件访问特定网站"
date: 2019-11-09T14:03:07+08:00
draft: false
---

<!--more-->
因为搭梯子的问题引出了host问题
有些网站是不需要翻墙，只需要绑定host就可以访问，比如[lncn.org](https://lncn.org)
我之前上Coursera，看上面的视频就需要绑定hosts才能流畅观看
还有Cambly口语练习网站，官方就有教我们如何修改Hosts访问
OneDrive也不能幸免，毕竟服务器在海外

## for mac os

in Finder menu

use

    Command+Shift+G

input

    /private/etc/

then, you can find the hosts file

Here is my hosts content as following

    ##
    # Host Database
    #
    # localhost is used to configure the loopback interface
    # when the system is booting.  Do not change this entry.
    ##
    127.0.0.1	localhost
    255.255.255.255	broadcasthost
    ::1             localhost
    52.84.167.78    d3c33hcgiwev3.cloudfront.net
    69.194.14.16 	lncn.org

## for windows


