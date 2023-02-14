getwd()
# here I use a recursive version of the get_timeline function from the rtweet package for all the different authors and I get the total
# collection of their tweets. It is important to mention that what I get is actually the whole amount of tweets from them where 
# they mentioned the 

save(all_the_tweets, file = "all_the_tweets.rds")

all_the_tweets %>% head()




load('all_the_tweets.RData')
auths %>% length()

tweets_floridi <- all_the_tweets[,1]

tweets_floridi_tbl <- 
tweets_floridi %>% 
  data.frame() %>% 
  as_tibble()




tweetsGPT <- search_tweets("chatGPT OR ChatGPT or CHATGPT")

tweets_ShannonVallor %>%  
filter(str_detect(full_text, 'authorship')) %>% 
  View()


rt <- search_fullarchive("AI", env_name = "SetYourLabel",
                         fromDate = "201401010000", toDate = "201401312359")
toDate <- format(Sys.time() - 60 * 60 * 24 * 7, "%Y%m%d%H%M")

rt <- search_30day("#rstats", n = 300,
                   env_name = "", toDate = toDate)



my_app <- rtweet_app()
auth_as(my_app)
1335973227953348609-2NtAXaHivOIjxRtZE04RBsbhhgclx6


DOcurxyWf37TKW6tey4biN26cQM4OdvStgelh2kwAGF0X

access_token <- "1335973227953348609-W9SpvTEkIGObcwVjBg9DBnFYKB3pDw"
access_token_secret <- "Hgz4mjbw2d1LMXhqUxHWrT5WyIJnkEvG120GXzuTZKXaq"









rt <- search_fullarchive("#rstats", n = 300, env_name = "SetYourLabel",
                         fromDate = "201401010000", toDate = "201401312359")




my_list <- list(A = c(1, 2, 3), B = c(4, 5, 6))

# Unlist the list and store the elements as columns in a tibble
result <- my_list %>% 
  data.frame() %>% 
  as_tibble()
