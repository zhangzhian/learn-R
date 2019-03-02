print(getwd())
# setwd()函数设置新的工作目录
setwd("/Users/zhangzhian/Desktop/")
print(getwd())

data <- read.csv("input.csv")
print(data)

print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

sal <- max(data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)

retval <- subset( data, dept == "IT")
print(retval)

info <- subset(data, salary > 600 & dept == "IT")
print(info)

retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

# 写入CSV文件
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
# Write filtered data into a new file.
write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

install.packages("xlsx")

install.packages("rJava")

install.packages("xlsxjars")

# Verify the package is installed.
any(grepl("xlsx",installed.packages()))
any(grepl("rJava",installed.packages()))
any(grepl("xlsxjars",installed.packages()))

# Load the library into R workspace.
library("xlsxjars")
library("rJava")
library("xlsx")

# Read the first worksheet in the file input.xlsx.
data <- read.xlsx("input.xlsx", sheetIndex = 1)
print(data)

data <- read.xlsx("input.xlsx", sheetIndex = 2)
print(data)

# writeBin(object, con)
# readBin(con, what, n )
# R以下是使用的参数的描述 - 
# con - 是要读取或写入二进制文件的连接对象。
# object - 是要写入的二进制文件。
# what - 是像字符，整数等的模式，代表要读取的字节。
# n - 是从二进制文件读取的字节数。

# 写入二进制文件
# Read the "mtcars" data frame as a csv file and store only the columns 
# "cyl", "am" and "gear".
write.table(mtcars, file = "mtcars.csv",row.names = FALSE, na = "", 
            col.names = TRUE, sep = ",")

# Store 5 records from the csv file as a new data frame.
new.mtcars <- read.table("mtcars.csv",sep = ",",header = TRUE,nrows = 5)

# Create a connection object to write the binary file using mode "wb".
write.filename = file("binmtcars.dat", "wb")

# Write the column names of the data frame to the connection object.
writeBin(colnames(new.mtcars), write.filename)

# Write the records in each of the column to the file.
writeBin(c(new.mtcars$cyl,new.mtcars$am,new.mtcars$gear), write.filename)

# Close the file for writing so that it can be read by other program.
close(write.filename)

# 读取二进制文件
# Create a connection object to read the file in binary mode using "rb".
read.filename <- file("binmtcars.dat", "rb")

# First read the column names. n = 3 as we have 3 columns.
column.names <- readBin(read.filename, character(),  n = 3)

# Next read the column values. n = 18 as we have 3 column names and 15 values.
read.filename <- file("/web/com/binmtcars.dat", "rb")
bindata <- readBin(read.filename, integer(),  n = 18)

# Print the data.
print(bindata)

# Read the values from 4th byte to 8th byte which represents "cyl".
cyldata = bindata[4:8]
print(cyldata)

# Read the values form 9th byte to 13th byte which represents "am".
amdata = bindata[9:13]
print(amdata)

# Read the values form 9th byte to 13th byte which represents "gear".
geardata = bindata[14:18]
print(geardata)

# Combine all the read values to a dat frame.
finaldata = cbind(cyldata, amdata, geardata)
colnames(finaldata) = column.names
print(finaldata)

# Load the package required to read XML files.
library("XML")

# Also load the other required package.
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Print the result.
print(result)


# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

# Print the result.
print(rootsize)

# Print the result.
print(rootnode[1])

# Get the first element of the first node.
print(rootnode[[1]][[1]])

# Get the fifth element of the first node.
print(rootnode[[1]][[5]])

# Get the second element of the third node.
print(rootnode[[3]][[2]])

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)

install.packages("rjson")

# Load the package required to read JSON files.
library("rjson")

# Give the input file name to the function.
result <- fromJSON(file = "input.json")

# Print the result.
print(result)

# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)

print(json_data_frame)

install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")
library("bitops")
library("RCurl")
library("XML")
library("stringr")
library("plyr")
# Read the URL.
url <- "https://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
# links <- getHTMLLinks(url)
# 
# # Identify only the links which point to the JCMB 2015 files. 
# filenames <- links[str_detect(links, "JCMB_2015")]
# 
# # Store the file names as a list.
# filenames_list <- as.list(filenames)
# 
# # Create a function to download the files by passing the URL and filename list.
# downloadcsv <- function (mainurl,filename) {
#   filedetails <- str_c(mainurl,filename)
#   download.file(filedetails,filename)
# }
# 
# # Now apply the l_ply function and save the files into the current R working directory.
# l_ply(filenames,downloadcsv,mainurl = "https://www.geos.ed.ac.uk/~weather/jcmb_ws/")
install.packages("DBI")
install.packages("RMySQL")
library("DBI")
library("RMySQL")

mysqlconnection = dbConnect(MySQL(), user = 'root', password = '123456', dbname = 'rdb',
                            host = 'localhost')

# List the tables available in this database.
dbListTables(mysqlconnection)


result = dbSendQuery(mysqlconnection, "select * from persons")

# Store the result in a R data frame object. n = 5 is used to fetch first 5 rows.
data.frame = fetch(result, n = 5)
print(data.frame)

result = dbSendQuery(mysqlconnection, "select * from persons where date_of_birth = '1990-01-01'")

# Fetch all the records(with n = -1) and store it as a data frame.
data.frame = fetch(result, n = -1)
print(data.frame)


dbSendQuery(mysqlconnection, "update persons set date_of_birth = '1999-01-01' where id=3")

dbSendQuery(mysqlconnection,
            "insert into persons(full_name, date_of_birth) values ('Maxsu', '1992-01-01')"
)
# Error in .local(conn, statement, ...) : 
#   could not run statement: The used command is not allowed with this MySQL version
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)

dbSendQuery(mysqlconnection, 'drop table if exists t_demo')

