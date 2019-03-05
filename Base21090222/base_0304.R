# pie(x, labels, radius, main, col, clockwise)
# x - 是包含饼图中使用的数值的向量。
# labels - 用于描述切片的标签。
# radius - 用来表示饼图圆的半径(-1和+1之间的值)。
# main - 用来表示图表的标题。
# col - 表示调色板。
# clockwise - 是一个逻辑值，指示片是顺时针还是逆时针绘制。
# Create data for the graph.

# 全局设置，但是图片依旧乱码
# Kai这一字体是从系统安装的
par(family='Kai')

x <- c(11, 30, 39, 20)
labels <- c("70后", "80后", "90后", "00后")

# Give the chart file a name.
png(file = "birth_of_age.png")
# 这句话放在这儿可以解决乱码
# par(family='Kai')
# 放在pie中图片不存在乱码
# Plot the chart.
pie(x,labels,family='Kai')

# Save the file.
dev.off()

# Give the chart file a name.
png(file = "age_title_colours.jpg")

# Plot the chart with title and rainbow color pallet.
pie(x, labels, main = "出生年龄段 - 饼状图", col = rainbow(length(x)),family='Kai')

# Save the file.
dev.off()

piepercent<- paste(round(100*x/sum(x), 2), "%")

# Give the chart file a name.
png(file = "age_percentage_legends.jpg")

# Plot the chart.
pie(x, labels = piepercent, main = "出生年龄段 - 饼状图",col = rainbow(length(x)),family='Kai')
par(family='Kai')
legend("topright", c("70后","80后","90后","00后"), cex = 0.8,fill = rainbow(length(x)))

# Save the file.
dev.off()

install.packages("plotrix")
# Get the library.
library("plotrix")

# Create data for the graph.
x <-  c(21, 62, 10,53)
lbl <- c("70后", "80后", "90后", "00后")

# Give the chart file a name.
png(file = "3d_pie_chart.jpg")
par(family='Kai')

# Plot the chart.
pie3D(x,labels = lbl,explode = 0.1, main = "出生年龄段 - 饼状图")

# Save the file.
dev.off()

# barplot(H, xlab, ylab, main, names.arg, col)
# H - 是包含条形图中使用的数值的向量或矩阵。
# xlab - 是x轴的标签。
# ylab - 是y轴的标签。
# main - 是条形图的标题。
# names.arg - 是在每个栏下显示的名称向量。
# col - 用于给图中的图条给出颜色。

# Create the data for the chart.
H <- c(7,12,28,3,41)

# Give the chart file a name.
png(file = "barchart.png")

# Plot the bar chart.
barplot(H)

# Save the file.
dev.off()

# Create the data for the chart.
H <- c(7,12,28,3,41)
M <- c("一月","二月","三月","四月","五月")

# Give the chart file a name.
png(file = "barchart_months_revenue.png")
par(family='Kai')
# Plot the bar chart.
barplot(H,names.arg = M,xlab = "月份",ylab = "收入量",col = "blue",
        main = "收入图表",border = "red")

# Save the file.
dev.off()


# Create the input vectors.
colors <- c("green","orange","brown")
months <- c("一月","二月","三月","四月","五月")
regions <- c("东部地区","西部地区","南部地区")

# Create the matrix of the values.
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow = 3,ncol = 5,byrow = TRUE)

# Give the chart file a name.
png(file = "barchart_stacked.png")
par(family='Kai')
# Create the bar chart.
barplot(Values,main = "总收入",names.arg = months,xlab = "月份",ylab = "收入",
        col = colors)

# Add the legend to the chart.
legend("topleft", regions, cex = 1.3, fill = colors)

# Save the file.
dev.off()

# boxplot(x, data, notch, varwidth, names, main)
# x - 是向量或公式。
# data - 是数据帧。
# notch - 是一个逻辑值，设置为TRUE可以画出一个缺口。
# varwidth - 是一个逻辑值。设置为true以绘制与样本大小成比例的框的宽度。
# names - 是将在每个箱形图下打印的组标签。
# main - 用于给图表标题。

input <- mtcars[,c('mpg','cyl')]
print(head(input))

