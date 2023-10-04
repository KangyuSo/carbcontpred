So-Activity-1
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# GEOG 712

<!-- badges: start -->
<!-- badges: end -->

# Main Research Interest

Forest ecosystems provide many essential services such as climate
regulation and carbon storage. However, they are endangered by ongoing
resource exploitation and climate change. Forest management practices
hold massive potential for reducing the atmospheric buildup of carbon
dioxide but require an intensive assessment of their contribution to
enhanced carbon sequestration. Unfortunately, traditional
inventory-based forest monitoring practices are time, cost, and labour
intensive and impractical at a national scale.

*Digital twinning* and *LiDAR*[^1] can improve national-scale carbon
monitoring by modeling the impact of forest management practices, but it
is still new and requires research in integrating process models, state
variables, and silvicultural interventions.

The main research interest of Kangyu So is to develop digital forest
twins to monitor forest management practices used as nature-based
climate solutions. Kangyu is interested in integrating process models
and state variables with digital twin modeling to investigate its
feasibility for forest ecosystem monitoring. His research will analyse
relationships between carbon sequestration and stand parameters
estimated from LiDAR, and model these relationships to investigate the
impact of forest management interventions on carbon uptake in foliage
and woody biomass.

# Favourites

## Favourite Music

1.  Wild Flower - Park Hyo Shin (2016)

2.  I Don’t Love You - Urban Zakapa (2016)

3.  Through the Night - IU (2017)

4.  Like it - Yoon Jong Shin (2018)

5.  TAIJI - CHANGMO (2021)

## Favourite Equation

## Favourite Artists

| **Name**         | **Achievements**                                                                                             |
|------------------|--------------------------------------------------------------------------------------------------------------|
| *Park Hyo Shin*  | 2002 KBS Music Awards Main Prize, 2002 Seoul Music Awards Main Prize                                         |
| *Urban Zakapa*   | 31st Golden Disk Awards Digital Bonsang                                                                      |
| *IU*             | 2012 Korean Music Awards Song of the Year, 2020 Mnet Asian Music Awards Best Female Artist                   |
| *Exo*            | 2013 KBS Song Festival Song of the Year, 2014 MAMA Awards Best Male Group                                    |
| *Yoon Jong Shin* | 2017 Gaon Chart Music Awards Popular Singer of the Year, 2017 Mnet Asian Music Awards Best Vocal Performance |

# A Chunk of Code

I chose to write a chunk of code that creates a box plot using data from
PlantGrowth, a built-in R data set.

``` r
# Load the data set
data(PlantGrowth)

# View the data set
View(PlantGrowth)

# Install and load ggplot2
install.packages("ggplot2")
library("ggplot2")

# Create a box plot of the PlantGrowth data set comparing dry weight and treatment condition
box_plot <- ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot()
box_plot
```

# Folder Structure Explanation

The data table created from loading the PlantGrowth data set is stored
in the “Data Table Assets” folder. The box plot created from the
PlantGrowth data set is stored in the “Image Assets” folder.

The goal of GEOG 712 is to …

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub.

[^1]: Light and Detection Ranging
