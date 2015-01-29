library(plyr);
library(reshape);

# Load in scrobble data
scrobbles <- read.delim("~/Dropbox/R/lastfmdata/2015-01-26/scrobbles.tsv")

# Retain only the variables of interest
t1 <- scrobbles[ , c(1, 3, 5, 11 )]

# Put time in the correct format
t1$ISO.time <- as.POSIXct(t1$ISO.time)

t1$month.and.year <- format(t1$ISO.time, format = "%Y %m")

t2 <- as.data.frame(table(t1$artist.name))

names(t2) <- c("artist.name", "freq")

t2 <- subset(t2, t2$freq >= 500)


# No longer using the below as match_df is now working, for some reason. Maybe due to quoting the 'on' column name
# merge <- join(t1, t2, by = "artist.name", match = "all")
# merge <- subset(merge, !is.na(merge$freq))


# Now seems to work!
match_df <- match_df(t1, t2)

# Tip on how to store this data taken from:
# http://www.r-bloggers.com/how-to-convert-contingency-tables-to-data-frames-with-r/
t4 <- as.data.frame.matrix(table(match_df$month.and.year, match_df$artist.name))


artists.to.keep <- t2$artist.name

t4 <- t4[, artists.to.keep]

cor.matrix <- data.frame(cor(t4))

cor.matrix$artist.name <- row.names(cor.matrix)

melted.corr.matrix <- melt(cor.matrix)


# cor.test(t4$Edan, t4$`Mr. Lif`)

# cor.test(t4$Edan, t4$`Mr. Lif`)


# subset(melted.corr.matrix, melted.corr.matrix$value > 1)


subset(melted.corr.matrix, melted.corr.matrix$value >= 0.7 & value != 1)


# plot(t4$...And.You.Will.Know.Us.by.the.Trail.of.Dead), t1$artist.name == "Someone Still Loves You Boris Yeltsin")


t4

plot(log(t4$`Autechre`), log(t4$`Tortoise`))

cor.test()


t4$Edan
t4$`Mr.Lif`

scatterplot( subset(t1, t1$artist.name)

             
             
x <- c(0, 0, 1, 0, 0, 0)
y <- c(0, 0, 5, 0, 0, 0)

cor.test(x,y)
