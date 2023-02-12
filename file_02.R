## load rtweet
library(rtweet)
## load the tidyverse
library(tidyverse)
## store api keys (these are fake example values; replace with your own keys)
api_key <- "yBUKMtVObxyq0FgJQfKas0FlN"
api_secret_key <- "f1KS00WgexCdlh8fYLIc1XJu4MXi6GLFgOdkekeQcJwUx7zMII"
## authenticate via web browser
token <- create_token(
  app = "rstatsjournalismresearch",
  consumer_key = api_key,
  consumer_secret = api_secret_key)
get_token()

rt <- search_tweets("#DataScience", n = 1000, include_rts = FALSE)
View(rt)

auth_get()
auth_as(my_app)
my_app <-rtweet_app(
  "AAAAAAAAAAAAAAAAAAAAAIu%2BKQEAAAAAeqDhfFHMTUIbxX%2FWejDsB80JF0s%3DcAxcbtzPMuHf3XxGsGQKxE66pgsGA7CJs8UK0GUkNvk7NTtgfE"
)



tweets <- get_timeline("openAI", 
                        n = 10000, 
                        language = 'en')



tweets_ShannonVallor <- get_timelines("ShannonVallor", 
                        n = 10000, 
                        language = 'en')

tweets_ShannonVallor %>% View()


tweets_MCoeckelbergh <- get_timelines("MCoeckelbergh"


auths <- c('Floridi', 'katecrawford', 'spillteori', 'SSorgner', 'PaulNemitz', 'SvenNyholm', 'jud1ths1mon', 
'EthicsInAI', 'AdaLovelaceInst', 'TechneSPT', 'David_Gunkel', 'VincentCMueller', 'Dr_Atoosa', 'emilymbender',
'sethlazar', 'ppverbeek', 'WesselReijers', 'symboliev')


all_the_tweets <- lapply(auths, function(x) get_timelines(x,n = 100, 
                                             language = 'en') %>% as_tibble())

save(all_the_tweets, file = "all_the_tweets.rds")






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
