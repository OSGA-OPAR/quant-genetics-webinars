############
# Library # 
###########

library(ggridges)
library(ggplot2)
library(ggthemes)
library(tidyverse)
library(RColorBrewer)
if(!require("qtl"))
    install.packages("qtl")
library(qtl)


############
# External #
############

source("geom_flat_violin.R") # relative path 

#############
# Load Data #
#############


solbergURL <- "https://phenomedoc.jax.org/QTL_Archive/solberg_2004/Solberg2004_F344xWKY_Data.csv"
cr <- read.cross(file=solbergURL,format="csv",genotypes=c("a","h","b","c","d"),crosstype="f2",alleles=c("F344","WKY"))

df <- cr$pheno

# get the name of variable
names(df)

# change to factor  
df <- mutate(df,litter=factor(litter))
df <- mutate(df,sex=recode_factor(sex,`1`= "male",`0`="female"))
df <- mutate(df,pgm=recode_factor(pgm,`1`= "1",`0`="0"))


# Plot half-violin-half-strip chart
df <- df[, c("fastinggluc", "sex")] %>% na.omit
p <- df %>% mutate(logfasting = log2(fastinggluc)) %>%
ggplot(aes( y= logfasting, x = sex,  fill=sex)) +
    geom_flat_violin( colour="white") +
    geom_point(aes(x = as.numeric(sex) + .12, colour=sex) , 
                size = 3, 
                pch=19,
                    alpha = 0.3,
                position = position_jitterdodge(jitter.width = .55, jitter.height = 0.01, dodge.width = 0.75)) +
     theme_fivethirtyeight() +
    labs(title = "Fasting Glucose levels per sex", 
            y = "logfasting", 
            x = "sex") 
print(p)