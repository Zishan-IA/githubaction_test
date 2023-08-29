
GA_traffic<- function(ga4_propertyId, startDate, endDate) {
  ga_auth(json_file =service_key)
  traffic <- ga_data(
    propertyId=ga4_propertyId,
    metrics = c("totalUsers"),
    dimensions = c("date","sessionDefaultChannelGrouping"),
    date_range = c(startDate, endDate),
    limit = 100000
    
  )
  return(traffic)
}


