---
layout: page
title: Inclass exercises, Day II
permalink: /inclass_exercises_day2/
---
> Follow [this link]({{ '/day2_tidyverse1' | relative_url }}) for day 2 materials and notes

<br>

### Install packages

Install the `tidyverse`, `knitr`, and `rmarkdown` packages before beginning. You can achieve this via the RStudio interface or via the command line:
<pre><code class="language-r">
install.packages("tidyverse")
install.packages("knitr")
install.packages("rmarkdown")
</code></pre>

<br><br>

### **`dplyr`** Exercises

These exercises will use the built-in R dataset, `CO2`. Information about this dataset is available [at this link](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/zCO2.html). Briefly, this dataset describes the results of an experiment on the cold tolerance of the grass species *Echinochloa crus-galli* and contains five columns:

+ **Plant**, a unique identifier for each plant
+ **Type**, the origin of plant (either Mississippi or Quebec)
+ **Treatment**, the experimental treatment applied to plant, either chilled or non-chilled
+ **conc**, the concentration of ambient CO2 in the experiment
+ **uptake**, rate of CO2 uptake observed in the experiment

Load the dataset and examine its contents before starting the exercises. Make sure to load the Tidyverse as well!
<pre><code class="language-r">
library(tidyverse)
data(CO2)
head(CO2)
	  Plant   Type  Treatment conc uptake
	1   Qn1 Quebec nonchilled   95   16.0
	2   Qn1 Quebec nonchilled  175   30.4
	3   Qn1 Quebec nonchilled  250   34.8
	4   Qn1 Quebec nonchilled  350   37.2
	5   Qn1 Quebec nonchilled  500   35.3
	6   Qn1 Quebec nonchilled  675   39.2
</code></pre>

*Note that this dataset is CO2 in capital letters - the lowercase dataset is something entirely different!!*

**Peform the following tasks with `dplyr`**

1. Pick all the `Qn1` rows from CO2 using `filter()`. How many distinct treatments was this plant subject to?

2. Uptake in this dataframe is measured in mL/L. In a single command, perform the following (be careful to **not overwrite** the original data frame):
	+ Create a new column in this CO2 using `mutate()` called conc2 which contains the concentration measured in cL/L (i.e. the value divided by 10).  
	+ Remove the original concentration column using `select()` and save the final dataframe to CO2.2. Examine the final dataframe with `head()` to ensure that this has been completed correctly.
	
3. For all plants subject to a CO2 concentration greater than or equal to 500, answer the following questions using `summarize()`. Again, use only a single line of code where commands are strung together with `%>%`:
	 + What is the median uptake for these plants?
	 + What is the median uptake for all non-chilled plants from Mississippi?
	 + What is the median uptake for each plant type (Quebec and Mississippi)?
	 + What is the median uptake across each plant type, treatment, and CO2 concentration?
	 + How many plants from Quebec have an uptake less than 25 at these concentrations?
	 + Which plant from Mississippi has the largest uptake at a concentration of 1000? Print only the Plant column in your command (hint: use `select()`).

4. Make a table (data frame) of experimental groups indicating how many (hint: `tally()`) plants of each Type experienced each condition (Treatment and concentration). End your command by piping into the function `print.data.frame()` to see all rows. 
	+ The command `unique()` will extract all unique rows from a data frame. Using this command (and others), select the tallied column from the dataframe and remove all duplicate rows. This result will tell you how many experimental treatments was each plant subjected to. (Hint: you should end up with **one** row.)


<!--
<br><br>

### **`Rmarkdown`** and **`ggplot2`** exercises

Open RStudio and create a new RMarkdown file. Modify the setup code chunk as follows:

<pre><code class="language-r">
### Original chunk
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### New chunk
```{r global_options, include=FALSE}
library(knitr)
library(tidyverse)
knitr::opts_chunk$set(echo = TRUE, fig.align="center", fig.height=4.5, fig.width=4.5)
```
</code></pre>

<br>

For this exercise, convert the questions/answers/code for the above `dplyr` exercises into an RMarkdown document by directly editing the new RMarkdown file you just created. Use the following rules:

+ Question numbers (i.e. "Question 1") should be second-level headers (##)
+ Questions themselves should be in bold, beneath the relevant header. Code chunks should immediately follow the questions (i.e. there can be several code chunks per question, as needed).


**Once this document knits without errors**, make new question headers to create the following figures in your Rmarkdown document:

1. Histogram of CO2 uptake values for all plants
2. Histogram of CO2 uptake values for all plants from Mississippi
3. Barplot of CO2 Treatments for all plants
4. Barplot of CO2 Treatments for all plants from Quebec with uptakes greater than 40. Color bars according to Treatment specifically using `scale_fill_brewer(palette="greens")` (make sure to specify the aesthetic!). For this plot, try to use a **single command** where the data frame is directly piped in (`%>%`) to `ggplot`.
5. Scatterplot of CO2 uptake against concentration (meaning CO2 is the **response** variable), where points are colored by Type. 
6. Modify the scatterplot to make a *line plot* where a line goes through each plant. For this, you will need to specify a *group aesthetic* where each **Plant** is a grouping (but please also make without this aesthetic to compare).

-->











