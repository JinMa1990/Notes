# 只读变量

```shell
#!/bin/bash
myUrl="https://www.google.com"
readonly myUrl
myUrl="https://www.runoob.com"
```

# 删除变量

```shell
unset variable_name
```

# 变量类型

+ 局部变量
+ 环境变量
+ shell变量

# Shell字符串

## 单引号

- ​		单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
- ​		单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

## 双引号

- ​		双引号里可以有变量
- ​		双引号里可以出现转义字符

## 拼接字符串

```shell
#!/bin/bash
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3	
```

## 获取字符串长度

```shell
#!/bin/bash
string="abcd"
echo ${#string #输出 4
```

## 提取子字符串



## 查找子字符串



## Shell数组

