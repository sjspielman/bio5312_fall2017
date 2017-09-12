---
layout: page
title: Inclass exercises solutions, Day III
permalink: /inclass_exercises_day3_solutions/
---

 
## Exercises

Create the following figures for the R `CO2` dataset using `ggplot2`. When applicable, use only **one line of code** to create each figure by piping commands together.

**NOTE:** For these solutions, the following command was run before generating any figures. This sets the ggplot theme to "classic" for all plots created in the R session:
<pre><code class="language-r">
theme_set(theme_classic())
</code></pre>

<br><br>

1. Histogram of CO2 uptake values for all plants

<pre><code class="language-r">
ggplot(CO2, aes(x = uptake)) + geom_histogram()
</code></pre>

![figure]({{ '//inclass/day3_figures/figure1.png' | relative_url }}){: .img}

<br>
2. Histogram of CO2 uptake values for all plants from Mississippi

<pre><code class="language-r">
CO2 %>% 
	filter(Type == "Mississippi") %>%
	ggplot(aes(x = uptake)) + geom_histogram()
</code></pre>

![figure]({{ '//inclass/day3_figures/figure2.png' | relative_url }}){: .img}


3. Histogram of CO2 uptake values for all plants from Mississippi. This time, provide the argument `bins=50` to `geom_histogram()`, as in: geom_histogram(bins=50). Then, provide `bins=5` and finally `bins=100`. Think about how these plots compare and therefore what this argument is doing.

<pre><code class="language-r">
CO2 %>% 
	filter(Type == "Mississippi") %>%
	ggplot(aes(x = uptake)) + geom_histogram(bins=50)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure3a.png' | relative_url }}){: .img}


<pre><code class="language-r">
CO2 %>% 
	filter(Type == "Mississippi") %>%
	ggplot(aes(x = uptake)) + geom_histogram(bins=5)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure3b.png' | relative_url }}){: .img}

<pre><code class="language-r">
CO2 %>% 
	filter(Type == "Mississippi") %>%
	ggplot(aes(x = uptake)) + geom_histogram(bins=100)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure3c.png' | relative_url }}){: .img}

**_Fewer bins means less resolution in the histogram. More bins means thinner, finer bars._**

<br>
4. **Faceted** histogram of CO2 uptake values across plant Type

<pre><code class="language-r">
ggplot(CO2, aes(x = uptake)) + geom_histogram() + facet_grid(~Type)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure4.png' | relative_url }}){: .img}



5. Scatterplot of CO2 uptake against concentration (meaning uptake is the **response** variable) for all nonchilled plants, where points are colored by plant Type

<pre><code class="language-r">
CO2 %>%
	filter(Treatment == "nonchilled") %>%
	ggplot(aes(x = conc, y = uptake)) + geom_point(aes(color = Type))
</code></pre>

![figure]({{ '//inclass/day3_figures/figure5.png' | relative_url }}){: .img}


6. **Faceted** scatterplot of CO2 uptake against concentration across plant Type, where points are colored by Treatment

<pre><code class="language-r">
CO2 %>%
	ggplot(aes(x = conc, y = uptake)) + geom_point(aes(color = Treatment)) + facet_grid(~Type)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure6.png' | relative_url }}){: .img}


7. **Faceted** scatterplot of CO2 uptake against concentration across plant Type and Treatment, i.e. the final figure should have 2 rows and 2 columns. 


<pre><code class="language-r">
CO2 %>%
	ggplot(aes(x = conc, y = uptake)) + geom_point() + facet_grid(Treatment~Type)
</code></pre>

![figure]({{ '//inclass/day3_figures/figure7.png' | relative_url }}){: .img}
