---
layout: page
title: Inclass exercises, Day VI
permalink: /inclass_exercises_day6/
---
> Follow [this link]({{ '/day6_testing_proportions' | relative_url }}) for day 6 materials and notes

<!--  
> Solutions for these exercises are available [here]({{ '/inclass_exercises_day6_solutions' | relative_url }})
-->

<br>


## Binomial test

Tungara frogs (pictured below) have been heavily studied as a model organism for "female mate choice". These frogs emit mating calls which are either "whines" or "whine-chuck", where "chuck" noises are tacked on to the whine to create a longer, more robust mating call.

![figure]({{ '/files/post_figures/tungara-frog.jpg' | relative_url }}){: .img}

Researchers wanted to test whether mating calls with chucks were more likely to attract females. In an experiment, researchers placed female frogs in the middle of a room and played different male mating calls (whine or whine-chuck) on either end of the room, allowing female frogs hop towards their preferred noise. Researchers randomly selected 15 non-gravid female tungara frogs to test. One at a time, each female frog was given the opportunity to choose between two vocalizations (without seeing a male): whine and whine-chuck. The noise the female walks towards indicates her mate choice. Ultimately, they found that 2 female frogs preferred whine, and 13 female frogs preferred whine-chuck. 

**Conduct a binomial test to ask if females showed a preference for whine-chunk.** Take the following steps:

+ Understand why the binomial test is applicable here
+ Determine the appropriate null probability of success
+ *Estimate* the probability of success from the data, including the estimate and standard error
+ State the null, alternative hypotheses 
+ Conduct the test
+ Report results, conclusions


<br><br>

## $$\chi^2$$ goodness-of-fit test

Periwinkles, small species of sea snail (pictured below) eat seaweed. Researchers want to know if periwinkles have a preference for different seaweed plants. 


![figure]({{ '/files/post_figures/seasnail.png' | relative_url }}){: .img2}


In one tidal pool, researchers count the number of periwinkles found feeding on four different kinds of seaweed: spiral wrack, bladder wrack, toothed wrack, and knotted wrack. Researchers also measured the relative frequencies of these four seaweed species in this environement. A table giving the number of periwinkles eating on, and the frequency of different seaweeds is below:


Seaweed | Seaweed frequency | Number of perwinkles eating it
--------|--------------------|--------------------------
Spiral wrack | 10%           | 9 
Bladder wrack | 25%          | 28
Toothed wrack | 15%          | 19
Knotted wrack | 50%          | 64


**Conduct a $$\chi^2$$ goodness-of-fit test to ask if periwinkles feed on seaweed with no preference for species.** Take the following steps:

+ Understand why the goodness-of-fit test is applicable here
+ Determine the appropriate null frequencies 
+ State the null, alternative hypotheses 
+ Conduct the test
+ Report results, conclusions


<br><br>

## Contingency table analysis

In 1999, Researchers studied the prevalence of Hepatitis C (HCV) in Americans to determine if there is an association between the number of sexual partners an individual has had and the presence of HCV. They took a random sample of 11,106 records from a National Health Survey to assess this association. Their data is found in the file [hcv_partners.csv]({{ '/datasets/hcv_partners.csv' | relative_url }}). 

**Conduct a $$\chi^2$$ contingency table test to ask if HCV prevalence is associated with having many (>=10) or few (<10) partners.** Take the following steps:

+ Read in and examine the data
+ Figure out how to create your contingency table from the dataframe (hint: you will need `dplyr` functions including `filter()` and `tally()`, and if you recall how to use `ifelse()` this may be of interest as well)
	+ Variable 1: Has HCV (1) or not (0)
	+ Variable 2: Has had < 10 partners or >=10 partners 
+ State the null, alternative hypotheses 
+ Create your contingency table in R
+ Conduct the test
+ Report results, conclusions


