---
layout: post
title:  "Testing Proportions"
date:   2017-10-03
permalink: /day6_testing_proportions
---


## Lecture 

+ [Slides](./slides/day6_testing_proportions.pdf)
+ [Contingency table supplement](./files/chisq_supplement.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day6_exercises.md %})

<br>
## R reference


### Hypothesis testing functions
 
Function  | Test | Usage | Notes
-------------------|---------|------------------|---------------
`binom.test()`  | Run an exact binomial test| `binom.test(k, n, null_p` | Remember to specify the **null probability of success** as the final argument
`chisq.test()` | Run a $$\chi^2$$ goodness of fit test | `chisq.test(<observed counts>, p = <null frequencies>)`| `chisq.test(c(100, 150, 32), p = c(1/3, 1/3, 1/3))`
`chisq.test()` | Run a $$\chi^2$$ contingency table analysis| `chisq.test(<contingency table>)` |`cont.table <- rbind(c(45,54), c(67,88))` <br><br> `chisq.test(cont.table)`
`fisher.test()` | Run Fisher's exact test | `fisher.test(<contingency table>`) | Usage is the same as for contingency `chisq.test()`


### 2x2 contingency table calculations

![figure]({{ '/files/post_figures/contingency_table.gif' | relative_url }}){: .img2}


+ Odds ratio = $$\frac{A/C}{B/D} = \frac{A*D}{B*C}$$ (or reciprocal)

+ Relative risk for Row1 over Row2 =  $$\frac{A/(R1)}{C/(R2)}$$



