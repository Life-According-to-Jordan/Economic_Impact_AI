#load library
library(googleVis)

#load data 
data<-read.csv("states2.csv")

#preview data 
head(data)

#view names of data 
names(data)

#require(datasets)
GeoStates <- gvisGeoChart(data, "state.name", "Total.industrial.robots.2015",
                          options=list(region="US", 
                                       displayMode="regions", 
                                       resolution="provinces",
                                       width=600, height=400))
plot(GeoStates)
