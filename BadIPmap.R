library(rworldmap)
library(IPtoCountry)
library(varhandle)
library(readr)
ipblack_v2 <- read_delim("~/ipblack.csv", 
                         +     ";", escape_double = FALSE, col_names = FALSE, 
                         +     trim_ws = TRUE)
ip_geo <- IP_location(ipblack_v2$X1)
sapply(ip_geo, class)
ip_geo$long <- unfactor(ip_geo$long)
ip_geo$lat <- unfactor(ip_geo$lat)
newmap <- getMap(resolution = "low")
plot(newmap)
points(ip_geo$long, ip_geo$lat, col = "red", cex = .5)