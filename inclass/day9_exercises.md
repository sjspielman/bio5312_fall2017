---
layout: page
title: Inclass exercises, Day 9
permalink: /inclass_exercises_day9/
---
> Follow [this link]({{ '/day9_lm1' | relative_url }}) for day 9 materials and notes

<br>


## ANOVA

Using the built-in dataset `PlantGrowth`, run an ANOVA to determine if plant weight differs across treatments.

<br>


## Pearson's Correlation

Using the dataset [wine.csv]({{ '/datasets/lm_datasets/wine.csv' | relative_url }}), run a correlation test to determine the strength and magnitude of the relationship between flavanoid and total phenol content across all wine cultivars.

<br>

## Spearman's Correlation

Using the `dplyr` dataset `diamonds` (you can access it like any built-in dataset if `dplyr` is loaded), run a non-parametric correlation test between diamond carat and price, specifically for diamonds with quality "Good".

<br>

## Regression

Using the dataset [wine.csv]({{ '/datasets/lm_datasets/wine.csv' | relative_url }}), construct a linear model that can predict the amount of Flavanoids from the amount of non-flavanoid phenols (NonflavPhenols) across all wine cultivars. Then, predict the Flavanoid content for a wine with non-flavanoid phenols of 0.12. 
