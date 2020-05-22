---
title: "Code for visualizing trends in mosquito microbiome research using the Europe PMC archive"
author: "Nsa Dada"
date: "22/05/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


This code should reproduce Figure 1 in:  
__Dada N, Jupatanakul N, Minard G, Short SM, Akorli J, and Villegas LM (2020). Considerations for mosquito microbiome research from the Mosquito Microbiome Consortium. *Preprint.*__



## Install packages

```{r,echo=TRUE, eval=FALSE}
install.packages("tidyverse")
install.packages("europepmc")
install.packages("cowplot")
```


## Load packages

```{r, echo=TRUE, eval=FALSE}
library(tidyverse)
library(europepmc)
library(cowplot)
```

## Scrape research trend data from Europe PMC archive

```{r, echo=TRUE, eval=FALSE}
Mosquito_microbiome_research_trend <- europepmc::epmc_hits_trend(query = "mosquito microbiome", period = 2000:2020)
```

## Plot research trend data

```{r, echo=TRUE, eval=FALSE}
Mosquito_microbiome_research_trend %>%
      ggplot(aes(x = factor(year), y = (query_hits))) +
      geom_col(fill = "#660066", width = 0.7, alpha = 0.9) +
      scale_y_continuous(expand = c(0, 0)) +
      theme_minimal_hgrid(12) +
      labs(x = "Year", y = "Number of Europe PMC articles") +
      ggtitle("Interest in mosquito microbiome research over the past two decades")
```

## Acknowledgements

This code was adapted from Daniel S. Quintana's code for visualizing research trends. Original code can be found [here](https://gist.github.com/dsquintana/b512b715786088339b61a7fb79367d5e).
