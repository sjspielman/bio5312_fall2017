---
layout: page
title: Inclass exercises, Day VIII
permalink: /inclass_exercises_day8/
---
> Follow [this link]({{ '/day8_resampling_multtesting' | relative_url }}) for day 8 materials and notes

<!--
>
> Solutions for these exercises are available [here]({{ '/inclass_exercises_day8_solutions' | relative_url }})
-->
<br>


## Random sampling

Draw some random samples from our trusty `iris` dataset using one of the following functions: the base R function `sample()`, the `dplyr` function `sample_n()`, or the `dplyr` function `sample_frac()`.

+ Randomly sample 10 setosa petal lengths **without replacement**
+ Randomly sample 10 setosa petal lengths **with replacement**
+ Randomly sample 10 *rows* from the iris dataframe **without replacement**
+ Randomly sample 10 *rows* from the iris dataframe **with replacement**
+ Randomly sample 25% of *rows* from the iris dataframe **without replacement**


<br>


## Permutation test

The following data are numbers of virions produced (burst sizes) for viruses that have been treated with a mutagen, and for control viruses. Samples between mutagen and control are fully independent. Use a permutation test, with the *t* statistic, to determine whether the mutagen has an effect on viral burst size.

+ **Mutagen burst sizes**: 15, 29, 58, 103, 1048
+ **Control burst sizes**: 7, 29, 254, 921, 5611

![figure]({{ '/files/post_figures/t4.png' | relative_url }}){: .img2}


<br>

## Bootstrap

Use the bootstrap approach to estimate the **median** and its associated **95% confidence interval** for the difference in burst sizes between mutagen and control viruses. Again, remember that these groups are *not paired*.


## Multiple testing

The built-in R dataset `InsectSprays` gives the counts of insects in agricultural experimental units treated with different insecticides. Perform all combinations of independent two-sample tests (use sample size per grouping to determine if you should use *t*-tests or Mann Whitney *U* tests) to ask which insecticides, if any, tend to lead to different numbers of insects. Use the Bonferroni correction.

Hint: to more easily find how many are significant, `broom::tidy()` and `filter()` are useful!