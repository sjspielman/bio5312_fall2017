---
layout: page
title: Inclass exercises solutions, Day II
permalink: /inclass_exercises_day2_solutions/
---

### `dplyr` Exercises

1. Pick all the `Qn1` rows from CO2 using `filter()`. How many distinct treatments was this plant subject to?
	<pre><code class="language-r">
	CO2 %>% filter(Plant == "Qn1")
			  Plant   Type  Treatment conc uptake
		1   Qn1 Quebec nonchilled   95   16.0
		2   Qn1 Quebec nonchilled  175   30.4
		3   Qn1 Quebec nonchilled  250   34.8
		4   Qn1 Quebec nonchilled  350   37.2
		5   Qn1 Quebec nonchilled  500   35.3
		6   Qn1 Quebec nonchilled  675   39.2
		7   Qn1 Quebec nonchilled 1000   39.7
	## One treatment
	</code></pre>


2. Uptake in this dataframe is measured in mL/L. In a single command, perform the following (be careful to **not overwrite** the original data frame):
	+ Create a new column in this CO2 using `mutate()` called conc2 which contains the concentration measured in cL/L (i.e. the value divided by 10).  
	+ Remove the original concentration column using `select()` and save the final dataframe to CO2.2. Examine the final dataframe with `head()` to ensure that this has been completed correctly.
	
	<pre><code class="language-r">
	CO2 %>% 
		mutate(conc2 = conc*0.1) %>% 
		select(-conc) -> CO2.2
	head(CO2.2)
		  Plant   Type  Treatment uptake conc2
		1   Qn1 Quebec nonchilled   16.0   9.5
		2   Qn1 Quebec nonchilled   30.4  17.5
		3   Qn1 Quebec nonchilled   34.8  25.0
		4   Qn1 Quebec nonchilled   37.2  35.0
		5   Qn1 Quebec nonchilled   35.3  50.0
		6   Qn1 Quebec nonchilled   39.2  67.5
	</code></pre>
	
	
3. For all plants subject to a CO2 concentration greater than or equal to 500, answer the following questions using `summarize()`. Again, use only a single line of code where commands are strung together with `%>%`:
	 + What is the median uptake for these plants?
	 		
	 <pre><code class="language-r">
	CO2 %>% 
		filter(conc >= 500) %>% 
		summarize(median(uptake))
	</code></pre>
			
	 + What is the median uptake for all non-chilled plants from Mississippi?
	 	 		
	 <pre><code class="language-r">
	CO2 %>% 
		filter(conc >= 500, Treatment == "nonchilled", Type == "Mississippi") %>%
		summarize(median(uptake))
	</code></pre>
		
		
	 + What is the median uptake for each plant type (Quebec and Mississippi)?
	 
	 <pre><code class="language-r">
	CO2 %>% 
		filter(conc >= 500 %>% 
		group_by(Type == "Mississippi") %>% 
		summarize(median(uptake))
	</code></pre>
	
	 + What is the median uptake across each plant type, treatment, and CO2 concentration?
	 
	<pre><code class="language-r">
	CO2 %>% 
		filter(conc >= 500 %>% 
		group_by(Type, Treatment, Concentration) %>% 
		summarize(median(uptake))	
	</code></pre>
	
	 + How many plants from Quebec have an uptake less than 25 at these concentrations?
	 
	<pre><code class="language-r">
	CO2 %>% 
		filter(conc >= 500, uptake < 25, Type == "Quebec") %>%
		tally()
	</code></pre>
	
	
	 + Which plant from Mississippi has the largest uptake at a concentration of 1000? Print only the Plant column in your command (hint: use `select()`).

	<pre><code class="language-r">
	CO2 %>% 
		filter(conc == 1000, Type == "Mississippi") %>%
		filter(uptake == max(uptake)) %>% 
		select(Plant)
	</code></pre>

4. Determine how many (hint: `tally()`) plants of each Type experienced each condition (Treatment and concentration). End your command by piping into the function `print.data.frame()` to see all rows. 

	<pre><code class="language-r">
	CO2 %>% 
		group_by(Type, Treatment, conc) %>%
		tally()
	</code></pre>

	+ The command `unique()` will extract all unique rows from a data frame. Using this command (and others), select the tallied column from the dataframe and remove all duplicate rows. This result will tell you how many experimental treatments was each plant subjected to. (Hint: you should end up with **one** row.)

	<pre><code class="language-r">
	CO2 %>% 
		group_by(Type, Treatment, conc) %>%
		tally() %>%
		ungroup() %>%
		select(n) %>%
		unique()
	</code></pre>
	 
