---
layout: post
title:  "Linear Modeling II and Logistic Regression"
date:   2017-10-31
permalink: /day10_lm2_logistic
---


## Lecture 

+ [Slides](./slides/day10_lm2_logistic.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day10_exercises.md %})
+ [**Linear modeling supplement**]({{ site.baseurl }}{% link files/lm_supplement.pdf %})
	+ An *excellent* overview of linear modeling, including model intepretation and fitting in R, written by [Claus Wilke, PhD](http://wilkelab.org).

<br>
## R content

+ [Broom vignette](https://cran.r-project.org/web/packages/broom/vignettes/broom.html)
+ See Linear modeling supplement above as well


### Linear models

+ `lm(Y ~ x + x1 + x2, data = data)`, with three independent predictors
+ `lm(Y ~ x*x1, data = data)`, with an interaction effect
+ `lm(Y ~ x + x1 + x:x1, data = data)`, with an interaction effect, written more verbosely
+ `lm(Y ~ ., data = data)`, to include all other columns as predictors

### Logistic regression

+ `glm(Y ~ x + x1 + x2, data = data, family = 'binomial')`, with three independent predictors
+ `glm(Y ~ ., data = data, family = 'binomial')`, to include all other columns as predictors
+ Code to extract relevant information for plotting:
<pre><code class="language-r">

model <- glm(Y ~ ., data = data, family = 'binomial')

plot.data <- tibble(x = model$linear.predictors,
                    y = model$fitted.values,
                    response = data$Y)
</code></pre>



