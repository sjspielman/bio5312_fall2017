---
layout: post
title:  "Resampling statistic and multiple testing"
date:   2017-10-17
permalink: /day8_resampling_multtesting
---


## Lecture 

+ [Slides](./slides/day8_resampling_multtesting.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day8_exercises.md %})


<br>
## R Lesson

Using `p.adjust()`:

+ To control the **family-wise error rate**, use "bonferroni". This approach is conservative: You will have fewer significant results after correction, but you can be fairly confident in them. You will have more false negatives than with an FDR correction.
	+ Note the other FWER methods are "holm", "hotchberg" and "hommel". 
+ To control the **false discovery rate**, use "BH" (or "fdr", which indicate the same correction, from Benjamini and Hochberg). This approach has more power: You will have more significant results after correction than had to you used the Bonferroni, but you will also have more false positives.
	+ Note the other FDR method is "BY" (Benjamini and Yekutieli)

   
### Functions which do your multiple testing and corrections

+ `pairwise.t.test()`
+ `pairwise.wilcox.test()`
+ `pairwise.prop.test()` (basically homogeneity)


### And we can tidy it up too
https://www.rdocumentation.org/packages/broom/versions/0.4.2/topics/tidy.pairwise.htest

> ptt2 <- pairwise.t.test(iris$Petal.Length, iris$Species)
> ptt2

	Pairwise comparisons using t tests with pooled SD 

data:  iris$Petal.Length and iris$Species 

           setosa versicolor
versicolor <2e-16 -         
virginica  <2e-16 <2e-16    

P value adjustment method: holm 
> tidy(ptt2)
Error in tidy(ptt2) : could not find function "tidy"
> library(broom)
> tidy(ptt2)
      group1     group2      p.value
1 versicolor     setosa 1.050917e-68
2  virginica     setosa 1.231842e-90
4  virginica versicolor 1.810597e-31


<pre><code class="language-r">
### Use function p.adjust() to correct an array of P-values for multiple testing
#### p.adjust(<p-value>, method = <correction method>)

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

https://www.rdocumentation.org/packages/broom/versions/0.4.2


pairwise.t.test(<dependent variable>, 
                <independent variable>, 
                p.adjust = <correction method>)

