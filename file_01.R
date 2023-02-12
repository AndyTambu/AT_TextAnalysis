library(twitteR)
library(ROAuth)
library(hms)
library(lubridate) 
library(tidytext)
library(tm)
library(wordcloud)
library(igraph)
library(glue)
library(networkD3)
library(rtweet)
library(plyr)
library(stringr)
library(ggplot2)
library(ggeasy)
library(plotly)
library(dplyr)  
library(hms)
library(lubridate) 
library(magrittr)
library(tidyverse)
library(janeaustenr)
library(widyr)



#Note: Replace below with your credentials following above reference
api_key <- "yBUKMtVObxyq0FgJQfKas0FlN"
api_secret <- "f1KS00WgexCdlh8fYLIc1XJu4MXi6GLFgOdkekeQcJwUx7zMII"
access_token <- "1335973227953348609-W9SpvTEkIGObcwVjBg9DBnFYKB3pDw"
access_token_secret <- "Hgz4mjbw2d1LMXhqUxHWrT5WyIJnkEvG120GXzuTZKXaq"
#Note: This will ask us permission for direct authentication, type '1' for yes:
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

tweets_j <- get_timelines("hadleywickham", 
                        n = 10000, 
                        language = 'en',
                        since = '2014-01-01', 
                        until = '2014-12-31',
                        token = access_token_secret)


auth_as(auth = NULL)

# extracting 5000 tweets related to global warming topic
tweets <- searchTwitter("#ngo", n=4000, lang="en")

tweets <- searchTwitter('ngo', geocode='9.59531,8.09124,800mi', n = 100000, since = "2000-01-01")



n.tweet <- length(tweets)

# convert tweets to a data frame
tweets.df <- twListToDF(tweets)

tweets.txt <- sapply(tweets, function(t)t$getText())
# Ignore graphical Parameters to avoid input errors
tweets.txt <- str_replace_all(tweets.txt,"[^[:graph:]]", " ")

## pre-processing text:
clean.text = function(x)
{
  # convert to lower case
  x = tolower(x)
  # remove rt
  x = gsub("rt", "", x)
  # remove at
  x = gsub("@\\w+", "", x)
  # remove punctuation
  x = gsub("[[:punct:]]", "", x)
  # remove numbers
  x = gsub("[[:digit:]]", "", x)
  # remove links http
  x = gsub("http\\w+", "", x)
  # remove tabs
  x = gsub("[ |\t]{2,}", "", x)
  # remove blank spaces at the beginning
  x = gsub("^ ", "", x)
  # remove blank spaces at the end
  x = gsub(" $", "", x)
  # some other cleaning text
  x = gsub('https://','',x)
  x = gsub('http://','',x)
  x = gsub('[^[:graph:]]', ' ',x)
  x = gsub('[[:punct:]]', '', x)
  x = gsub('[[:cntrl:]]', '', x)
  x = gsub('\\d+', '', x)
  x = str_replace_all(x,"[^[:graph:]]", " ")
  return(x)
}

cleanText <- clean.text(tweets.txt)
# remove empty results (if any)
idx <- which(cleanText == " ")
cleanText <- cleanText[cleanText != " "]




tweets.df %<>% 
  mutate(
    created = created %>% 
      # Remove zeros.
      str_remove_all(pattern = '\\+0000') %>%
      # Parse date.
      parse_date_time(orders = '%y-%m-%d %H%M%S')
  )

tweets.df %<>% 
  mutate(Created_At_Round = created%>% round(units = 'hours') %>% as.POSIXct())

tweets.df %>% pull(created) %>% min()
## [1] "2021-10-05 01:34:17 UTC"
tweets.df %>% pull(created) %>% max()
## [1] "2021-10-08 01:25:52 UTC"
plt <- tweets.df %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()




library(rtweet)
rt <- search_tweets(
  "lang:en", geocode = lookup_coords("usa"), n = 10000
)
Stream example from the help page:
  
  stream_tweets(
    "realdonaldtrump,trump",
    timeout = 60 * 60 * 24 * 7,
    file_name = "tweetsabouttrump.json",
    parse = FALSE,
    lookup_coords("usa")
  )


kk <- searchTwitter( c('covid-19'), 
               'en', 
               lookup_coords("nigeria"))







