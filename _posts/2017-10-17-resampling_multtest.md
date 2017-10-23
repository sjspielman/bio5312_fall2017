---
layout: post
title:  "Resampling statistics and multiple testing"
date:   2017-10-17
permalink: /day8_resampling_multtesting
---


## Lecture 

+ [Slides](./slides/day8_resampling_multtesting.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day8_exercises.md %})


<br>
## R content

+ [Broom vignette](https://cran.r-project.org/web/packages/broom/vignettes/broom.html)


### Random sampling

<pre><code class="language-r">
### ALWAYS set your random seed
set.seed(1283)

## The base R function sample()
## Usage: sample(x, size, replace = FALSE, prob = NULL)

### Create a random array of 25 random numbers to demonstrate sampling
> x <- runif(25, 1, 10)
> x
 [1] 6.310782 6.495482 1.577173 4.507129 7.754845 4.143462 2.278142 8.749319
 [9] 8.680794 5.366593 5.210611 4.157654 6.626720 4.495312 9.374563 8.202714
[17] 9.211275 1.069301 6.555776 6.028585 4.490465 8.684786 5.733197 4.769792
[25] 5.339571

## Draw 10 random samples from a vector without replacement
> sample(x, 10)
 [1] 6.555776 5.339571 4.490465 4.143462 4.507129 5.733197 8.202714 9.374563
 [9] 6.626720 7.754845
	
	
## Draw 10 random samples from a vector with replacement
> sample(x, 10, replace=T)
 [1] 4.495312 2.278142 6.626720 4.490465 4.157654 4.769792 9.211275 1.069301
 [9] 1.069301 6.310782
### Note that 1.069301 appears twice, by random chance 

## Sampling from dataframes, using built-in dataset BOD
> BOD
  Time demand
1    1    8.3
2    2   10.3
3    3   19.0
4    4   16.0
5    5   15.6
6    7   19.8

## Sample three rows without replacement
> sample_n(BOD, 3)
  Time demand
1    1    8.3
4    4   16.0
3    3   19.0
> BOD %>% sample_n(3)
  Time demand
1    1    8.3
3    3   19.0
6    7   19.8

## Sample three rows with replacement
> BOD %>% sample_n(3, replace=T)
    Time demand
4      4   16.0
5      5   15.6
5.1    5   15.6

## Sample 75% of rows without replacement
> BOD %>% sample_frac(0.75)
  Time demand
3    3   19.0
1    1    8.3
5    5   15.6
4    4   16.0

## Sample 75% of rows without replacement
> BOD %>% sample_frac(0.75, replace=T)
    Time demand
3      3   19.0
1      1    8.3
1.1    1    8.3
2      2   10.3
> BOD %>% sample_frac(0.75, replace=T)
  Time demand
2    2   10.3
3    3   19.0
5    5   15.6
6    7   19.8

</code></pre>



### Permutation test

This example performs a permutation test between setosa and virginica iris sepal lengths. For clarity, functions are shown as their full names so you know for sure which package they come from.

`Ho: Setosa and virginica have the same, on average, sepal lengths.`
`Ha: Setosa and virginica have different, on average, sepal lengths.`


<pre><code class="language-r">
### ALWAYS set your random seed
> set.seed(18472)

> library(tidyverse)
> library(broom)
> library(modelr) ## MUST LOAD LAST TO AVOID CONFLICT WITH BROOM FUNCTIONS

### Limit dataset to only have two categories in Species
> iris2 <- iris %>% filter(Species != "versicolor")

### Find the data t statistic
t.test(Sepal.Length~Species, data=iris2)$statistic -> data.t

### Choose a large number of permutations
> N <- 1e4

> iris.perms <- modelr::permute(iris2, N, Sepal.Length)
> iris.ttests <- purrr::map(iris.perms$perm, ~t.test(Sepal.Length~Species, data=.))
> iris.tidied <- purrr::map_df(iris.ttests, broom::tidy, .id = "id")
> iris.t.permuted <- iris.tidied$statistic

## Compute P
> (sum(iris.t.permuted >= abs(data.t)) + sum(iris.t.permuted <= -1*abs(data.t)))/length(iris.t.permuted)
[1] 0

## Examine data for directional conclusion
> iris2 %>% group_by(Species) %>% summarize(mean(Sepal.Length))
    Species `mean(Sepal.Length)`
1    setosa                5.006
2 virginica                6.588

</code></pre>

We have a permutated P-value of 0, which means our true P-value is going to be **extremely small**, and definitively smaller than $$\alpha = 0.05$$. We reject the null hypothesis and we conclude that setosa and virginica have different sepal lengths. We further find that virginica have longer sepal lengths than setosa, on average.

### Bootstrap

This example compute the bootstrap expectation (i.e., mean) and 95% CI for setosa petal lengths.

<pre><code class="language-r">
### ALWAYS set your random seed
> set.seed(3342)

> library(slipper)

> N=1e4
> iris %>% 
	filter(Species == "setosa") %>%
	slipper(mean(Petal.Length),B=N) %>% 	filter(type=="bootstrap") %>% 	summarize(mean = mean(value),		       ci_low = quantile(value,0.025),              ci_high = quantile(value,0.975))
     mean  ci_low ci_high
1 1.462159  1.414    1.51
</code></pre>

With 1e4 bootstrap replicates, we estimate that setosa petal lengths having a mean of 1.46 with a 95% CI of [1.414, 1.51].

   
### Multiple testing and corrections


<pre><code class="language-r">
### Use function p.adjust() to correct an array of P-values for multiple testing
#### p.adjust(p-value, method = correction method)

## Default uses the Holm correction
> my.pvalues <-c(0.05, 0.023, 0.001, 0.04, 0.035, 0.0007)
> p.adjust(my.pvalues)
[1] 0.1050 0.0920 0.0050 0.1050 0.1050 0.0042


## Use method argument to specify another method, such as fdr or bonferroni
> p.adjust(my.pvalues, method = "fdr")
[1] 0.050 0.046 0.003 0.048 0.048 0.003
> p.adjust(my.pvalues, method = "bonferroni")
[1] 0.3000 0.1380 0.0060 0.2400 0.2100 0.0042

</code></pre>

### Functions that perform multiple testing

+ `pairwise.t.test(<response variable>, <grouping variable>)` performs all possible t-tests for specified columns
+ `pairwise.wilcox.test(<response variable>, <grouping variable>)` performs all possible Mann Whitney U tests for specified columns


<pre><code class="language-r">
## Default
> pairwise.t.test(iris$Petal.Length, iris$Species)
	Pairwise comparisons using t tests with pooled SD 

data:  iris$Petal.Length and iris$Species 

           setosa versicolor
versicolor <2e-16 -         
virginica  <2e-16 <2e-16    

P value adjustment method: holm

## Use FDR
> pairwise.t.test(iris$Petal.Length, iris$Species, p.adj = "fdr")
	Pairwise comparisons using t tests with pooled SD 

data:  iris$Petal.Length and iris$Species 

           setosa versicolor
versicolor <2e-16 -         
virginica  <2e-16 <2e-16    

P value adjustment method: fdr 

## Tidy it up with broom::tidy()
> pairwise.t.test(iris$Petal.Length, iris$Species, p.adj = "fdr") %>% tidy()
      group1     group2      p.value
1 versicolor     setosa 7.881881e-69
2  virginica     setosa 1.231842e-90
4  virginica versicolor 1.810597e-31
</code></pre>






