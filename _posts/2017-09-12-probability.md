---
layout: post
title:  "Basic Probability and Tidyverse II"
date:   2017-09-12
permalink: /day3_probability_tidyverse2
---


## Lecture 

+ [Slides](./slides/day3_probability_tidyverse.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day3_exercises.md %})

<br>
## Probability Rules

+ Probability of **mutually exclusive** events A *or* B 
  + \$$P[A\ or\ B] = P[A] + P[B]$$

<br>
+ Probability of **not mutually exclusive** events A *or* B 
  + \$$P[A\ or\ B] = P[A] + P[B] - P[A\ and\ B]$$

<br>
+ Probability of **independent** events A *and* B 
  + \$$P[A\ and\ B] = P[A]\ *\ P[B]$$

<br>
+ Probability of **dependent** events A *and* B 
  
  + \$$P[A\ and\ B] = P[B\vert A]\ *\ P[B]$$ 
  
  + \$$P[B\ and\ A] = P[A\vert B]\ *\ P[A]$$  

<br>
+ Together, the above probabilities reveal **Bayes Theorem**
	+ \$$P[B\vert A] = \large{\frac{P[A\vert B]\ *\ P[B]}{P[A]}}$$


<br>

## R lab

All of today's new R materials are available in the lecture slides.