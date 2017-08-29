---
layout: post
title:  "Introduction to The Tidyverse"
date:   2017-09-05
---


## Lecture 

+ [Slides](./slides/day2_tidyverse.pdf)
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

#### `dplyr` and `tidyr` Functions

Commands can be strung together in order using the pipe `%>%` operator. 


Function  |  Package  | Use
----------|-----------|-----
`filter()`  | `dplyr` | Filter data frame on row
`select()` | `dplyr` | Filter data frame on column
`mutate()` | `dplyr`    | Add new column to data frame
`group_by()` | `dplyr`  | Establish a group for downstream operations
`summarize()` | `dplyr`| Perform a summary statistic on a column. Also can spell `summarise()`
`arrange()`  | `dplyr`   | Arrange a column. 
`n()`       | `dplyr`   | Count the number of observations in the current group
`spread()`  | `tidyr`  | Spread a key-value pair across multiple columns (opposite of `gather()`)
`gather()` | `tidyr` | Gather columns into key-value pairs (opposite of `spread()`)
`separate()`| `tidyr` | Separate one column into multiple columns (opposite of `unite()`)
`unite()` | `tidyr`| Unite multiple columns into one (opposite of `separate()`)


#### `dplyr` Examples 
<pre><code class="language-r">
require(tidyverse)
</code></pre>


#### `ggplot2`

#### `Rmarkdown`

+ [RMarkdown reference](http://rmarkdown.rstudio.com/authoring_basics.html)

