## Code for visualizing trends in mosquito microbiome research per Europe PMC archive
## Adapted from Daniel S. Quintana: https://gist.github.com/dsquintana/b512b715786088339b61a7fb79367d5e

## Install required packages

install.packages("tidyverse")
install.packages("europepmc")
install.packages("cowplot")

## load packages
library(tidyverse)
library(europepmc)
library(cowplot)

## Scrape data from Europe PMC archive

Mosquito_microbiome_research_trend <- europepmc::epmc_hits_trend(query = "mosquito microbiome", period = 2000:2020)

## Plot research trend data

 Mosquito_microbiome_research_trend %>%
      ggplot(aes(x = factor(year), y = (query_hits))) +
      geom_col(fill = "#660066", width = 0.7, alpha = 0.9) +
      scale_y_continuous(expand = c(0, 0)) +
      theme_minimal_hgrid(12) +
      labs(x = "Year", y = "Number of Europe PMC articles") +
      ggtitle("Interest in mosquito microbiome research over the past two decades")
 
 
