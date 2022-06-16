######Extracting live data from Twitter based on keywords/hashtags#######

#This piece of code was used to pull live reactions on Twitter during the third and final debate between Donald Trump and Hillary Clinton during the 2016 US presidential elections
#Extracting any twitter data (rest, live, timeline) requires you to register as a developer on Twitter and create a Twitter app

#Install all requisite packages

rm(list=ls())
install.packages("twitteR")
install.packages("ROAuth")
install.packages("RCurl")
library(twitteR)
library(ROAuth)
library(RCurl)

# PART 1: Authorize your twitter dev account via R

#Declare Twitter API Credentials & Create Handshake
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

#Input Credentials in objects
consumerKey <- "----------------" # Input your consumer key from dev.twitter.com
consumerSecret <- "---------------" # Input your consumer secret from dev.twitter.com

my_oauth <- OAuthFactory$new(consumerKey = consumerKey,
                             consumerSecret = consumerSecret,
                             requestURL = requestURL,
                             accessURL = accessURL,
                             authURL = authURL)

my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

#Paste the pin below and run it (ctrl +  enter)
#Pin to be pasted here

#Your stuff here
setup_twitter_oauth(consumer_key = "--------------",consumer_secret = "------------",access_token = "--------------",access_secret = "--------------")

### STOP HERE!!! ###

# PART 2: Save the my_oauth data to an .Rdata file
save(my_oauth, file = "my_oauth.Rdata")

install.packages("streamR")
library(streamR)
load("my_oauth.Rdata")

# PART 3: Initiate the download of live tweet data pertaining to particular keywords/hashtags

#Run the below code to initiate the streaming. The timeout is currently 5 minutes. Run this code every 5 minutes.
filterStream(file.name = "tweets30.json", # Save tweets in a json file
             track = c("Election2016","ElectionDay","ElectionNight"), # Collect tweets mentioning either debate or debate night. If you have other hashtags of interests, feel free to add them
             language = "en",
             timeout = 300, # Keep connection alive for 5 minutes
             oauth = my_oauth) # Use my_oauth file as the OAuth credentials

#After each run of the above code, extract the file by running this. CHANGE FILE NAME BEFORE RUNNING TO AVOID OVER-WRITING.
tweetfile_1.df <- parseTweets("tweets1.json",simplify = FALSE)
write.csv(tweets31.df,file = "<filename>.csv")
