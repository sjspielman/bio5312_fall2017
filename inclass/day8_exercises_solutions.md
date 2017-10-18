---
layout: page
title: Inclass exercise solutions, Day VIII
permalink: /inclass_exercises_day8_solutions/
---
> Follow [this link]({{ '/day8_resampling_multtesting' | relative_url }}) for day 8 materials and notes> 
<br>


## Random sampling

Draw some random samples from our trusty `iris` dataset using one of the following functions: the base R function `sample()`, the `dplyr` function `sample_n()`, or the `dplyr` function `sample_frac()`.

+ Randomly sample 10 setosa petal lengths **without replacement**
+ Randomly sample 10 setosa petal lengths **with replacement**
+ Randomly sample 10 *rows* from the iris dataframe **without replacement**
+ Randomly sample 10 *rows* from the iris dataframe **with replacement**
+ Randomly sample 25% of *rows* from the iris dataframe **without replacement**


<br>

### Solutions

<pre><code class="language-r">
## set random seed
> set.seed(1527)

## load up tidyverse
> library(tidyverse)

#### Randomly sample 10 setosa petal lengths **without replacement**
> setosa <- iris %>% filter(Species == "setosa")
> sample(setosa, 10)

#### Randomly sample 10 setosa petal lengths **with replacement**
> sample(setosa, 10, replace = T)

#### Randomly sample 10 setosa petal lengths **with replacement**
> sample(setosa, 10, replace = T)

#### Randomly sample 10 *rows* from the iris dataframe **without replacement**
> iris %>% sample_n(10)

#### Randomly sample 10 *rows* from the iris dataframe **with replacement**
> iris %>% sample_n(10, replace=T)

#### Randomly sample 25% of *rows* from the iris dataframe **without replacement**
> iris %>% sample_frac(0.25)
</code></pre>


<br><br>

## Permutation test

The following data are numbers of virions produced (burst sizes) for viruses that have been treated with a mutagen, and for control viruses. Samples between mutagen and control are fully independent. Use a permutation test, with the *t* statistic, to determine whether the mutagen has an effect on viral burst size.

+ **Mutagen burst sizes**: 15, 29, 58, 103, 1048
+ **Control burst sizes**: 7, 29, 254, 921, 5611

![figure]({{ '/files/post_figures/t4.png' | relative_url }}){: .img2}

<br>

### Solutions

<pre><code class="language-r">
## set random seed
> set.seed(1527231)

## load up packages
> library(tidyverse)
> require(broom)
> require(purrr)
> require(modelr)


### Data
> virus <- tibble("group" = c(rep("mutagen", 5), rep("control", 5)), "burst.size" = c(15, 29, 58, 103, 1048, 7, 29, 254, 921, 5611))

## Calculate t on the actual data
> t.test(burst.size ~ group, data = virus)$statistic -> data.t
> data.t
       t 
1.019128 
## Generate 1e5 permutations
> virus.permutations <- modelr::permute(virus, 1e5, burst.size)

## Compute t-statistic for each permutation, by running a t-test for every permutation in the `perm` column of `virus.permutations`
> virus.ttests <- purrr::map(virus.permutations$perm, ~t.test(burst.size ~ group, data = .))

## Extract t-stastistics, which are in the column "statistic" below
> virus.ts <- purrr::map_df(virus.ttests, tidy, id = ".id")

### Compute P-value
> sum(virus.ts$statistic >= abs(data.t)) + sum(virus.ts$statistic <= -1*abs(data.t))
[1] 42931
> 42931/nrow(virus.ts)
[1] 0.42931
</code></pre>

`Ho: There is no difference between viral burst sizes for mutagen and control viruses.`

`Ha: There is a difference between viral burst sizes for mutagen and control viruses.`

Our permutation test returned P=0.429, which is much larger than alpha. We fail to reject the null hypothesis, and we have no evidence that burst sizes differ between mutagen and control viruses.

<br>

## Bootstrap

Use the bootstrap approach to estimate the **median** and its associated **95% confidence interval** for the difference in burst sizes between mutagen and control viruses. 

<br>

### Solution

<pre><code class="language-r">
library(slipper)

## Make 1e5 bootstrap datasets for sample "mutagen", and compute median for each bootstrapped dataset
virus %>% 
	filter(group == "mutagen") %>% 
	slipper(median(burst.size), B=1e5) %>% 
	mutate(group = "mutagen", id = 1:n())-> mut.boot

## Make 1e5 bootstrap datasets for sample "control", and compute median for each bootstrapped dataset
virus %>% 
	filter(group == "control") %>% 
	slipper(median(burst.size), B=1e5) %>% 
	mutate(group = "control", id = 1:n()) -> cont.boot
	
### Merge the data and spread so that we can find the difference between medians of bootstrapped datasets
> rbind(mut.boot, cont.boot) %>% spread(group, value) -> spread.boot
> head(spread.boot)
       type n control mutagen
1 bootstrap 2    5611      58
2 bootstrap 3      29      29
3 bootstrap 4     254    1048
4 bootstrap 5     921     103
5 bootstrap 6     254      29
6 bootstrap 7     921     103

## Now grab the difference between medians, which make up our SAMPLING DISTRIBUTION of the difference b/w medians
### The mean of this distribution is ~population median difference
### CI is as usual
spread.boot %>%
	mutate(diff.median = control - mutagen) %>%
	filter(type == "bootstrap") %>%
	summarize(mean = mean(diff.median), 		       ci_low = quantile(diff.median,0.025),              ci_high = quantile(diff.median,0.975))
      mean ci_low ci_high
1 543.0702   -794    5553
</code></pre>

The bootstrap median difference between control and mutation burst sizes is 543.07 with a 95% CI of [-794, 5553]. Note that the median difference of 0 is in this CI, so we are consistent with our permutation test's failure to reject the null.

<br><br>


## Multiple testing

The built-in R dataset `InsectSprays` gives the counts of insects in agricultural experimental units treated with different insecticides. Perform all combinations of independent two-sample tests (use sample size per grouping to determine if you should use *t*-tests or Mann Whitney *U* tests) to ask which insecticides, if any, tend to lead to different numbers of insects. Use the Bonferroni correction.

Hint: to more easily find how many are significant, `broom::tidy()` and `filter()` are useful!

<pre><code class="language-r">

### Examine InsectSprays to help us decide whether to use t-tests or wilcoxon tests
> InsectSprays %>% head()
  count spray
1    10     A
2     7     A
3    20     A
4    14     A
5    14     A
6    12     A

> InsectSprays %>% group_by(spray) %>% tally()
# A tibble: 6 x 2
   spray     n
1      A    12
2      B    12
3      C    12
4      D    12
5      E    12
6      F    12


#### There are 12 observations per group, so we should use a nonparametric test
pairwise.wilcox.test(InsectSprays$count, InsectSprays$spray, p.adj = "bonf")

	Pairwise comparisons using Wilcoxon rank sum test 

data:  InsectSprays$count and InsectSprays$spray 

  A       B       C       D       E      
B 1.00000 -       -       -       -      
C 0.00058 0.00058 -       -       -      
D 0.00117 0.00104 0.03977 -       -      
E 0.00051 0.00051 0.78860 1.00000 -      
F 1.00000 1.00000 0.00052 0.00105 0.00052

P value adjustment method: bonferroni 
</code></pre>

After correction for multiple testing with the Bonferroni, there are significantly different numbers of insects between:

+ A-C
+ A-D
+ A-E
+ C-B
+ D-B
+ E-B
+ C-D [significant for alpha = 0.05, not alpha = 0.01!]
+ C-F
+ D-F
+ E-F