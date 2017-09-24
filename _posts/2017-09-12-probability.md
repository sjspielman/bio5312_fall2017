---
layout: post
title:  "Introduction to Probability"
date:   2017-09-12
permalink: /day3_probability
---


## Lecture 

+ [Slides](./slides/day3_probability.pdf)
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
  
  + \$$P[A\ and\ B] = P[B\vert A]\ *\ P[A]$$ 
  
  + \$$P[B\ and\ A] = P[A\vert B]\ *\ P[B]$$  

<br>
+ Together, the above probabilities reveal **Bayes Theorem**
	+ \$$P[B\vert A] = \large{\frac{P[A\vert B]\ *\ P[B]}{P[A]}}$$


<br>

## R lab

Most R materials are available in slides. In addition, the function `na.omit()` will remove **all rows with NA's** from a data frame. 