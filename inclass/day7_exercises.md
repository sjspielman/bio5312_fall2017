---
layout: page
title: Inclass exercises, Day VII
permalink: /inclass_exercises_day7/
---
> Follow [this link]({{ '/day7_nonparametric_tidyr' | relative_url }}) for day 7 materials and notes


<br>


## Sign Test 

Weddell seals live in the Antarctic and feed on fish during long, deep dives in freezing water. The seals benefit from these feeding dives, but the food they gain comes at a metabolic cost as the dives are highly strenuous.

![figure]({{ '/files/post_figures/seals.jpg' | relative_url }}){: .img2}

A set of researchers wanted to know whether these feeding long dives incurred an energetic expense, beyond the exertion a seal would experience while diving but not feeding. Researchers measured the oxygen use of seals as they surfaced for air after a dive. For 10 seals, they measured oxygen use (in $$\frac{mg O_2}{kg}$$) of 1 feeding dive and 1 non-feeding dives. Download the data [here]({{ '/datasets/seals.csv' | relative_url }}).
**Does feeding increase the metabolic costs of a dive?**

Take the following steps:
+ Examine the data, i.e. look at it!
+ Understand why the sign test is appropriate here
+ State the null, alternative hypotheses 
+ Conduct the test
+ Report results, conclusions


<br><br>

## Wilcoxon signed-rank test

Re-analyze the seal data above using a **two-tailed** Wilcoxon signed-rank test. 

Take the following steps:
+ State the null, alternative hypotheses 
+ Conduct the test
+ Report results, conclusions
+ Understand any differences in outcome between tests


<br><br>

## Mann Whitney *U* test

Sockeye salmon swim hundreds of miles from the Pacific Ocean, where they grow up, to rivers for spawning. Kokanee salmon, by contrast, are a type of freshwater sockeye that spend their entire lives in lakes before swimming upriver to mate. In both types of fish, the males are bright red during mating. This red coloration is caused by carotenoid pigments, which the fish cannot synthesize but sequester from their food. The ocean environment is much richer in carotenoids than the lake environment, which raises the question of how the kokanee males are as red as the sockeye when the kokanee do not live in the ocean. 

![figure]({{ '/files/post_figures/Sockeye_Salmon.jpg' | relative_url }}){: .img2}

Researchers hypothesized that kokanee might be more efficient at using available carotenoids than the sockeye. They tested this hypothesis in an experiment where both sockeye and kokanee individuals were raised in the lab with low levels of carotenoids in their diets (Craig and Foote 2001). Their skin color was measured electronically. Download the data [here]({{ '/datasets/sockeye_kokanee.csv' | relative_url }}).


**Do sockeye and kockanee tend to have different skin colors in this experiement?**

Take the following steps:
+ Read in and examine the data
+ Understand why the Mann Whitney *U* test is appropriate here (but a two-sample *t*-test might not be)
+ State the null, alternative hypotheses 
+ Conduct the test
+ Report results, conclusions


### Round 2

Run a *t*-test anyways on the dataset and compare your results and conclusions from the Mann Whitney test. Return to class for discussion of what's going on.

## Tidying data with `tidyr`

1. The dataset [pew.csv]({{ '/datasets/pew.csv' | relative_url }}) reports results from a Pew poll on world religions, where it asked individuals with which religion (if any) they affiliate. Results were tabulated based on income levels. **Use tidyr to tidy up this dataset**.

2. As it turns out, some results from the poll were missing but later recovered! They are found in [pew2.csv]({{ '/datasets/pew2.csv' | relative_url }}). Make this dataset tidy, and then create **a single** dataset that combines `pew.csv` and `pew2.csv` into a single tidy dataframe.

3. Using the final data frame, make a **faceted** histogram of incomes across religions. 