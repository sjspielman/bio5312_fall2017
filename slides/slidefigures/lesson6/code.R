require(tidyverse)
require(purrr)
require(cowplot)

## binomial example
n=12
x=5
p=0.3
pmf.data <- tibble(x = 0:12, prob = map_dbl(0:12, dbinom, 12, 0.3))
binom.pmf <- ggplot(pmf.data, aes(x=x,y=prob)) + 
                geom_bar(stat="identity") + 
                scale_x_continuous(name = "Number of males (successes)", breaks=0:12, labels=0:12) + 
                ylab("Probability mass") + 
                geom_text(aes(x = x, y = prob + 0.005, label=signif(prob, 2)), size=3)
save_plot("binomial_pmf.pdf", binom.pmf, base_width=8)