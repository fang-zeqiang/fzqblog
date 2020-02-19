---
title: "🔥基于Python的CCF模拟題解析（持续更新）"
date: 2019-08-15T23:50:41+08:00
draft: false
tags: ["CCF","Python"]
categories: ["技术栈"]
---

来自[ccf官网](http://118.190.20.162/home.page)的模拟考題，报名后即可查看

<!--more-->

## 201809-01

小明买菜,测试成绩100，这题过于简单，如下所示：

*  pay attention to the difference between 'arr2 = arr1' and 'arr2 = arr1.copy()'
* deep copy VS shallow copy

```python

n = int(input().strip())
price1,price2 = [],[]

price1 = input().split()
price1 = list(map(int,price1))
price2 = price1.copy()

for i in range(1,n-1):
    price2[i] = (price1[i-1] + price1[i] + price1[i+1]) // 3

price2[0],price2[n-1] = (price1[0] + price1[1]) // 2 , (price1[n-2] + price1[n-1]) // 2

for i in price2:
    print(i,end=' ')
```

## 201809-02

## 2018-12-01

小明上学，测试成绩100，如下所示：

```python
r,y,g = input().split()

r = int(r)
y = int(y)
g = int(g)

n = int(input())

sum_t = 0 # the whole time consum on the road
k,t = [],[]

def count(k:int,t:int,sum_t:int,r,y,g):
    if k == 1:
        sum_t += t
    elif k == 2:
        sum_t += (t + r)
    elif k == 3:
        return sum_t
    else:
        sum_t = sum_t + t
    return sum_t

for i in range(n):
    arr = []
    arr = input().split()
    arr = list(map(int,arr))
    sum_t = count(arr[0],arr[1],sum_t,r,y,g)

print(sum_t)
```

## 2018-12-02

这个是红绿灯🚥问题的进阶版本，具体如下：

```python
def count(r,y,g,n):
    a,b,ans,light = 0,0,0,[r,g,y] 
    # light[0] is red, light[1] is green, light[2] is yellow
    # sum为红绿灯变换一周的总时长
    # sum_time = light[0]+light[1]+light[2]
    sum_time = sum(light)
    for i in range(n):
        a,b = input().split()
        a,b= int(a),int(b)
        if a == 0:
            ans += b
        else:
            if a == 1:
                a = 0
            elif a == 3:
                a = 1
            b = (light[a]-b+ans) % sum_time
            while b > light[a]:
                b -= light[a]
                a = (a+1) % 3
            if a == 0:
                ans += (light[a] - b)
            elif a == 2:
                ans += (light[a] - b + light[0])
    return ans

if __name__ == "__main__":
    r,y,g = input().split()
    r,y,g = int(r),int(y),int(g)
    n = int(input())
    sum_time = count(r,y,g,n)
    print(sum_time)
```

笔者认为最最**核心**的部分是判断里的:

```python
b = (light[a]-b+ans) % sum_time
while b > light[a]:
 b -= light[a]
 a = (a+1) % 3
```

这个不太好想，比如`a=(a+1)%3`这个很好的解决了单向数组的**循环操作**，运用取余可以做到，做题的时候不容易想到，同时判断此时灯的状态`a`可以先用红绿灯已亮灯的时间`light[a]-b+ans`**取余**红绿灯循环周期，通过一个`while`循环后判断好灯的状态，当灯为红灯或黄灯的时候，车需要等待。

这题还需要注意**黄灯亮完是红灯**

改进：利用python简洁的语法来重新简化语言，缩短代码长度

---

## 2019-03-01

找到中位数，输出最大值最小值中位数，测试成绩100，如下所示：

```python
n = int(input().strip())
arr = input().split()
# convert the string into int
arr = list(map(int,arr))
temp = arr[n//2-1] + arr[n//2]
middle = (temp//2 if temp % 2 == 0 else temp/2) if n % 2 == 0 else arr[(n-1)//2]
print(arr[n-1],middle,arr[0]) if arr[n-1]>=arr[0] else print(arr[0],middle,arr[n-1])
```

其中关键的地方有`arr = input().split()`将字符用空格隔开输入进arr中，而且要用`arr = list(map(int,arr))`来将输入的字符串类型转换成int类型。

## 2019-03-02

4个数字，三个运算符结果是24即输出YES，测试成绩100，如下所示：

```python
n = int(input().strip())
a , s1 = 1 , []
def reEval(s1):
    temp = s1.replace('x','*')
    temp1 = temp.replace('/','//')
    return eval(temp1) == 24
for i in range(n):
    s1.append(str(input().strip()))
for i in range(n):
    print("Yes" if reEval(s1[i]) else "No")
```

关键一步是`temp = s1.replace('x','*')` ,`temp.replace('/','//')`将字符串的运算符号转化成待会可以用eval()方法识别的运算符
