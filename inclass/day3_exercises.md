---
layout: page
title: Inclass exercises, Day III
permalink: /inclass_exercises_day3/
---
> Follow [this link]({{ '/day2_tidyverse1' | relative_url }}) for day 2 (Introduction to Tidyverse) materials and notes
>
> Follow [this link]({{ '/day3_probability' | relative_url }}) for day 3 (Probability and Tidyverse II) materials and notes

<br>


## Exercises

All exercises consider the `CO2` dataset. 

<br>

### Joining datasets

Separate the `CO2` dataframe into two dataframes, named `x` and `y` (for convenience), using the `dplyr` function `select()` to obtain the appropriate columns:

+ `x` should have the columns Plant, Type, and Treatment
+ `y` should have the columns Plant, conc, and uptake

Once you have confirmed that these data frames are correct, **join** these dataframes with `left_join()` to re-create `CO2`. Name the final dataset `CO22`. Compare `CO2` with your recreated `CO22` to ensure it correct. 

<br>

### Plotting

Create the following figures for the R `CO2` dataset using `ggplot2`. When applicable, use only **one line of code** to create each figure by piping commands together.
 
1. Histogram of CO2 uptake values for all plants
2. Histogram of CO2 uptake values for all plants from Mississippi
3. **Faceted** histogram of CO2 uptake values across plant Type
4. Scatterplot of CO2 uptake against concentration (meaning CO2 is the **response** variable) for all nontreated plants, where points are colored by plant Type
5. **Faceted** scatterplot of CO2 uptake against concentration across plant Type, where points are colored by Treatment
6. **Faceted** scatterplot of CO2 uptake against concentration across plant Type and Treatment, i.e. the final figure should have 2 rows and 2 columns. 








