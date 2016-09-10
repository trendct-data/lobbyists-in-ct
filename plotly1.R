
library(plotly)

data <- list(
  list(
    z = matrix(c(1, 20, 30, 50, 1, 20, 1, 60, 80, 30, 30, 60, 1, -10, 20), nrow=3, ncol=5),
    x = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"),
    y = c("Morning", "Afternoon", "Evening"),
    type = "heatmap"
  )
)

data <- list(
  list(
    z = matrix(c(2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 2,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,1,2,1,
                 0,2,2,2,2,2,2,0,
                 0,2,2,2,2,2,2,0,
                 0,2,2,2,1,2,2,0,
                 0,2,2,2,1,2,2,0,
                 0,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0,
                 3,2,2,2,1,2,2,0), nrow=8, ncol=28),
    x = c("7am","7:30am","8am","8:30am","9am","9:30am","10am","10:30am","11am","11:30am",
          "12pm","12:30pm","1pm","1:30pm","2pm","2:30pm","3pm","3:30pm","4pm","4:30pm",
          "5pm","5:30pm","6pm","6:30pm","7pm","7:30pm","8pm","8:30pm"),
    y = c("10/7/14","10/8/14","10/9/14","10/10/14","10/11/14","10/12/14","10/13/14","10/14/14"),
    type = "heatmap"
  )
)

sec <- read.csv("seclusion.csv", stringsAsFactors=FALSE)
test <- sec[2:8, 2:29]

data2 <- list(
  list(
    z = data.matrix(test, rownames.force = NA),
    x = colnames(sec[2:28]),
    y = sec$Date,
      type="heatmap"
    ))
py <- plotly()

response <- py$plotly(data, kwargs=list(filename="labelled-heatmap", fileopt="overwrite"))
url <- response$url
