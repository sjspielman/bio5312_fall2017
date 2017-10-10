---
layout: post
title:  "Nonparametric tests and tidyr"
date:   2017-10-10
permalink: /day7_nonparametric_tidyr
---


## Lecture 

+ [Slides](./slides/day7_nonparametric_tidyr.pdf)
+ [In-class exercises]({{ site.baseurl }}{% link inclass/day7_exercises.md %})


<br>
## R Lesson

+ [Tidy data paper]({{ site.baseurl }}{% link files/tidy-data.pdf %})
+ [**Reference** Dplyr and Tidyr all together](https://rpubs.com/bradleyboehmke/data_wrangling)


<br>
### Guided exercises 
The following is based on [Chapter 12, "R for Data Science"](http://r4ds.had.co.nz/tidy-data.html#tidy-data-1).

We have several tables (built-in data in `tidyr`) containing the same information:

+ `table1`
+ `table2`
+ `table3`
+ `table4a` and `table4b`
+ `table5`

Of these, only `table1` is tidy: Each column is a variable and each row is an observation.


<pre><code class="language-r">
> table 1
# A tibble: 6 x 4
      country  year  cases population
*        \<chr\> \<int\>  \<int\>      \<int\>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583 
</code></pre>

We will now proceed to convert the remaining tables into tidy tables.

<br>
### Tidying table2

The tibble `table2` is not tidy because observations are spread across multiple rows. This calls for the verb **`spread()`**.

<pre><code class="language-r">
> table2
# A tibble: 12 x 4
       country  year       type      count
*         \<chr\> \<int\>      \<chr\>      \<int\>
 1 Afghanistan  1999      cases        745
 2 Afghanistan  1999 population   19987071
 3 Afghanistan  2000      cases       2666
 4 Afghanistan  2000 population   20595360
 5      Brazil  1999      cases      37737
 6      Brazil  1999 population  172006362
 7      Brazil  2000      cases      80488
 8      Brazil  2000 population  174504898
 9       China  1999      cases     212258
10       China  1999 population 1272915272
11       China  2000      cases     213766
12       China  2000 population 1280428583

> table2 %>% spread(type, count)
# A tibble: 6 x 4
      country  year  cases population
*       \<chr\> \<int\>  \<int\>      \<int\>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
</code></pre>


<br>
### Tidying table3

The tibble `table3` is not because there are two variables contained in the column `rate`. This calls for the verb **`separate()`**.

<pre><code class="language-r">
> table3
# A tibble: 6 x 3
      country  year              rate
*       \<chr\> \<int\>             \<chr\>
1 Afghanistan  1999      745/19987071
2 Afghanistan  2000     2666/20595360
3      Brazil  1999   37737/172006362
4      Brazil  2000   80488/174504898
5       China  1999 212258/1272915272
6       China  2000 213766/1280428583

> table3 %>% separate(rate, into=c("cases", "population"), sep = "/")
# A tibble: 6 x 4
      country  year  cases population
*       \<chr\> \<int\>  \<chr\>      \<chr\>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583

## Notice how cases and population are **characters**? We should force the tidyverse to re-evaluate
> table3 %>% separate(rate, into=c("cases", "population"), sep = "/", convert = TRUE)
# A tibble: 6 x 4
      country  year  cases population
*       \<chr\> \<int\>  \<int\>      \<int\>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
</code></pre>


<br>
### Tidying table4a, table4b

The tibbles `table4a` and `table4b` together contain all information in `table1`. Each of these is not tidy because it misuses values as variables, which calls for the verb **`gather()`**. Further, to recreate `table1`, we must use the `dplyr` function **`left_join()`**.

<pre><code class="language-r">
> table4a
# A tibble: 3 x 3
      country `1999` `2000`
*       \<chr\>  \<int\>  \<int\>
1 Afghanistan    745   2666
2      Brazil  37737  80488
3       China 212258 213766

### Note the back-ticks to call columns that are **numbers**
> table4a %>% gather(year, cases, `1999`:`2000`) -> tidy4a
> tidy4a
# A tibble: 6 x 3
      country  year  cases
        \<chr\> \<chr\>  \<int\>
1 Afghanistan  1999    745
2      Brazil  1999  37737
3       China  1999 212258
4 Afghanistan  2000   2666
5      Brazil  2000  80488
6       China  2000 213766

> table4b
# A tibble: 3 x 3
      country     `1999`     `2000`
*       \<chr\>      \<int\>      \<int\>
1 Afghanistan   19987071   20595360
2      Brazil  172006362  174504898
3       China 1272915272 1280428583

### Note the back-ticks to call columns that are **numbers**
> table4b %>% gather(year, population, `1999`:`2000`) -> tidy4b
# A tibble: 6 x 3
      country  year population
        \<chr\> \<chr\>      \<int\>
1 Afghanistan  1999   19987071
2      Brazil  1999  172006362
3       China  1999 1272915272
4 Afghanistan  2000   20595360
5      Brazil  2000  174504898
6       China  2000 1280428583

### Finally, join together
> left_join(tidy4a, tidy4b)

# A tibble: 6 x 4
      country  year  cases population
        \<chr\> \<chr\>  \<int\>      \<int\>
1 Afghanistan  1999    745   19987071
2      Brazil  1999  37737  172006362
3       China  1999 212258 1272915272
4 Afghanistan  2000   2666   20595360
5      Brazil  2000  80488  174504898
6       China  2000 213766 1280428583
</code></pre>

<br>
### Tidying table5

The tibble `table5` is not tidy because two variables are split into two columns (century and year). This calls for the verb **`unite()`**. We also have a similar situation as `table3` with the `rate` column.

<pre><code class="language-r">
>table5
># A tibble: 6 x 4
      country century  year              rate
*       \<chr\>   \<chr\> \<chr\>             \<chr\>
1 Afghanistan      19    99      745/19987071
2 Afghanistan      20    00     2666/20595360
3      Brazil      19    99   37737/172006362
4      Brazil      20    00   80488/174504898
5       China      19    99 212258/1272915272
6       China      20    00 213766/1280428583

> table5 %>% unite(Year, century, year, sep="")
      country  Year              rate
*       \<chr\> \<chr\>             \<chr\>
1 Afghanistan  1999      745/19987071
2 Afghanistan  2000     2666/20595360
3      Brazil  1999   37737/172006362
4      Brazil  2000   80488/174504898
5       China  1999 212258/1272915272
6       China  2000 213766/1280428583

### Finish it up as in table3
> table5 %>% 
	unite(Year, century, year, sep="") %>% 
	separate(rate, into=c("cases", "population"), sep = "/", convert=TRUE)
# A tibble: 6 x 4
      country  Year  cases population
*       \<chr\> \<chr\>  \<int\>      \<int\>
1 Afghanistan  1999    745   19987071
2 Afghanistan  2000   2666   20595360
3      Brazil  1999  37737  172006362
4      Brazil  2000  80488  174504898
5       China  1999 212258 1272915272
6       China  2000 213766 1280428583
</code></pre>



