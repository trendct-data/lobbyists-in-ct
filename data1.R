#Compensation.Leg  Entertainment.Leg	Exp.Pub.Off.Leg	Paid.Media.Leg	Solicitations.Leg	Office.Expenses.Leg	Other.Expenses.Leg	Total.Expenses.Leg	Unrelated.Leg	


lob <- read.csv("lobby-clean.csv", stringsAsFactors=FALSE)
total <- subset(lob, Type=="Total")
admin <- subset(lob, Type=="Admin")
leg <- subset(lob, Type=="Leg")
write.csv(lob, "lob.csv")
write.csv(admin, "admin.csv")
write.csv(total, "total.csv")
write.csv(leg, "leg.csv")

library(dplyr)

colnames(total) <- c("row", "Name", "Type", "Compensation.Total", "Entertainment.Total",
                     "Exp.Pub.Off.Total", "Paid.Media.Total",	"Solicitations.Total",
                     "Office.Expenses.Total",	"Other.Expenses.Total",	"Total.Expenses.Total",
                     "Unrelated.Total")

colnames(admin) <- c("row", "Name", "Type", "Compensation.Admin", "Entertainment.Admin",
                     "Exp.Pub.Off.Admin", "Paid.Media.Admin",  "Solicitations.Admin",
                     "Office.Expenses.Admin",	"Other.Expenses.Admin",	"Total.Expenses.Admin",
                     "Unrelated.Admin")

total$row <- NULL
total$Type <- NULL
admin$row <- NULL
admin$Type <- NULL
leg$row <- NULL
leg$Type <- NULL

lob_all <- left_join(total, admin)
lob_all <- left_join(lob_all, leg)
