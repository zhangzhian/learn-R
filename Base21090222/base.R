# R语言数据类型
# 向量
# 当要创建具有多个元素的向量时，
# 应该使用c()函数，表示将元素组合成一个向量。
apple <- c('red','green',"yellow")
print(apple)
print(class(apple))
# 列表列表是一个R对象，它可以包含许多不
# 同类型的元素，如向量，函数，甚至其中的另一个列表
list1 <- list(c(2,3,4),32.2,sin)
print(list1)
# 矩阵
# 矩阵是二维矩形数据集。 它可以使用向量输入到矩阵函数来创建。
M = matrix(c('a','a','b','c','b','a'),nrow = 2,ncol = 3,byrow = TRUE)
print(M)
# 数组
# 矩阵只能有两个维度，数组可以是任意数量的维数。
# 数组函数采用一个dim属性，创建所需的维数。 
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)
# 因子
# 因子是使用向量创建的R对象。 它将向量存储在向量中的元素的不同值作为标签。
# 标签始终是字符，无论它是输入向量中是数字，还是字符或布尔等。它们在统计建模中很有用。
# 因子使用factor()函数创建。nlevels函数给出了级别的计数。
apple_colors <- c('green','green','yellow','red','red','red','green')
factor_apple <- factor(apple_colors)
print(factor_apple)
print(nlevels(factor_apple))
# 数据帧
# 数据帧是表格数据对象。与数据帧中的矩阵不同，每列可以包含不同的数据模式。
# 第一列是数字，而第二列可以是字符，第三列可以是逻辑类型。它是一个长度相等的向量列表。
# 数据帧使用data.frame()函数创建。
BMI <- data.frame(gender = c("Male", "Male","Female"),
                  height = c(152, 171.5, 165),
                  weight = c(81, 93, 78),
                  Age = c(42, 38, 26)
                  )
print(BMI)
# 变量
# 赋值变量可以使用向左，向右和等于运算符分配值。 
# 可以使用print()或cat()函数打印变量的值。
# cat()函数将多个变量或项目组合成一个连续的打印输出。
var.1 = c(0,1,2,3)
var.2 <- c("learn","R")
c(TRUE,1) -> var.3
print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")
# 变量的数据类型
# 在R中，变量本身没有被声明为任何数据类型，而是获取分配给它的R对象的数据类型。 
# 所以R被称为动态类型语言，这意味着我们可以在程序中使用它时一次又一次地改变同一个变量的变量的数据类型，
# 或者使用同一个变量来存储任何数据类型。
var_x <- "Hello"
cat("The class of var_x is ",class(var_x),"\n")
var_x <- 34.5
cat("  Now the class of var_x is ",class(var_x),"\n")
var_x <- -27L
cat("   Next the class of var_x becomes ",class(var_x),"\n")

# 查找变量
# 如想要知道工作区中当前可用的所有变量，可使用ls()函数。ls()函数也可以使用模式来匹配变量名。
print(ls())
# 使用模式匹配变量名
print(ls(pattern = "var"))
# 以点(.)开头的变量是隐藏的，它们可以使用ls()函数的“all.names = TRUE”参数列出
print(ls(all.names = TRUE))
# rm()函数删除变量
rm(var.3)
print(var.3)
# 删除所有变量可以通过使用rm()和ls()函数一起来完成。
rm(list = ls())
print(ls())

# +
v <- c(2,5.5,6)
t <- c(8,3,4)
print(v+t)
# -
print(v-t)
# *
print(v*t)
# /
print(v/t)
# %% 求余
print(v%%t)
# %/% 求模数
print(v%/%t)
# 指数幂(^)
print(v^t)

# >
print(v>t)
# <
print(v<t)
# ==
print(v==t)
# <=
print(v<=t)
# >=
print(v>=t)
# !=
print(v!=t)
# 逻辑运算符
# &
v1 <- c(3,1,TRUE,2+3i)
t1 <- c(4,1,FALSE,2+3i)
print(v1&t1)
# |
print(v1|t1)
# !
print(!v1)
# &&取两个向量的第一个元素，并且只有在两个都为TRUE时结果才为TRUE值。
print(v1&&t1)
# ||取两个向量的第一个元素，并且如果有一个为TRUE时，结果为TRUE值。
print(v1||t1)
# <−，<<−和= 左分配符
v2 <<- c(3,1,TRUE,2+3i)
v3 = c(3,1,TRUE,2+3i)
print(v1)
print(v2)
print(v3)
# ->和->>  右分配符
c(3,1,TRUE,2+3i) -> v1
c(3,1,TRUE,2+3i) ->> v2
print(v1)
print(v2)
# 冒号运算符(:) - 它为向量创建一系列数字。
v <- 2:8
print(v)
# 成员运算符(%in%) - 该运算符用于识别元素是否属于向量。
v1 <- 8 
v2 <- 12
t <- 1:10
print(v1 %in% t)
print(v2 %in% t)
# 转置相乘(%*%) - 该运算符用于将矩阵与其转置相乘。
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
print(M)
t = M %*% t(M)
print(t(M))
print(t)
# if
x <- 30L
if(is.integer(x)) {
  print("X is an Integer")
}
# if...else...
x <- c("what","is","truth")

