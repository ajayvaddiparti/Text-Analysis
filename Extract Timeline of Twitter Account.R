######Extracting the latest N tweets from a particular user's timeline#######

#This piece of code was used to pull the latest N tweets from a specified user's timeline. It requires the twitter handle of that user to be provided as a parameter.
#Extracting any twitter data (rest, live, timeline) requires you to register as a developer on Twitter and create a Twitter app

#Install and load up the required packages

library("twitteR")
library("ROAuth")

#Setup connection to Twitter using authentication
setup_twitter_oauth(consumer_key = "--------------",consumer_secret = "------------",access_token = "--------------",access_secret = "--------------") #consumer key, consumer secret, access token, access secret can be found in your twitter app in your twitter dev account

#Extract tweets of specified user
HillaryClinton <- userTimeline('HillaryClinton', n=3200) 

HillaryClinton_table <- twListToDF(HillaryClinton) #convert object to R dataframe

#Save only relevant columns
HillaryClinton_table_short = HillaryClinton_table[,c(1,5,11,12,13,14)] #Inspect the data frame to see which data (likes etc) you want to retain
save(HillaryClinton_table_short, file ="Timeline@HillaryClinton.rda") #Save file locally