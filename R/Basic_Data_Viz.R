#install.packages(
#    c("tidyverse", "patchwork", "lubridate")
#)

library(tidyverse)
library(patchwork)
library(lubridate)

d <- "2022-10-01"
d <- as.Date(d)

## Convert different formats into date
d <-c("29 May, 2022", 
      "09 Sep 1988", 
      "15 Aug 2021")

## ggplot => 2D grammar of graphic

ggplot(data=mtcars,
       mapping=aes(x=mpg))+
  geom_histogram(bins = 10)

base <- ggplot(data=mtcars,
       mapping=aes(x=mpg))

ggplot(data=mtcars,
       mapping=aes(x=mpg))+
  geom_boxplot()


##boxplot

ggplot(mtcars,
       aes(x=mpg))+
  geom_boxplot()

mtcars

m<-mtcars %>%
  tibble() %>%
  mutate(am=factor(if_else(am==0, "Auto","Manual"
                           )))

## change setting in ggplot

ggplot(m,aes(wt,mpg))+
  geom_point(color="red",
             size=5,
             alpha=0.2,
             shape="+")+
  geom_smooth(method="lm", 
              color="black",
              fill="gold")+
  geom_rug()

## setting vs. mapping

ggplot(m,aes(wt,mpg))+
  geom_point(size=5, 
             alpha=0.7,
             aes(color=hp))
m <-m %>%
  mutate(cyl = factor(cyl))

ggplot(m,aes(wt,mpg))+
  geom_point(size=5, 
             alpha=0.7,
             aes(color=cyl))

##prep data

m %>%
  select(wt,mpg, hp) %>%
  mutate(hp_segment = case_when(
    hp<100  ~ "low",
    hp<200  ~ "medium",
    TRUE ~ "high"
  )) %>%
  mutate(hp_segment = factor(
    hp_segment,
    labels = c("low", "medium", "high"),
    levels = c("low", "medium", "high"),
    ordered = TRUE)) %>%
  
    ggplot(mapping = aes(wt,mpg,
                       color=hp_segment))+
    geom_point(size=4, alpha=0.8)+
    scale_color_manual(values=c("red",
                                "gold",
                                "blue"))


ggplot(m,aes(wt,mpg,
            color=am))+
  geom_point()

ggplot(m,aes(x=am,y=mpg))+
  geom_boxplot()


ggplot(m,aes(x=am,y=mpg))+
  geom_violin()+
  geom_jitter(width=0.05)


## diamonds exploration 

ggplot(diamonds, aes(cut, 
                     fill=color))+
  geom_bar()+
  theme_minimal()

set.seed(42)
ggplot(sample_n(diamonds,1000), 
       aes(carat, price, color=cut))+
  geom_point(alpha=0.5)+
  geom_smooth(method="lm", se=F)+
  theme_minimal()+
  facet_wrap(~cut, ncol=5)

## facet grid
set.seed(25)
diamonds %>%
  sample_n(1000)%>%
  ggplot(aes(carat, price))+
  geom_point(alpha =0.4)+
  geom_smooth()+
  theme_minimal()+
  facet_grid(cut ~ color)


## color

ggplot(diamonds, aes(price))+
  geom_histogram(fill="#5bba23",
                 bins=100)+
  theme_minimal()


set.seed(42)
ggplot(sample_n(diamonds,1000), aes(carat,price,color=cut))+
  geom_point()+
  theme_minimal()+
  scale_color_brewer(palette = "Purples")

## available theme that can be used for free


#install.packages("ggthemes")

library(ggthemes)
library(tidyverse)


ggplot(sample_n(diamonds,1000), aes(carat,price,color=cut))+
  geom_point()+
  theme_economist()


p1<- ggplot(mtcars, aes(hp))+geom_histogram(bins=10)
p2<- ggplot(mtcars, aes(mpg))+geom_density()
p3<- ggplot(diamonds, aes(cut, full=cut))+geom_bar()

library(patchwork)

p1/(p2+p3)


##ggplot shorcut
##qplot()

ggplot(mtcars, aes(wt,hp))+
  geom_point()

qplot(wt,hp, data=mtcars)
qplot(hp, data=mtcars,bins=10)
qplot(hp, data=mtcars, geom="density")
qplot(mpg, data=mtcars, geom="boxplot")






