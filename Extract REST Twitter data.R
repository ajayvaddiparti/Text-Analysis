######Extracting rest data from Twitter based on keywords/hashtags#######

#This piece of code was used to pull tweets with the specified hashtags/keywords, namely after Donald Trump coined the term Crooked Hillary to refer to his opponent in the presidential election
#Extracting any twitter data (rest, live, timeline) requires you to register as a developer on Twitter and create a Twitter app

#Install and load up the required packages

library("twitteR")
library("ROAuth")

#Setup connection to Twitter using authentication
setup_twitter_oauth(consumer_key = "--------------",consumer_secret = "------------",access_token = "--------------",access_secret = "--------------") #consumer key, consumer secret, access token, access secret can be found in your twitter app in your twitter dev account

#Pull tweets specific to a keyword
tweets_record <- searchTwitter(searchString = "#CrookedHillary", n= 8000, since = "2016-11-08", until = "2016-11-09",retryOnRateLimit = 2) #specifying the keyword/hashtag, the number of tweets to pull, and the date range within which to look

original_tweets <- strip_retweets(tweets_record, strip_manual=TRUE, strip_mt=TRUE) #strip tweets which are simply retweets, i.e. duplicates for our purpose

original_tweets_table = twListToDF(original_tweets) #convert to a R data frame

#Store only relevant data about tweets (Favorites recounts, created at)
data_table <<- original_tweets_table[,c(1,3,5,11,12,13,14)] #Examine original_tweets_table in R to inspect which data is relevant for your analysis

write.csv(data_table,file=paste("#CrookedHillary","2016-11-08","2016-11-09",".csv")) #make filenames specific to the keyword and date range required