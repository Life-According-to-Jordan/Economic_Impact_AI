#resources
#https://usa.ipums.org/usa-action/downloads/extract_files/usa_00003.do
#https://www3.nd.edu/~steve/computing_with_data/24_dplyr/dplyr.html
#http://rprogramming.net/recode-data-in-r/
#https://www.google.com/search?q=match+010+in+one+dataframe+with+the+name+in+another+column+r&oq=match+010+in+one+dataframe+with+the+name+in+another+column+r&aqs=chrome..69i57.25152j0j1&sourceid=chrome&ie=UTF-8
#

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

state_grouping_01<- filter(data, states == "Connecticut")
state_grouping_02<- filter(data, states == "Maine")
state_grouping_03<- filter(data, states == "Massachusett")
state_grouping_04<- filter(data, states == "NewHampshire")
state_grouping_05<- filter(data, states == "RhodeIsland")
state_grouping_06<- filter(data, states == "Vermont")
state_grouping_07<- filter(data, states == "Delaware")
state_grouping_08<- filter(data, states == "NewJersey")
state_grouping_09<- filter(data, states == "NewYork")
state_grouping_10<- filter(data, states == "Pennsylvania")
state_grouping_11<- filter(data, states == "Illinois")
state_grouping_12<- filter(data, states == "Indiana")
state_grouping_13<- filter(data, states == "Michigan")
state_grouping_14<- filter(data, states == "Ohio")
state_grouping_15<- filter(data, states == "Wisconsin")
state_grouping_16<- filter(data, states == "Iowa")
state_grouping_17<- filter(data, states == "Kansas")
state_grouping_18<- filter(data, states == "Minnesota")
state_grouping_19<- filter(data, states == "Missouri")
state_grouping_20<- filter(data, states == "Nebraska")
state_grouping_21<- filter(data, states == "North_Dakota")
state_grouping_22<- filter(data, states == "South_Dakota")
state_grouping_23<- filter(data, states == "Virginia")
state_grouping_24<- filter(data, states == "Alabama")
state_grouping_25<- filter(data, states == "Arkansas")
state_grouping_26<- filter(data, states == "Florida")
state_grouping_27<- filter(data, states == "Georgia")
state_grouping_28<- filter(data, states == "Louisiana")
state_grouping_29<- filter(data, states == "Mississippi")
state_grouping_30<- filter(data, states == "NorthCarolina")
state_grouping_31<- filter(data, states == "SouthCarolina")
state_grouping_32<- filter(data, states == "Texas")
state_grouping_33<- filter(data, states == "Kentucky")
state_grouping_34<- filter(data, states == "Maryland")
state_grouping_35<- filter(data, states == "Oklahoma")
state_grouping_36<- filter(data, states == "Tennessee")
state_grouping_37<- filter(data, states == "WestVirginia")
state_grouping_38<- filter(data, states == "Arizona")
state_grouping_39<- filter(data, states == "Colorado")
state_grouping_40<- filter(data, states == "Idaho")
state_grouping_41<- filter(data, states == "Montana")
state_grouping_42<- filter(data, states == "Nevada")
state_grouping_43<- filter(data, states == "NewMexico")
state_grouping_44<- filter(data, states == "Utah")
state_grouping_45<- filter(data, states == "Wyoming")
state_grouping_46<- filter(data, states == "California")
state_grouping_47<- filter(data, states == "Oregon")
state_grouping_48<- filter(data, states == "Washington")
state_grouping_49<- filter(data, states == "Alaska")
state_grouping_50<- filter(data, states == "Hawaii")


##########################################
#Next step is to categorize jobs as a subtitute
#or a complement to ai and from there, we'll 
#simply divide the number of jobs at risk by
#the total number of jobs to retrieve the percentage
#at risk for technical unemployment 
#then we'll map the US by state and their 
#associated risk factor on a map to visualize
#the potential impact.
