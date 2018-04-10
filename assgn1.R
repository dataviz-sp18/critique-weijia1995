### Use dataset from https://www.kaggle.com/START-UMD/gtd

### National Consortium for the Study of Terrorism and Responses to Terrorism (START). (2016). 
### Global Terrorism Database [Data file]. Retrieved from https://www.kaggle.com/START-UMD/gtd

require(ggplot2)
library(RColorBrewer)
library(data.table)
require(reshape2)
require(ggmap)
require(scales)
require(rgeos)
require(rangeMapper)
require(zoo)
library(rattle)
source("http://peterhaschke.com/Code/multiplot.R")

dt.crimes_ld <- fread("~/Downloads/Crimes_chi.csv", header=TRUE,sep=",")
dt.crimes <- dt.crimes_ld[Year>=2007]
colnames(dt.crimes)
dt.crimes[, c("Beat","FBI Code","X Coordinate","Y Coordinate","Location") := NULL]
rexp <- "\\d{2}/\\d{2}/\\d{4}\\s?(.*)$"
dt.crimes$Time=sub(rexp,"\\1",dt.crimes$Date)
dt.crimes$Date<-as.Date(dt.crimes$Date,format='%m/%d/%Y')

crime_index <- fread("~/Downloads/IUCR__Codes.csv", header=TRUE,sep=",",colClasses = c(IUCR="character"), 
                     drop = c("PRIMARY DESCRIPTION","SECONDARY DESCRIPTION"))

dt.crimes$IUCR<-sub("[0](?=\\d{3})", "", dt.crimes$IUCR,perl = TRUE) 
setkey(crime_index,"IUCR")
setkey(dt.crimes,"IUCR")
dt.crimes.ind<-dt.crimes[crime_index]

### Indexed crimes are more serious crimes that need to be reported to FBI
ind.crimes<-dt.crimes.ind[`INDEX CODE`=="I"& Domestic=="false"]

locations=ind.crimes[,.N,by=`Location Description`][order(-N)][1:70]$`Location Description`
ind.crimes.u=ind.crimes[`Location Description` %in% locations]
ind.crimes.u[, c("Beat","Updated On","FBI Code","X Coordinate","Y Coordinate","Location") := NULL]

rlocations=locations[grep("AIRPORT|CONSTRUCTION|CHA |YARD|ABANDONED|HOUSE|VACANT|OTHER|SCHOOL|NURSING|DAY CARE CENTER|PORCH|FACTORY/MANUFACTURING BUILDING",locations)]

ind.crimes.u=ind.crimes.u[!`Location Description` %in% rlocations]
ind.crimes.u=ind.crimes.u[!`Location Description` %in% c("","ATHLETIC CLUB")]

ind.crimes.u[`Location Description` %in% c("CONVENIENCE STORE", "GROCERY FOOD STORE"),"Location Description"]="SMALL RETAIL STORE"
ind.crimes.u[`Location Description` %in% c("PARK PROPERTY","LAKEFRONT/WATERFRONT/RIVERBANK"),"Location Description"]="PARK"
ind.crimes.u[`Location Description` %in% c("CTA BUS","CTA TRAIN","CTA PLATFORM","CTA STATION","CTA BUS STOP"),"Location Description"]="PUBLIC TRANSPORTATION"
ind.crimes.u[`Location Description` %in% c("CAR WASH"),"Location Description"]="GAS STATION"
ind.crimes.u[`Location Description` %in% c("BAR OR TAVERN","RESTAURANT"),"Location Description"]="RESTAURANT/BAR"
ind.crimes.u[`Location Description` %in% c("BANK","CURRENCY EXCHANGE","ATM (AUTOMATIC TELLER MACHINE)"),"Location Description"]="BANK/ATM"
ind.crimes.u[`Location Description` %in% c("HOSPITAL BUILDING/GROUNDS","MEDICAL/DENTAL OFFICE"),"Location Description"]="MEDICAL BUILDINGS"
ind.crimes.u[`Location Description` %in% c("BRIDGE","SIDEWALK"),"Location Description"]="STREET"
ind.crimes.u[`Location Description` %in% c("TAXICAB"),"Location Description"]="VEHICLE-COMMERCIAL"
ind.crimes.u[`Location Description` %in% c("CLEANING STORE","BARBERSHOP","APPLIANCE STORE"),"Location Description"]="SMALL BUSINESS STORE"
ind.crimes.u[`Location Description` %in% c("PARKING LOT/GARAGE(NON.RESID.)"),"Location Description"]="PARKING LOT"

ind.crimes.u$Time = as.ITime(ind.crimes.u$Time,format = "%I:%M:%S %p")
ind.crimes.u$Date<-as.Date(ind.crimes.u$Date,format='%m/%d/%Y')


nrow(ind.crimes.u)/nrow(ind.crimes)

violent.u<-ind.crimes.u[`Primary Type` %in% c("ASSAULT","BATTERY","CRIM SEXUAL ASSAULT","HOMICIDE","KIDNAPPING","ROBBERY")]

