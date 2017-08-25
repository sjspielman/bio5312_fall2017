---
layout: post
title:  "The Tidyverse"
date:   2017-09-05
---


## Lecture 



<br>
## R lab

### The Tidyverse

This "meta-package" consists of several R packages, or as the Founding Father Hadley Wickahm says, "The tidyverse is an opinionated collection of R packages designed for data science." 

+ `ggplot2`, for plotting
+ `dplyr`, for transforming and summarizing dataframe content
+ `tidyr`, for transforming ("tidying") data frame structure
+ `purrr`, an upgrade of base R functional programming tools 
	+ This package is more advanced and beyond the scope of this class.
+ `tibble`, an improved data frame 
	+ This package will be used implicitly.

Read about other packages that accompany the Tidyverse but aren't technically packaged with it [here](https://www.tidyverse.org/packages/).

Commands can be strung together in order using the pipe `%>%` operator. 

### `dplyr` and `tidyr` Functions



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


### Header 
<pre><code class="language-r">
require(tidyverse)
</code></pre>