# Give the chart file a name.
png(file = "boxplot.png")

par(family='Kai')
# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "气缸数",
        ylab = "每加仑里程", main = "里程数据")

# Save the file.
dev.off()

# Give the chart file a name.
png(file = "boxplot_with_notch.png")

par(family='Kai')
# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, 
        xlab = "气缸数",
        ylab = "每加仑里程", 
        main = "里程数据",
        notch = TRUE, 
        varwidth = TRUE, 
        col = c("green","yellow","purple"),
        names = c("高","中","低")
)
# Save the file.
dev.off()


# hist(v,main,xlab,xlim,ylim,breaks,col,border)
# v - 是包含直方图中使用数值的向量。
# main - 表示图表的标题。
# col - 用于设置条的颜色。
# border - 用于设置每个栏的边框颜色。
# xlab - 用于描述x轴。
# xlim - 用于指定x轴上的值范围。
# ylim - 用于指定y轴上的值范围。
# breaks - 是用来提及每个栏的宽度。

# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
png(file = "histogram.png")

par(family='Kai')
# Create the histogram.
hist(v, main="直方图示例",xlab = "重量", ylab="高度",col = "yellow",border = "blue")

# Save the file.
dev.off()


# Give the chart file a name.
png(file = "histogram_lim_breaks.png")

par(family='Kai')
# Create the histogram.
hist(v, main="直方图示例-2", xlab = "重量", ylab="高度",col = "green",border = "red", xlim = c(0,40), ylim = c(0,5),
     breaks = 5)

# Save the file.
dev.off()


# plot(v,type,col,xlab,ylab)
# v - 是包含数值的向量。
# type - 取值“p”表示仅绘制点，“l”表示仅绘制线条，“o”表示仅绘制点和线。
# xlab - 是x轴的标签。
# ylab - 是y轴的标签。
# main - 是图表的标题。
# col - 用于绘制点和线两种颜色。
v <- c(7,12,28,3,41)

# Give the chart file a name.
png(file = "line_chart.jpg")

par(family='Kai')
# Plot the bar chart. 
plot(v,type = "o", main = "降雨量图表")

# Save the file.
dev.off()

# Give the chart file a name.
png(file = "line_chart_label_colored.jpg")

par(family='Kai')
# Plot the bar chart.
plot(v,type = "o", col = "red", xlab = "月份", ylab = "降雨量",
     main = "降雨量图表")

# Save the file.
dev.off()


# Create the data for the chart.
v <- c(7,12,28,3,41)
t <- c(14,7,6,19,3)

# Give the chart file a name.
png(file = "line_chart_2_lines.jpg")

par(family='Kai')
# Plot the bar chart.
plot(v,type = "o",col = "red", xlab = "月份", ylab = "降雨量", 
     main = "降雨量图表")

lines(t, type = "o", col = "blue")

# Save the file.
dev.off()

# plot(x, y, main, xlab, ylab, xlim, ylim, axes)
# x - 是数据集，其值是水平坐标。
# y - 是数据集，其值是垂直坐标。
# main - 是图表的标题。
# xlab - 是水平轴(y轴)上的标签。
# ylab - 是垂直轴(y轴)上的标签。
# xlim - 是用于绘制的x的值的极限。
# ylim - 是用于绘制的y值的极限。
# axes - 指示是否应在绘图上绘制两个轴。
# Get the input values.
input <- mtcars[,c('wt','mpg')]

# Give the chart file a name.
png(file = "scatterplot.png")

par(family='Kai')
# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x = input$wt,y = input$mpg,
     xlab = "重量",
     ylab = "里程",
     xlim = c(2.5,5),
     ylim = c(15,30),         
     main = "重量 VS 里程"
)

# Save the file.
dev.off()

# pairs(formula, data)
# 
# formula - 表示成对使用的一系列变量。
# data - 表示将从中采集变量的数据集。
png(file = "scatterplot_matrices.png")

# Plot the matrices between 4 variables giving 12 plots.

# One variable with 3 others and total 4 variables.
par(family='Kai')
pairs(~wt+mpg+disp+cyl,data = mtcars,
      main = "散点图矩阵")

# Save the file.
dev.off()


