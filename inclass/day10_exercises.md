---
layout: page
title: Inclass exercises, Day 10
permalink: /inclass_exercises_day10/
---
> Follow [this link]({{ '/day10_lm2_logistic' | relative_url }}) for day 10 materials and notes

<!--
>
> Solutions for these exercises are available [here]({{ '/inclass_exercises_day10_solutions' | relative_url }})
-->
<br>


### LM 1

Using the dataset [wine.csv]({{ '/datasets/lm_datasets/wine.csv' | relative_url }}), construct a linear model to predict flavanoid content across cultivars, while controlling for total phenol content. This type of linear model is also known as "ANCOVA" (we have one categorical and one numeric predictor, the latter of which is sometimes referred to as the "covariate"). Additionally visualize your data with a scatterplot, colored by cultivar.

Hint: Because cultivar is coded as 1,2, and 3 in your data, R might interpret it as numeric, even though these represent categories. To *recode* this variable as a factor, use this line:

<pre><code class="language-r">
wine$Cultivar <- factor(wine$Cultivar)
</code></pre>

<br>

### LM 2

Using the dataset [wine.csv]({{ '/datasets/lm_datasets/wine.csv' | relative_url }}), construct a linear model to predict wine Color *from all other columns* as independent predictors. Note: If you are running this in a separate R session from question above, you will need to re-code `wine$Cultivar` as a factor. Fully interpret your model. Think carefully how to interpret the coefficient for Cultivar (the only categorical variable). How can you fully understand its effect?  

Happily, R makes your life easy to include all "other columns" as predictors:
`lm(Color ~ ., data = wine)`, where the "." represents everything that isn't Color. 


<br>

### Logistic regresssion

Here, we will use a dataset, [`default.csv`]({{ '/datasets/lm_datasets/default.csv' | relative_url }}) indicating if invididuals defaulted on their credit debt. Construct a logistic regression to predict if an individual will default, and visualize your final logistic curve with a colored rug. Based on the plot, do you think this is a good model?


