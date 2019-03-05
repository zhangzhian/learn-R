# 函数mean()用于在R中计算平均值。
# mean(x, trim = 0, na.rm = FALSE, ...)
# x - 是输入向量。
# trim - 用于从排序的向量的两端删除一些观测值。
# na.rm - 用于从输入向量中删除缺少的值。

# Create a vector. 
x <- c(17,8,6,4.12,11,8,54,-11,18,-7)

# Find Mean.
result.mean <- mean(x)
print(result.mean)

# Find Mean.
result.mean <-  mean(x,trim = 0.3)
print(result.mean)

# Create a vector. 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)

# Find mean.
result.mean <-  mean(x)
print(result.mean)

# Find mean dropping NA values.
result.mean <-  mean(x,na.rm = TRUE)
print(result.mean)

# R中计算位数的基本语法是
# median(x, na.rm = FALSE)
# x - 是输入向量。
# na.rm - 用于从输入向量中删除缺少的值。
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find the median.
median.result <- median(x)
print(median.result)


# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)

# Calculate the mode using the user function.
result <- getmode(v)
print(result)

# Create the vector with characters.
charv <- c("baidu.com","tmall.com","yiibai.com","qq.com","yiibai.com")

# Calculate the mode using the user function.
result <- getmode(charv)
print(result)

# 线性回归中lm()函数的基本语法是 
# -lm(formula,data)
# formula - 是表示x和y之间的关系的符号。
# data - 是应用公式的向量。
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

print(relation)

print(summary(relation))

# 线性回归中的predict()的基本语法是 
# -predict(object, newdata)
# R以下是使用的参数的描述 
# object - 是已经使用lm()函数创建的公式。
# newdata - 是包含预测变量的新值的向量。

# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)

# Give the chart file a name.
png(file = "linearregression.png")

par(family='Kai')
# Plot the chart.
plot(y,x,col = "blue",main = "身高和体重回归",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "体重(Kg)",ylab = "身高(cm)")

# Save the file.
dev.off()


# lm()函数在多元回归中的基本语法是 
# -lm(y ~ x1+x2+x3...,data)
# R以下是使用的参数的描述 
# formula - 即：y ~ x1+x2+x3...是呈现响应变量和预测变量之间关系的符号。
# data - 是应用公式的向量。

input <- mtcars[,c("mpg","disp","hp","wt")]
print(head(input))

# Create the relationship model.
model <- lm(mpg~disp+hp+wt, data = input)

# Show the model.
print(model)

# Get the Intercept and coefficients as vector elements.
cat("# # # # The Coefficient Values # # # ","\n")

a <- coef(model)[1]
print(a)

Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]

print(Xdisp)
print(Xhp)
print(Xwt)

# Y = a+Xdisp.x1+Xhp.x2+Xwt.x3
# ## 或者 
# Y = 37.15+(-0.000937)*x1+(-0.0311)*x2+(-3.8008)*x3


# 逻辑回归的一般数学方程为 
# -y = 1/(1+e^-(a+b1x1+b2x2+b3x3+...))
# R以下是使用的参数的描述 
# y - 是响应变量。
# x - 是预测变量。
# a 和 b 是数字常数的系数。
# 用于创建回归模型的函数是glm()函数。

# 用于计算逻辑回归的glm()函数的基本语法是 
#  -glm(formula,data,family)
# R以下是使用的参数的描述 
# formula - 是呈现变量之间关系的符号。
# data - 是给出这些变量值的数据集
# family - 是R对象来指定模型的概述，对于逻辑回归，它的值是二项式。

input <- mtcars[,c("am","cyl","hp","wt")]

am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)

print(am.data)
print(summary(am.data))

# dnorm(x, mean, sd)  给出给定平均值和标准偏差在每个点的概率分布的高度。
# pnorm(x, mean, sd)  给出正态分布随机数小于给定数值的概率。它也被称为“累积分布函数”。
# qnorm(p, mean, sd)  采用概率值，并给出其累积值与概率值匹配的数字值。
# rnorm(n, mean, sd)  用于生成分布正常的随机数，它将样本大小作为输入，并生成许多随机数。我们绘制直方图以显示生成数字的分布。
# R以下是上述函数中使用的参数的描述 
# x - 是数字的向量。
# p - 是概率向量。
# n - 是观察次数(样本量)。
# mean - 是样本数据的平均值，默认值为零。
# sd - 是标准偏差，默认值为1。

# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)

# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 2.5, sd = 0.5)

# Give the chart file a name.
png(file = "dnorm.png")
par(family='Kai')
plot(x,y)

# Save the file.
dev.off()

# Create a sequence of numbers between -10 and 10 incrementing by 0.2.
x <- seq(-10,10,by = .2)

# Choose the mean as 2.5 and standard deviation as 2. 
y <- pnorm(x, mean = 2.5, sd = 2)

# Give the chart file a name.
png(file = "pnorm.png")
par(family='Kai')
# Plot the graph.
plot(x,y)

# Save the file.
dev.off()

# Create a sequence of probability values incrementing by 0.02.
x <- seq(0, 1, by = 0.02)

# Choose the mean as 2 and standard deviation as 3.
y <- qnorm(x, mean = 2, sd = 1)

# Give the chart file a name.
png(file = "qnorm.png")

# Plot the graph.
plot(x,y)

# Save the file.
dev.off()

# Create a sample of 50 numbers which are normally distributed.
y <- rnorm(50)

# Give the chart file a name.
png(file = "rnorm.png")

# Plot the histogram for this sample.
hist(y, main = "正态分布")

# Save the file.
dev.off()


# R具有四个内置函数来生成二项分布：
# dbinom(x, size, prob) 给出了每个点的概率密度分布
# pbinom(x, size, prob) 给出事件的累积概率，它用于表示概率的单个值。
# qbinom(p, size, prob) 采用概率值，并给出其累积值与概率值匹配的数字。
# rbinom(n, size, prob) 从给定样本生成所需数量的给定概率的随机值。

# x - 是数字的向量。
# p - 是概率向量。
# n - 是观察次数。
# size - 是试验的次数。
# prob - 是每次试验成功的概率。

x <- seq(0,50,by = 1)

# Create the binomial distribution.
y <- dbinom(x,50,0.5)

# Give the chart file a name.
png(file = "dbinom.png")

# Plot the graph for this sample.
plot(x,y)

# Save the file.
dev.off()

# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)

print(x)

# How many heads will have a probability of 0.25 will come out when a coin is tossed 51 times.
x <- qbinom(0.25,51,1/2)

print(x)

# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,.4)

print(x)

# 泊松回归的一般数学方程为 
# -log(y) = a + b1x1 + b2x2 + bnxn.....
# R以下是使用的参数的描述
# y - 是响应变量。a 和 b 是数字系数。
# x - 是预测变量。
# 用于创建泊松回归模型的函数是glm()函数。

# 实现泊松回归的glm()函数的基本语法是 
# -glm(formula,data,family)
# R以下是上述函数中使用的参数的描述
# formula - 是呈现变量之间关系的符号。
# data - 是给出这些变量值的数据集。
# family -是R对象来指定模型的细节，逻辑回归的值是“泊松”。

input <- warpbreaks
print(head(input))
output <-glm(formula = breaks ~ wool+tension, 
             data = warpbreaks, 
             family = poisson)
print(output)
print(summary(output))


input <- mtcars[,c("am","mpg","hp")]
print(head(input))

# Create the regression models.
result1 <- aov(mpg~hp*am,data = input)
result2 <- aov(mpg~hp+am,data = input)

# Compare the two models.
print(anova(result1,result2))

# 时间序列分析所使用的ts()函数的基本语法是
# -timeseries.object.name <-  ts(data, start, end, frequency)
# data - 是包含时间序列中使用的值的向量或矩阵。
# start - 以时间序列指定第一次观察的开始时间
# end - 指定时间序列中最后观察的结束时间。
# frequency - 指定每单位时间的观测次数。

# Get the data points in form of a R vector.
rainfall <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)

# Convert it to a time series object.
rainfall.timeseries <- ts(rainfall,start = c(2012,1),frequency = 12)

# Print the timeseries data.
print(rainfall.timeseries)

# Give the chart file a name.
png(file = "rainfall.png")

# Plot a graph of the time series.
plot(rainfall.timeseries)

# Save the file.
dev.off()

# ts()函数中的频率(frequency)参数的值决定了测量数据点的时间间隔。 值为12表示时间序列为12个月。其他值及其含义如下
# frequency= 12 - 每一个月的数据点。
# frequency= 4 - 每年四分之一的数据点。
# frequency= 6 - 每一小时10分钟的数据点。
# frequency= 24 6* - 每天10分钟的数据点。
# Get the data points in form of a R vector.
rainfall1 <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
rainfall2 <- 
  c(655,1306.9,1323.4,1172.2,562.2,824,822.4,1265.5,799.6,1105.6,1106.7,1337.8)