murder=dt.crimes[`Primary Type` == "HOMICIDE"]
rob=dt.crimes[`Primary Type` == "ROBBERY"]

drug=dt.crimes[`Primary Type` %in% c("NARCOTICS","OTHER NARCOTIC VIOLATION")]
nrow(drug)
drunk=dt.crimes[`Primary Type` == "LIQUOR LAW VIOLATION"]
nrow(drunk)
theft=dt.crimes[`Primary Type` == "THEFT"]
nrow(theft)
motor=dt.crimes[`Primary Type` == "MOTOR VEHICLE THEFT"]
nrow(motor)

### Plot of violent crimes in Chicago and near Uchicago
violent.u$IUCR1<-gsub("(^[0])|(\\D)","",violent.u$IUCR)
violent.u$IUCR1<-ifelse(as.numeric(violent.u$IUCR1)<100,310,as.numeric(violent.u$IUCR1))


community=fread("~/Downloads/CommAreas.csv",header=TRUE)
district=fread("~/Downloads/PoliceDistrictDec2012.csv",header=TRUE)
district$DIST_NUM[4]=31.1
district$DIST_LABEL[4]="31ST1"

district$DIST_NUM[8]=31.2
district$DIST_LABEL[8]="31ST2"


str <- lapply(community$the_geom, "readWKT", p4s=CRS("+proj=longlat +datum=WGS84"))
coords <- mapply(spChFIDs, str, as.character(community$AREA_NUM_1))
community=community[,c("the_geom"):=NULL]

spDF <- SpatialPolygonsDataFrame(SpatialPolygons(unlist(lapply(coords, function(x) x@polygons)),
                                                 proj4string=CRS("+proj=longlat +datum=WGS84")),community)
csp=fortify(spDF,region = "AREA_NUM_1")


str <- lapply(community$the_geom, "readWKT", p4s=CRS("+proj=longlat +datum=WGS84"))
coords <- mapply(spChFIDs, str, as.character(community$AREA_NUM_1))
data <- SpatialPolygonsDataFrame(SpatialPolygons(unlist(lapply(coords, function(x) x@polygons)),proj4string=CRS("+proj=longlat +datum=WGS84")), community[,-1])
csp=fortify(data,region = 'AREA_NUM_1')
centerids=coordinates(data)
community[,the_geom := NULL]

cmmArea=ggplot()+  geom_polygon(data = csp,aes(x=long,y=lat,group=group),
                                color=alpha("white",0.8),size=0.3,fill=alpha('grey',0.6))+
  geom_text(data=dddd,aes(x=long,y=lat,label=AREA_NUM_1),size=4)

theme_set(theme_grey(16))

chitown=geocode("3300 S Federal St, Chicago, IL 60616")
uchi=geocode("5801 S Ellis Ave, Chicago, IL 60637")
myMap <-get_map(location=chitown,source="google",maptype = "roadmap", color="bw",zoom = 11)
UMap <-get_map(location=uchi,source="google",maptype = "roadmap", color="bw",zoom = 14)

# p3 Points violent crimes in Chicago and near Uchicago ------

g1<-ggmap(myMap,darken = c(0.2,"white")) +
  geom_point(aes(x = Longitude, y = Latitude,colour=`Primary Type`),alpha=0.3,size=0.4,data = violent[Year==2016,])+
  theme_minimal()+
  ggtitle("Violent Crimes in Chicago and Near UChicago")+
  scale_color_hue(limits=c("HOMICIDE","KIDNAPPING","CRIM SEXUAL ASSAULT","ASSAULT","BATTERY","ROBBERY"),l=70, c=150,h=c(0,100))+
  theme(legend.position="None",
        plot.title = element_text(hjust = 0),
        plot.margin=unit(c(8, 5.5, 5.5, 5.5), "points"),
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14))+
  geom_polygon(data = csp,aes(x=long,y=lat,group=group),color=alpha("white",0.8),size=0.3,fill=alpha('grey',0.6))

g2<-ggmap(UMap) +
  geom_point(aes(x = Longitude, y = Latitude, colour=`Primary Type`,shape=`Primary Type`,size=(1000/IUCR1)),alpha=0.5,data = violent[Year==2016,])+
  scale_shape_discrete(limits=c("HOMICIDE","KIDNAPPING","CRIM SEXUAL ASSAULT","ASSAULT","BATTERY","ROBBERY"))+
  scale_color_hue(limits=c("HOMICIDE","KIDNAPPING","CRIM SEXUAL ASSAULT","ASSAULT","BATTERY","ROBBERY"),l=70, c=150,h=c(0,100))+
  theme_minimal()+
  theme(plot.margin = unit(c(0,0.5,0.5,0.5), "lines"),
        legend.margin=unit(0,"cm"),
        legend.key.size=unit(4,"mm"),
        legend.text=element_text(size=9,vjust = 0),
        legend.position="top",
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14)
  )+
  guides(size=FALSE,shape = guide_legend(title="Primary Type",override.aes = list(size=3,linetype=0)),
         colour = guide_legend(title="Primary Type"))
dev.new()
multiplot(g1, g2, cols=2)
