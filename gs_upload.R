

gs_upload <- function(email_id, sheet_id, Sheet_Name, df, chunk_size = 5000) {
  gs4_auth(email = email_id)
  drive_auth(email = email_id)
  
  file_id <- googledrive::as_id(x = sheet_id)
  excel <- gs4_get(file_id)
  
  for (i in seq(1, nrow(df), chunk_size)) {
    chunk <- df[i:(i + chunk_size - 1), ]
    excel %>% sheet_append(chunk, sheet = Sheet_Name)
  }
}




