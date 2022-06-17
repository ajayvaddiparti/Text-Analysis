######Extracting trending twitter hashtags by city#######

#The intent of pulling this data is to verify if the hashtags trending are influenced by the presidential frontrunner in that particular city

#Extracting any twitter data (rest, live, timeline) requires you to register as a developer on Twitter and create a Twitter app

#Install and load up the required packages

library("twitteR")
library("ROAuth")

#Setup connection to Twitter using authentication
setup_twitter_oauth(consumer_key = "--------------",consumer_secret = "------------",access_token = "--------------",access_secret = "--------------") #consumer key, consumer secret, access token, access secret can be found in your twitter app in your twitter dev account

#Check which cities the trending data is available for
availableTrendLocations()

#Location IDs 336 to 398 represent cities in the USA

for(i in c(336:398)){
  Sys.sleep(60)
  woeid <- availableTrendLocations()
  All_US <- woeid[c(i),3]
  Trends[[i-335]] <- getTrends(All_US)
} 

#Convert to data frame and save the file locally

trending_data <- do.call("rbind",lapply(Trends,as.data.frame))
write.csv(trending_data,"<file path and name>")
