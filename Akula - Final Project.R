library(tidyverse)
library(ggplot2)
library(tidyr)
data<-read.csv("2005-19_Local_Authority_CO2_emissions.csv")
my_data<-na.omit(data)
str(my_data)
summary(my_data$Territorial.emissions)

#Bar plot for CO2 emissions and sectors with fill as country
ggplot(my_data, aes(CO2.Sector, Territorial.emissions, fill = Country))+geom_bar(position = "stack" ,stat = "identity")+
  labs(x = "Sector wise CO2 Emissions",
       y = "Emissions", 
       title = "Sector Emissions",
       fill = "Country")+
  labs(title="Sector Emissions")+
  scale_fill_manual(values=
                      c("salmon", rgb(.90,.90,0),
                        rgb(0,.75,0), "magenta"),
                    na.value = "gray30")
  
#Bar plot for CO2 emissions and sub sectors with sectors as filled parameter
ggplot(my_data, aes(LA.CO2.Sub.sector, Territorial.emissions, fill = CO2.Sector))+
    geom_bar(stat="identity", position = "dodge")+coord_flip()+
  labs(x = "CO2 Emissions",
       y = "Emissions", 
       title = "Sub-Sector",
       fill = "Sector")+
  labs(title="Sub-Sector Emissions")+
  scale_fill_manual(values=
                      c("salmon", "green", "pink", "magenta","skyblue","maroon"))

#Bar plot for Emissions and Calendar year

ggplot(my_data, aes(Calendar.Year, Territorial.emissions, fill = Country ))+
  geom_bar(stat= "identity")+
  labs(x = "Year",
       y = "CO2 Emissions",
       fill = "COuntry")+
  labs(title="Territorial Emissions changes with Year")

#COrrelation for Year and Emissions

cor(my_data$Calendar.Year, my_data$Territorial.emissions)

plot(my_data$Calendar.Year,my_data$Territorial.emissions,pch = 19, col = "lightblue")

#COrrelation for Area and Emissions


cor(my_data$Area..km2., my_data$Territorial.emissions)

plot(my_data$Area..km2.,my_data$Territorial.emissions,pch = 19, col = "lightblue")

#COrrelation for Population and Emissions

cor(my_data$Mid.year.Population..thousands., my_data$Territorial.emissions)

#linear model

lm.all<- lm(Territorial.emissions~Calendar.Year+Mid.year.Population..thousands.+Area..km2., data = my_data)
plot(lm.all)
summary(lm.all)

#improved linear model

lm.all1<- lm(log(Territorial.emissions)~log(Calendar.Year)+log(Mid.year.Population..thousands.)+log(Area..km2.), data = my_data)
par(mfrow=c(2,2))
plot(lm.all1)
summary(lm.all1)