# Convert them to a matrix.
combined.rainfall <-  matrix(c(rainfall1,rainfall2),nrow = 12)

# Convert it to a time series object.
rainfall.timeseries <- ts(combined.rainfall,start = c(2012,1),frequency = 12)

# Print the timeseries data.
print(rainfall.timeseries)

# Give the chart file a name.
png(file = "rainfall_combined.png")
par(family='Kai')
# Plot a graph of the time series.
plot(rainfall.timeseries, main = "多时间系列图")

# Save the file.
dev.off()

# 在R中创建非线性最小二乘检验的基本语法是 -nls(formula, data, start)
# R以下是使用的参数的描述 
# formula - 是包含变量和参数的非线性模型公式。
# data - 是用于评估(计算)公式中的变量的数据帧。
# start - 是起始估计的命名列表或命名数字向量。
xvalues <- c(1.6,2.1,2,2.23,3.71,3.25,3.4,3.86,1.19,2.21)
yvalues <- c(5.19,7.43,6.94,8.11,18.75,14.88,16.06,19.12,3.21,7.58)

# Give the chart file a name.
png(file = "nls.png")


# Plot these values.
plot(xvalues,yvalues)


# Take the assumed values and fit into the model.
model <- nls(yvalues ~ b1*xvalues^2+b2,start = list(b1 = 1,b2 = 3))

# Plot the chart with new data by fitting it to a prediction from 100 data points.
new.data <- data.frame(xvalues = seq(min(xvalues),max(xvalues),len = 100))
lines(new.data$xvalues,predict(model,newdata = new.data))

# Save the file.
dev.off()

# Get the sum of the squared residuals.
print(sum(resid(model)^2))

# Get the confidence intervals on the chosen values of the coefficients.
print(confint(model))

# 包“party”中包含用于创建和分析决策树的ctree()函数。
# 有编译错误
install.packages("party")
# 在R中创建决策树的基本语法是 -ctree(formula, data)
# R以下是使用的参数的描述 
# formula - 是描述预测变量和响应变量的公式。
# data - 是使用的数据集的名称。

# Load the party package. It will automatically load other dependent packages.
library("party")

# Print some records from data set readingSkills.
print(head(readingSkills))

# Create the input data frame.
input.dat <- readingSkills[c(1:105),]

# Give the chart file a name.
png(file = "decision_tree.png")

# Create the tree.
output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score, 
  data = input.dat)

# Plot the tree.
plot(output.tree)

# Save the file.
dev.off()

install.packages("randomForest")
# 在R中创建随机林的基本语法是 
# -randomForest(formula, data)
# R以下是使用的参数的描述
# formula - 是描述预测变量和响应变量的公式。
# data - 是使用的数据集的名称。

library("randomForest")
# Create the forest.
output.forest <- randomForest(nativeSpeaker ~ age + shoeSize + score, 
                              data = readingSkills)

# View the forest results.
print(output.forest) 

# Importance of each predictor.
print(importance(output.forest,type = 2))

install.packages("survival")

# 在R中创建生存分析的基本语法是 
# Surv(time,event)
# survfit(formula)
# R以下是使用的参数的描述 
# time - 是直到事件发生的后续时间。
# event - 表示预期事件发生的状态。
# formula - 是预测变量之间的关系。
# Load the library.
library("survival")

# Print first few rows.
print(head(pbc))

# Create the survival object. 
survfit(Surv(pbc$time,pbc$status == 2)~1)

# Give the chart file a name.
png(file = "survival.png")

# Plot the graph. 
plot(survfit(Surv(pbc$time,pbc$status == 2)~1))

# Save the file.
dev.off()

# 在R中创建卡方检验的基本语法是
# -chisq.test(data)
# R以下是使用的参数的描述 --data - 是表中包含观察值中变量计数值的数据。
library("MASS")
print(str(Cars93))

# Create a data frame from the main data set.
car.data <- data.frame(Cars93$AirBags, Cars93$Type)

# Create a table with the needed variables.
car.data = table(Cars93$AirBags, Cars93$Type) 
print(car.data)

# Perform the Chi-Square test.
print(chisq.test(car.data))





