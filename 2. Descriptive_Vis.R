
ages = c(21,30,40,22,45,50,51,23,25,35)
plot(ages) # by default single coloumn is taken as y axis and on x-axis will have index values

salary = c(21000,30000,40000,22000,45000,50000,51000,23000,25000,35000)
plot(salary) # by default given column is plotted on y-axis

plot(ages,salary) # when two vlaues are given,  ages is plotted on x-axis and salary wiil be plotted on y-axis
plot(salary,ages)

help(plot)
#######################################
mtcars

#airquality = read.csv('path/airquality.csv',header=TRUE, sep=",")
#Click on Import dataset

data()
airquality = datasets::airquality #using same name of data frame with same name
  
####Top 10 rows and last 10 rows
head(airquality,10)
tail(airquality,10)
names(airquality) #names of all columns

# To see entire dataset click on airquality data set name from workspace 
######Columns
airquality[,c(1,2)] # all rows and first two columns
head(airquality,10)
df = airquality[,-6] # excludes column no.6
df
tail(df,3)
#------
#------try to find a way where u can mention the column name that needs to be excluded.
#------

summary(airquality[,1]) # summary statistics for column 1

summary(airquality$Temp)

airquality$Wind # display column values

summary(airquality$Wind) # summary of wind column


###########Summary of the data#########

summary(airquality) # summary for all columns

##################### Visualization
plot(airquality$Wind)
plot(airquality$Temp,airquality$Wind,type="p") 
plot(airquality) #scatterplot
help(plot)
plot(airquality$Ozone,airquality$Temp)
plot(airquality$Temp,airquality$Ozone)

# points and lines 
plot(airquality$Wind, type= "p") # p: points, l: lines,b: both
plot(airquality$Wind, type= "l")
plot(airquality$Wind, type= "b")
help(plot)

plot(airquality$Wind, 
     xlab = 'Ozone Concentration', 
     ylab = 'No of Instances', 
     main = 'Ozone levels in NY city',
     col = 'red',
     type='l')

plot(airquality,col='red') # plot of entire dataset - all columns

plot(airquality$Ozone,airquality$Solar.R)# x axis - Ozone, Y- solar.r
plot(airquality$Solar.R,airquality$Ozone) # x - solar.r, y - ozone


# to identify the outlier barplot is useful
# Horizontal bar plot
barplot(airquality$Ozone, 
        main = 'Ozone Concenteration in air',
        ylab = 'ozone levels', 
        col= 'blue',
        horiz=T,
        axes=T)
help(barplot)

#Histogram

hist(airquality$Temp)

hist(airquality$Temp, 
     main = 'Solar Radiation values in air',
     xlab = 'Solar rad.', 
     col='blue',
     border='red')

help(hist)
#---------------------------------------------oct 1 2024-------------------------------------------
#Single box plot
help(boxplot)
# cant pass multiple coloumns to single boxplot, only one coloumn is used for seperate box,histo,barplot
boxplot(airquality$Wind,
        main="Wind Boxplot",
        col="blue",
        border='red',
        horizontal=T)

boxplot.stats(airquality$Wind)$out #outlier values

airquality$Ozone


# Multiple box plots
#skewness appears because of outliers, long tail
#in square we put index values
boxplot(airquality[,1:4],
        main='Multiple Box Plots',
        horizontal=FALSE,
        col='pink')


#margin of the grid(mar)(bottom,left,top,right), 
#no of rows and columns(mfrow), 
#whether a border is to be included(bty) 
#and position of the 
#labels(las: 1 for horizontal, las: 0 for vertical)
#bty - box around the plot (o,n,7,L,C,U)
help(par)

par(mfrow=c(3,3),mar=c(1,2,1,2),  las=0, bty="7") # bty - box around the plot
plot(airquality$Ozone)
plot(airquality$Ozone, airquality$Wind)
plot(airquality$Ozone, type= "l")
plot(airquality$Wind, type= "l")
plot(airquality$Solar.R, type= "l")
barplot(airquality$Ozone, main = 'Ozone Concenteration in air',
        xlab = 'ozone levels', col='green',horiz = TRUE)
hist(airquality$Solar.R)
boxplot(airquality$Solar.R)
boxplot(airquality[,1:4], main='Multiple Box plots')

par(mfrow=c(1,1))
# Considering NA values
airquality
max(airquality$Wind)
min(airquality$Temp)
min(airquality$Solar.R)
airquality$Solar.R

mean(airquality$Solar.R)
mean(airquality$Wind)
summary(airquality$Solar.R)

summary(airquality)
summary(airquality$Wind)

max(airquality$Solar.R,na.rm=T)
mean(airquality$Solar.R,na.rm=T)

median(airquality$Ozone)
median(airquality$Ozone,na.rm=T)
min(airquality$Ozone)
min(airquality$Ozone,na.rm=T)

# Google following functions as variance in R, etc
#var
#skewness
#kurtosis ----height of the graph
#Density plot


var(airquality$Wind)
sd(airquality$Ozone)#,na.rm = T) Standard Deviation # because of NA values in ozone col - No o/p
sd(airquality$Ozone, na.rm = T)

skewness(airquality$Ozone) #error
kurtosis(airquality$Ozone) #error

# Installing Packages

# when function is not available you have to install some packages/libraries.
# eg. mobile has some in built apps 
# - others download scanner, whatsapp, photo editor from play store
# which library to download for skewness
#google - skewness and kurtosis in r
# go to rbloggers.com
# library(moments)
# or go to rdocumentation.r
# type skewness - you will get the name of package as 'moments'
# go to rstudio
# click on packages in 3rd window - bottom right corner - Click on install
# type moments in packages, click checkbox - install dependencies - click install
# After installation, in search - search for installed 'moments', click that checkbox

# Or try: install.packages("moments")

skewness(airquality$Ozone,na.rm=T) 
kurtosis(airquality$Ozone,na.rm=T) 
skewness(airquality[,1:4],na.rm=T)

# Density Plot
par(mfrow=c(1,1))


# first plot histogram then apply density function
plot(density(airquality$Wind))
plot(density(airquality$Ozone,na.rm=T))
??density  #Check Kernel Density Estimation

data()
## In Class Exercise
e_quakes=datasets::quakes






#var

var(e_quakes$mag)

#skewness

skewness(e_quakes$mag) 


skewness(e_quakes$mag)

mean(e_quakes$mag)

#kurtosis

kurtosis(e_quakes$mag)



# HOME WORK
# iris_data<-datasets::iris
# perform all steps on iris dataset that you have performed on airquality and quakes dataset








# to import xml files in R, first install XML package
# 
# install.packages("XML")




