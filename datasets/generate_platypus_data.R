require(tidyverse)
require(readr)
require(cowplot)

platy <- read_tsv("platypusgc.tsv")

samp <- function(size, N){
    full <- tibble(sample.mean=numeric())
    for (i in 1:N){ 
        platy %>% sample_n(size) %>% summarize(sample.mean = mean(GC)) -> x
        full <- rbind(full, x)
    }
    full
}


s25 <- samp(10, 25)
s75 <- samp(10, 75)
s500 <- samp(10, 500)
s2000 <- samp(10, 2000)

ggplot(s25, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p1
ggplot(s75, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p2
ggplot(s500, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p3
ggplot(s2000, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p4

g <- plot_grid(p1, p2, p3, p4)

write_csv(s25, "platypus_gc_sampdist_n25.csv")
write_csv(s75, "platypus_gc_sampdist_n75.csv")
write_csv(s500, "platypus_gc_sampdist_n500.csv")
write_csv(s2000, "platypus_gc_sampdist_n2000.csv")

summ <- tibble(means = c(mean(s25$sample.mean), mean(s75$sample.mean), mean(s500$sample.mean), mean(s2000$sample.mean)), SE = c(sd(s25$sample.mean)/5, sd(s75$sample.mean)/sqrt(75), sd(s500$sample.mean)/sqrt(500), sd(s2000$sample.mean)/sqrt(2000)))
write_csv("platypus_gc_sampdist_stats.csv")