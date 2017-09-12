---
layout: page
title: Inclass exercises, Day III
permalink: /inclass_exercises_day3/
---
> Follow [this link]({{ '/day2_tidyverse1' | relative_url }}) for day 2 (Introduction to Tidyverse) materials and notes
>
> Follow [this link]({{ '/day3_probability' | relative_url }}) for day 3 (Probability) materials and notes

<br>


## Exercises

Create the following figures for the R `CO2` dataset using `ggplot2`. When applicable, use only **one line of code** to create each figure by piping commands together.

 
1. Histogram of CO2 uptake values for all plants
2. Histogram of CO2 uptake values for all plants from Mississippi
3. Histogram of CO2 uptake values for all plants from Mississippi. This time, provide the argument `bins=50` to `geom_histogram()`, as in: geom_histogram(bins=50). Then, provide `bins=5` and finally `bins=100`. Think about how these plots compare and therefore what this argument is doing.
4. **Faceted** histogram of CO2 uptake values across plant Type
5. Scatterplot of CO2 uptake against concentration (meaning CO2 is the **response** variable) for all nontreated plants, where points are colored by plant Type
6. **Faceted** scatterplot of CO2 uptake against concentration across plant Type, where points are colored by Treatment
7. **Faceted** scatterplot of CO2 uptake against concentration across plant Type and Treatment, i.e. the final figure should have 2 rows and 2 columns. 








