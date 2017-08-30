---
layout: post
title:  "Introduction to The Tidyverse"
date:   2017-09-05
permalink: /day2_tidyverse1
---

<!--
## Lecture 

+ [Slides](./slides/day2_intro_to_tidyverse.pdf)
+ [In-class exercises](./files/inclass/day2.html)

<br>
## R lab

### The Tidyverse

This "meta-package" consists of several R packages, or as the Founding Father Hadley Wickahm says, "The tidyverse is an opinionated collection of R packages designed for data science." 

+ [`ggplot2`](http://ggplot2.tidyverse.org/reference/index.html), for plotting.
+ [`dplyr`](http://http://dplyr.tidyverse.org/reference/index.html), for transforming and summarizing dataframe content
+ [`tidyr`](http://tidyr.tidyverse.org/reference/index.html), for transforming ("tidying") data frame structure
+ `purrr`, an upgrade of base R functional programming tools. (Beyond scope of class.)
+ `tibble`, an improved data frame. (Package will be used implicitly.)

Read about other packages that accompany the Tidyverse but aren't technically packaged with it [here](https://www.tidyverse.org/packages/). Click on `ggplot2`, `dplyr`, and `tidyr`, above for the **comprehensive** references for virtually all functionality of these packages. Most material within will be beyond the scope of this class, but everything you might need will be there.


**This class will focus on `dplyr` and `ggplot2`, as well as `RMarkdown`. Next week we will continue to explore `ggplot2` and introduce `tidyr`.**

#### `dplyr` Functions

Commands can be strung together in order using the pipe `%>%` operator. 


Function  | Use
----------|-----
`filter()`  | Filter data frame on row
`select()`  | Filter data frame on column
`mutate()`     | Add new column to data frame
`group_by()`  | Establish a group for downstream operations
`summarize()` | Perform a summary statistic on a column. Also can spell `summarise()`
`arrange()`   | Arrange a column. 
`n()`        | Count the number of observations in the current group


#### `dplyr` Examples 
<pre><code class="language-r">
### Install the packages ####
> install.packages("tidyverse") # Only do this one time

### Load the packages ###
> library(tidyverse) # Do this for every R session where you use the package(s)


###### Picking rows with filter() #######

### Base R equivalent
> iris[iris$Species == "virginica",]

### using dplyr::filter()
> filter(iris, Species == "virginica") 
	    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
	1           6.3         3.3          6.0         2.5 virginica
	2           5.8         2.7          5.1         1.9 virginica
	3           7.1         3.0          5.9         2.1 virginica
	4           6.3         2.9          5.6         1.8 virginica
	5           6.5         3.0          5.8         2.2 virginica
	6           7.6         3.0          6.6         2.1 virginica
	7           4.9         2.5          4.5         1.7 virginica
	8           7.3         2.9          6.3         1.8 virginica
	9           6.7         2.5          5.8         1.8 virginica
# Equivalent code with %>% pipe
> iris %>% filter(Species == "virginica")

</code></pre>


#### `Rmarkdown`

+ [RMarkdown reference](http://rmarkdown.rstudio.com/authoring_basics.html)

-->