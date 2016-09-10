names <- read.csv("client-names-csv.csv", stringsAsFactors=FALSE)

l2009 <- read.csv("lobby2009.csv", stringsAsFactors=TRUE)
l2010 <- read.csv("lobby2010.csv", stringsAsFactors=TRUE)
l2011 <- read.csv("lobby2011.csv", stringsAsFactors=TRUE)
l2012 <- read.csv("lobby2012.csv", stringsAsFactors=TRUE)
l2013 <- read.csv("lobby2013.csv", stringsAsFactors=TRUE)
l2014 <- read.csv("lobby2014.csv", stringsAsFactors=TRUE)
l2015 <- read.csv("lobby2015.csv", stringsAsFactors=TRUE)

l2009a <- l2009[c("ClientName", "TotalAdminAmount")]
colnames(l2009a) <- c("ClientName", "Admin2009")
l2009l <- l2009[c("ClientName", "TotalLegAmount")]
colnames(l2009l) <- c("ClientName", "Leg2009")
l2009c <- l2009[c("ClientName", "TotalCompensation")]
colnames(l2009c) <- c("ClientName", "Comp2009")

l2010a <- l2010[c("ClientName", "TotalAdminAmount")]
colnames(l2010a) <- c("ClientName", "Admin2010")
l2010l <- l2010[c("ClientName", "TotalLegAmount")]
colnames(l2010l) <- c("ClientName", "Leg2010")
l2010c <- l2010[c("ClientName", "TotalCompensation")]
colnames(l2010c) <- c("ClientName", "Comp2010")

l2011a <- l2011[c("ClientName", "TotalAdminAmount")]
colnames(l2011a) <- c("ClientName", "Admin2011")
l2011l <- l2011[c("ClientName", "TotalLegAmount")]
colnames(l2011l) <- c("ClientName", "Leg2011")
l2011c <- l2011[c("ClientName", "TotalCompensation")]
colnames(l2011c) <- c("ClientName", "Comp2011")

l2012a <- l2012[c("ClientName", "TotalAdminAmount")]
colnames(l2012a) <- c("ClientName", "Admin2012")
l2012l <- l2012[c("ClientName", "TotalLegAmount")]
colnames(l2012l) <- c("ClientName", "Leg2012")
l2012c <- l2012[c("ClientName", "TotalCompensation")]
colnames(l2012c) <- c("ClientName", "Comp2012")

l2013a <- l2013[c("ClientName", "TotalAdminAmount")]
colnames(l2013a) <- c("ClientName", "Admin2013")
l2013l <- l2013[c("ClientName", "TotalLegAmount")]
colnames(l2013l) <- c("ClientName", "Leg2013")
l2013c <- l2013[c("ClientName", "TotalCompensation")]
colnames(l2013c) <- c("ClientName", "Comp2013")

l2014a <- l2014[c("ClientName", "TotalAdminAmount")]
colnames(l2014a) <- c("ClientName", "Admin2014")
l2014l <- l2014[c("ClientName", "TotalLegAmount")]
colnames(l2014l) <- c("ClientName", "Leg2014")
l2014c <- l2014[c("ClientName", "TotalCompensation")]
colnames(l2014c) <- c("ClientName", "Comp2014")

l2015a <- l2015[c("ClientName", "TotalAdminAmount")]
colnames(l2015a) <- c("ClientName", "Admin2015")
l2015l <- l2015[c("ClientName", "TotalLegAmount")]
colnames(l2015l) <- c("ClientName", "Leg2015")
l2015c <- l2015[c("ClientName", "TotalCompensation")]
colnames(l2015c) <- c("ClientName", "Comp2015")


library(dplyr)

Admin <- left_join(names, l2009a)
Admin <- left_join(Admin, l2010a)
Admin <- left_join(Admin, l2011a)
Admin <- left_join(Admin, l2012a)
Admin <- left_join(Admin, l2013a)
Admin <- left_join(Admin, l2014a)
Admin <- left_join(Admin, l2015a)


Leg <- left_join(names, l2009l)
Leg <- left_join(Leg, l2010l)
Leg <- left_join(Leg, l2011l)
Leg <- left_join(Leg, l2012l)
Leg <- left_join(Leg, l2013l)
Leg <- left_join(Leg, l2014l)
Leg <- left_join(Leg, l2015l)

Comp <- left_join(names, l2009c)
Comp <- left_join(Comp, l2010c)
Comp <- left_join(Comp, l2011c)
Comp <- left_join(Comp, l2012c)
Comp <- left_join(Comp, l2013c)
Comp <- left_join(Comp, l2014c)
Comp <- left_join(Comp, l2015c)

write.csv(Admin, "admin.csv")
write.csv(Leg, "leg.csv")
write.csv(Comp, "comp.csv")

all <- left_join(Admin, Leg)
all <- left_join(all, Comp)
write.csv(all, "all.csv")

all_csv <- read.csv("all-csv.csv", stringsAsFactors=FALSE)

tap <- tapply(all_csv$ClientName, sum)

library(data.table)
DT <- as.data.table(all_csv)
# which columns are numeric 
numeric_cols <- which(sapply(DT, is.numeric))
DT2 <- DT[, lapply(.SD, sum), by = ClientName, .SDcols = numeric_cols]