if("Truth" %in% x) {
  print("Truth is found")
} else {
  print("Truth is not found")
}
# if...else if...else...
x <- c("what","is","truth")

if("Truth" %in% x) {
  print("Truth is found the first time")
} else if ("truth" %in% x) {
  print("truth is found the second time")
} else {
  print("No truth found")
}
# switch(expression, case1, case2, case3....)
x <- switch(
  3,
  "first",
  "second",
  "third",
  "fourth"
)
print(x)
# repeat
v <- c("Hello","loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  
  if(cnt > 5) {
    break
  }
}
# while
while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}
# for
v <- LETTERS[1:4]
print(v)
for ( i in v) {
  print(i)
}
# break
v <- LETTERS[1:6]
for ( i in v) {
  
  if (i == "D") {
    break()
  }
  print(i)
}
# next
v <- LETTERS[1:6]
for ( i in v) {
  
  if (i == "D") {
    next
  }
  print(i)
}
# 使用关键字function来创建一个R函数。
# R函数定义的基本语法如下：
# function_name <- function(arg_1, arg_2, ...) {
#   Function body 
# }
# Create a sequence of numbers from 32 to 44.
print(seq(32,44))

# Find mean of numbers from 25 to 82.
print(mean(25:82))

# Find sum of numbers frm 41 to 68.
print(sum(41:68))

# Create a function to print squares of numbers in sequence.
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}
new.function(10)

new.function <- function() {
  for(i in 10:20) {
    print(i^2)
  }
}    
new.function()

new.function <- function(a,b,c) {
  result <- a * b + c
  print(result)
}

# 按参数的顺序来提供值调用
new.function(10,20,30)

# 按参数的名称来提供值调用
new.function(a = 10, c = 30, b = 20)

new.function <- function(a = 10, b = 20) {
  result <- a * b
  print(result)
}
new.function()
new.function(11, 22)
# 懒惰计算函数
# 函数的参数被执行懒评估/求值，这表示它们只有在函数体需要的时候进行评估/求值。

new.function <- function(a, b) {
  print(a^2)
  print(a)
  print(b)
}

new.function(8)
# 返回
new.function <- function(a, b) {
  return(a+b)
}

c = new.function(1,2)
print(c)
# 适用于字符串构造的规则字符串开头和结尾的引号应为双引号或双引号，他们不能混合。
# 双引号可以插入到以单引号开始和结尾的字符串中。
# 单引号可以插入到以双引号开始和结尾的字符串中。
# 双引号不能插入到以双引号开始和结尾的字符串中。
# 单引号无法插入到以单引号开始和结尾的字符串中。
a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)

# 连接字符串 - paste()函数
# paste(..., sep = " ", collapse = NULL)
a <- "Hello"
b <- 'How'
c <- "are you? "

print(paste(a,b,c))

print(paste(a,b,c, sep = "-"))

print(paste(a,b,c, sep = "", collapse = ""))

# 格式化数字和字符串 - format()函数
# format(x, digits, nsmall, scientific, width, justify = c("left", "right", "centre", "none"))
# x - 是输入的向量。
# digits - 是显示的总数。
# nsmall - 小数点右侧的最小位数。
# scientific - 设置为TRUE，以显示科学符号。
# width - 表示开始填充空白时要显示的最小宽度。
# justify - 是将字符串显示为左，右或中心。
# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)

# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)

# Format treats everything as a string.
result <- format(6)
print(result)

# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)

# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)

# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)
# 计数字符串中的字符数 - nchar()函数
result <- nchar("Count the number of characters")
print(result)
# 更改大小写 - toupper()＆tolower()函数
result <- toupper("Changing To Upper")
print(result)
result <- tolower("Changing To Lower")
print(result)
# 提取字符串的substring()函数
result <- substring("Extract", 5, 7)
print(result)































