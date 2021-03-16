# Reference: https://benalexkeen.com/creating-a-timeline-graphic-using-r-and-ggplot2/

############
# Library # 
###########

spsm <- suppressPackageStartupMessages # suppress library messages
spsm(library(ggplot2))
spsm(library(scales))
spsm(library(lubridate))




#########
# Input #
#########

# Create date and events

df <- data.frame(year = c("1976-01-01", "1988-01-01", "1991-01-01", "1995-01-01", "1998-01-01","2015-01-01"),
                 event = c("John Chambers created S at Bell Labs \n(formerly AT&T, now Lucent Technologies)",
                          " A commercialization of a \n version of S called S-PLUS",
                          "Ross Ihaka and Robert Gentleman, at university of Auckland,\n in New Zeeland, started alternative implementation \n of the basic S language",
                          " Martin Maechler convinced Ihaka and \n Gentleman to make R free \n and open-source software",
                          "First announcement of the \nComprehensive R Archive Network (CRAN),\nwith 3 mirrors, 12 packages",
                          " Last R is version 4.0.4,\n CRAN has 105 mirror \n sites in 49 countries,\n and ~17000 packages"))





df$date <- with(df, ymd(year))
df <- df[with(df, order(date)), ]

# Set position for timeline plot
positions <- c(2.5, -2, 1.5, -1.0, 0.5, -1.5)
directions <- c(1, -1)

line_pos <- data.frame(
  "date"=unique(df$date),
  "position"=rep(positions, length.out=length(unique(df$date))),
  "direction"=rep(directions, length.out=length(unique(df$date)))
)

# Combine postion in data frame
df <- merge(x=df, y=line_pos, by="date", all = TRUE)
df <- df[with(df, order(date)), ]

# Set offset for event label
text_offset <- 0.4

df$month_count <- ave(df$date==df$date, df$date, FUN=cumsum)
df$text_position <- (df$month_count * text_offset * df$direction) + df$position
head(df)

# Generate label for date
year_date_range <- df$date
year_format <- format(year_date_range, '%Y')
year_df <- data.frame(year_date_range, year_format)

year_df$year_format[5] <- "1997"
year_df$year_format[6] <- "2021"


########
# Plot #
########

lblColor <- "#67a9cf" 
dotColor <- "#ef8a62"
sizeLblDate <- 7
sizeLblEvent <- 7

timeline_plot<-ggplot(df,aes(x=date,y=0, col=mycolor, label=event)) + scale_x_date(limits = as.Date(c("1974-01-01", "2025-01-01")))
timeline_plot<-timeline_plot+labs(col="Events")
timeline_plot<-timeline_plot+theme_classic()

# Plot horizontal black line for timeline
timeline_plot<-timeline_plot+geom_hline(yintercept=0, 
                                        color = "black", size=0.4)

# Plot vertical segment lines for milestones
timeline_plot<-timeline_plot+geom_segment(data=df[df$month_count == 1,], aes(y=position,yend=0,xend=date), color='black', size=0.3)

# Plot scatter points at zero and date
timeline_plot<-timeline_plot+geom_point(aes(y=0), size=5, col = dotColor)

# Don't show axes, appropriately position legend
timeline_plot<-timeline_plot+theme(axis.line.y=element_blank(),
                                   axis.text.y=element_blank(),
                                   axis.title.x=element_blank(),
                                   axis.title.y=element_blank(),
                                   axis.ticks.y=element_blank(),
                                   axis.text.x =element_blank(),
                                   axis.ticks.x =element_blank(),
                                   axis.line.x =element_blank(),
                                   legend.position = "bottom"
)


# Show year text
timeline_plot<-timeline_plot+geom_text(data=year_df, aes(x=year_date_range,y=-0.2,
                                                         label=year_format, fontface="bold"),
                                                         size=sizeLblDate, color='black')
# Show text for each event
timeline_plot<-timeline_plot+geom_text(aes(y=text_position,label=event),
                                       size=sizeLblEvent, hjust = "left", col = lblColor)
print(timeline_plot)