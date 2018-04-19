#Helpful Resources

#https://usa.ipums.org/usa-action/downloads/extract_files/usa_00003.do
#https://www3.nd.edu/~steve/computing_with_data/24_dplyr/dplyr.html
#http://rprogramming.net/recode-data-in-r/
#https://www.google.com/search?q=match+010+in+one+dataframe+with+the+name+in+another+column+r&oq=match+010+in+one+dataframe+with+the+name+in+another+column+r&aqs=chrome..69i57.25152j0j1&sourceid=chrome&ie=UTF-8


##############################################################################
#First I need to subset the states from the data 

#Then, I need to group the occupations as substitute or compliment for AI

#Then, generate percentages of jobs that are at risk for each state 
##############################################################################


#library
library("stringr")
library("dplyr")

#load data 
data<-read.table("usa_occupations.dat")
state_code<-read.csv("state_codes.csv")
occupations<-read.csv("occupation_codes.csv")

#add new columns to data
data$year    <-2016
data$state   <-NA
data$occ2010 <-NA

#stateicp  1-2  
#occ2010   3-6

#split data into new columns
data$state <-str_sub(data$V1, start = 1,  end = 2)
data$occ2010 <-str_sub(data$V1, start = 3, end = 6)

#remove initial column
data <- subset(data, select = -V1 )

#recode data state codes with states
data$states[data$state==01]<-"Connecticut"
data$states[data$state==02]<-"Maine"
data$states[data$state==03]<-"Massachusetts"
data$states[data$state==04]<-"NewHampshire"
data$states[data$state==05]<-"RhodeIsland"
data$states[data$state==06]<-"Vermont"
data$states[data$state==11]<-"Delaware"
data$states[data$state==12]<-"NewJersey"
data$states[data$state==13]<-"NewYork"
data$states[data$state==14]<-"Pennsylvania"
data$states[data$state==21]<-"Illinois"
data$states[data$state==22]<-"Indiana"
data$states[data$state==23]<-"Michigan"
data$states[data$state==24]<-"Ohio"
data$states[data$state==25]<-"Wisconsin"
data$states[data$state==31]<-"Iowa"
data$states[data$state==32]<-"Kansas"
data$states[data$state==33]<-"Minnesota"
data$states[data$state==34]<-"Missouri"
data$states[data$state==35]<-"Nebraska"
data$states[data$state==36]<-"NorthDakota"
data$states[data$state==37]<-"SouthDakota"
data$states[data$state==40]<-"Virginia"
data$states[data$state==41]<-"Alabama"
data$states[data$state==42]<-"Arkansas"
data$states[data$state==43]<-"Florida"
data$states[data$state==44]<-"Georgia"
data$states[data$state==45]<-"Louisiana"
data$states[data$state==46]<-"Mississippi"
data$states[data$state==47]<-"NorthCarolina"
data$states[data$state==48]<-"SouthCarolina"
data$states[data$state==49]<-"Texas"
data$states[data$state==51]<-"Kentucky"
data$states[data$state==52]<-"Maryland"
data$states[data$state==53]<-"Oklahoma"
data$states[data$state==54]<-"Tennessee"
data$states[data$state==56]<-"WestVirginia"
data$states[data$state==61]<-"Arizona"
data$states[data$state==62]<-"Colorado"
data$states[data$state==63]<-"Idaho"
data$states[data$state==64]<-"Montana"
data$states[data$state==65]<-"Nevada"
data$states[data$state==66]<-"NewMexico"
data$states[data$state==67]<-"Utah"
data$states[data$state==68]<-"Wyoming"
data$states[data$state==71]<-"California"
data$states[data$state==72]<-"Oregon"
data$states[data$state==73]<-"Washington"
data$states[data$state==81]<-"Alaska"
data$states[data$state==82]<-"Hawaii"

#group occupations by state
state_grouping_01 <- filter(data, states == "Alabama")

state_grouping_01




