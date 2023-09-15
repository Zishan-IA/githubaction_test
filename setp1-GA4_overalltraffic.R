
client_secret<-'client_secret_.json'
service_key<-"serviceKey.json"

email_id="zishan.sayyed@interactiveavenues.com"
startDate<-Sys.Date() - 1
endDate<-Sys.Date() - 1
  
website_url<-"https://www.zodiaconline.com/"

#google ads
gads_client_id <- '6628363442'

#Ga4
ga4_propertyId<-271808317

source("req_library.R")
source("gs_upload.R")
#sheet_id <- "1coARvQYPD2XuUsl6KOhDFCQi1N28l3BVWHpgWxhd5U8"

req_library()

#dates<-read.csv("Dates.csv")
#str(dates)
#dates$start_date <- as.Date(dates$start_date ,format = "%d-%m-%Y")
#dates$end_date <- as.Date(dates$end_date ,format = "%d-%m-%Y")





#Ga4 traffic data

source("GA4_traffic.R")
ga_result <- GA_traffic(ga4_propertyId, startDate, endDate)
#ga_traffic <- bind_rows(ga_traffic, ga_result)
install.packages('readr')
library(readr)

ga_csv<-read.csv("zodiac_sixth_sense - ga_traffic.csv")

final_ga_data<-rbind(ga_csv,ga_result)
#write.csv(final_ga_data,"zodiac_sixth_sense - ga_traffic.csv",row.names = FALSE)

final_ga_data %>%
  write_rds("final_ga_data.rds")




#Sheet_Name <- "ga_traffic"
#gs_upload(email_id, sheet_id, Sheet_Name, ga_traffic)





