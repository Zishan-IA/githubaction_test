setwd("C:/Users/zishan.sayyed/OneDrive - Interpublic/Documents/GitLab_IA/sixthsense-main/functions")
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
sheet_id <- "1coARvQYPD2XuUsl6KOhDFCQi1N28l3BVWHpgWxhd5U8"

req_library()

#dates<-read.csv("Dates.csv")
#str(dates)
#dates$start_date <- as.Date(dates$start_date ,format = "%d-%m-%Y")
#dates$end_date <- as.Date(dates$end_date ,format = "%d-%m-%Y")





#Ga4 traffic data

source("GA4_traffic.R")
ga_traffic<-data.frame()
for (i in 1:nrow(dates)) {
  startDate <- dates$start_date[i]
  endDate <- dates$end_date[i]
  
  ga_result <- GA_traffic(ga4_propertyId, startDate, endDate)
  ga_traffic <- bind_rows(ga_traffic, ga_result)
  
}





Sheet_Name <- "ga_traffic"
gs_upload(email_id, sheet_id, Sheet_Name, ga_traffic)




