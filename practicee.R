a<-5
b<-10
c=a+b
c

#Vectors
x=c(1,2,3,4)
x*2
y= seq(1,5)
y
z=1:5
z
names(x)<-letters[1:4]
x
#Accessing vectors
x[1]
x['c']
x[-3]
x[-seq(1:2)]
x[x==2]
x<2

#factors
gender= factor(c("Male", "Female", "Male"))
levels(gender)





#Loading Data
df<- data.frame( name=c('Gold','Deepthi'),
                 Age= c(23,19))
df$name
data= read.csv("heights.csv")
str(data)
View(data)
#Dplyr

install.packages("dplyr")
library(dplyr)


#Pipeline operators.
data %>% 
  filter(What.is.your.gender.=="Male") %>%
  select(What.is.your.gender.)

#select, filter, summarize, mutate, group_by, rename, arrange
select(data, What.is.your.gender.)
data= data %>% 
  rename(Gender=What.is.your.gender.,Height= What.is.your.height..in.inches.. )
  
select(data, Gender, Height)
arrange(data, Height)
summarize(df, avg_age= mean(Age))
table(data[[2]])
sort(data[[3]])
df1= mutate(data, Numeric_height= as.numeric(Height), Given_height=Height)
View(df1)


#Cleaning data,null values
sum(is.na(as.numeric(data$Height)))
View(df1)

#where the values in heights are not in correct format

df1 %>% filter(is.na(Numeric_height)) %>% select(Numeric_height,Height)
    
library(stringr)

data=df1 %>%
  mutate(Height = str_replace(Height, "ft", "'")) %>% 
# We remove all occurrences of '"', 'inches', ' ' (space) and ''''.
  mutate(Height = str_replace_all(Height, "\"|inches|\ |''", ""))

View(data)














#Visualization, ggplot
install.packages("tidyverse")
library(ggplot2)

ggplot(data, aes(x = c(10,20,30,40), y = c(5,10,15,20))) +
  geom_point()
  
  
  
  
