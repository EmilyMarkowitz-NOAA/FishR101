

#Vinettes

library("googledrive")

# https://googledrive.tidyverse.org/
# https://docs.google.com/spreadsheets/d/1NkG331BZW_Q9PuzdhEgW5rB6vkLe0K_Dd1K3iFrAFNw/edit?usp=sharing
drive_deauth()
drive_auth()
1
# drive_download("R Workshop for GAP: Video Links", type = "csv", overwrite = TRUE, path = "./R Workshop Video Links")
drive_download("R Workshop for GAP: Agenda Items", type = "csv", overwrite = TRUE, path = "./R Workshop Detailed Schedule")
# drive_download("R Workshop for GAP: Discussion", type = "csv", overwrite = TRUE, path = "./R Workshop Discussion")


#### Download GitHub Icons
# library(imagefx)
library(webshot)
# library(OpenImageR)
members<-data.frame("Name" = c("Caitlin Allen Akselrud", "Emily Markowitz"), 
                    "First Name" = c("Caitlin", "Emily"),
                    "Last Name" = c("Allen Akselrud", "Markowitz"),
                    "github" = c("CaitlinAkselrud-NOAA", "EmilyMarkowitz-NOAA"), 
                    "lat" = c(47.640816, 47.640816), 
                    "lon" = c(-122.669898, -122.669898), 
                    "Institution" = c("Eastern Bering Sea Group", 
                                      "Eastern Bering Sea Group"))
members$imagelink<-members$githublink<-NA                 
members$Status<-"Presenter"
for (i in 1:nrow(members)) {
  # if (!(members$github[i] %in% "")) {
    members$imagelink[i]<-paste0("./images/", gsub(pattern = " ", replacement = "", 
                                                        x = members$Name[i]), 
                                 ".png")
    webshot(url = paste0("https://github.com/", members$github[i]),
            file = members$imagelink[i], 
            cliprect	 = "viewport", 
            vwidth = 300, vheight = 350)
  # } else {
  #   members$githublink[i]<-paste0("https://github.com/")
  #   members$imagelink[i]<-paste0("./docs/images/noaa_logo.gif")   
  #   webshot(url = paste0("https://github.com/", members$github[i]),
  #           file = members$imagelink[i], 
  #           cliprect	 = "viewport", 
  #           vwidth = 300, vheight = 500)
  # }
  # my_repos <- gh("GET /users/emilyhmarkowitz/repos")
  # vapply(my_repos, "[[", "", "name")
}

