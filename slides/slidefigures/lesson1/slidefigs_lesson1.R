## SJS. Reproduce (note these are sims) slide figures from day 1.

require(dplyr)
require(cowplot)
require(tidyr)

### Histogram
dat <- data.frame(x = rnorm(500, mean=15))
ggplot(dat, aes(x =x)) + geom_histogram(fill = "dodgerblue", color = "black") + xlab("Value") + ylab("Count") -> histo
ggsave("example_histogram.pdf", histo)

### Density
ggplot(dat, aes(x=x)) + geom_density(fill = "chartreuse4", color = "black") + xlab("Value") + ylab("Density") -> denso
ggsave("example_density.pdf", denso)
ggplot(dat, aes(x=x)) + geom_density(fill = "chartreuse4", color = "black", alpha=0.4)  -> denso2
ggplot(dat, aes(x=x)) + geom_histogram(fill = "white", color = "black")  -> histo2
ggsave("example_density_overlay.pdf", denso2)
ggsave("example_histogram_overlay.pdf", histo2)


### Boxplots
ggplot(dat, aes(y=x, x="")) + geom_boxplot(fill = "maroon", color = "black") + xlab("") + ylab("Value") -> boxo
ggsave("example_boxplot.pdf", boxo)

### Misleading boxplots and clarifying histograms
boxes <- data.frame(y = c(rnorm(5000, mean=6, sd=3), rnorm(2500, mean=2, sd=2), rnorm(2500, mean=10, sd=2)), x = c(rep("uni", 5000), rep("bi", 5000)))
ggplot(boxes,  aes(x = x, y = y, fill=x)) + geom_boxplot() + scale_fill_manual(values=c("forestgreen", "coral3")) + xlab("Distributions") + ylab("Value") + theme(legend.position = "none", axis.text.x = element_blank(), axis.ticks.x = element_blank()) -> misleadingboxes
ggsave("boxplots_misleading.pdf", misleadingboxes)
ggplot(boxes2, aes(x=y, fill=x2)) + geom_histogram(color="black") + facet_grid(~x2) + scale_fill_manual(values=c("forestgreen", "coral3")) + xlab("Value") + ylab("Count") + theme(legend.position = "none") -> histosss
ggsave("histograms_uni_bi.pdf", histosss)


### Violin
dat <- data.frame(a = rnorm(1000, mean=5, sd = 2), b= rnorm(1000, mean=2, sd = 1), c=rnorm(1000, mean=4, sd = 0.3))
dat %>% gather(key, value, a:c) -> dat2
#names(dat2) <- c("key", "value", "N(5,4)", "N(2,1)", "N(4,0.09)")
ggplot(dat2, aes(x="",y=value, fill=key)) + geom_violin(color = "black") + scale_fill_manual(values=c("coral1", "coral3", "coral")) + facet_grid(~key) + theme(strip.background = element_blank(), strip.text.x = element_blank(), legend.position="none") -> v3
ggplot(dat2, aes(x=value,fill=key)) + geom_density(color = "black") + scale_fill_manual(values=c("coral1", "coral3", "coral")) + facet_wrap(~key, scales="free") + theme(strip.background = element_blank(), strip.text.x = element_blank(), legend.position="none")  -> d3
ggplot(dat2, aes(x="", y=value, fill=key)) + geom_boxplot(color = "black", size=0.5, outlier.size=0.5) + scale_fill_manual(values=c("coral1", "coral3", "coral")) + facet_grid(~key) + theme(strip.background = element_blank(), strip.text.x = element_blank(), legend.position="none")  -> b3
together <- plot_grid(v3, d3, b3, nrow=3)
save_plot("violin_density_box.pdf", together, base_height=8)

### Barplot
dat2 <- data.frame(flowers = c(rep("red", runif(1, 10, 70)), 
                              rep("pink", runif(1, 10, 70)), 
                              rep("white", runif(1, 10, 70)), 
                               rep("orange", runif(1, 10, 70)) ))
dat2 %>% group_by(flowers) %>% tally() ->dat2
ggplot(dat2, aes(x = flowers, y = n, fill = flowers)) + geom_bar(stat="identity", color="black") + scale_fill_manual(values=c("orange", "pink", "red", "white"), name = "Flower color") + ylab("Count") + xlab("Flowers in garden")->baro
ggsave("example_barplot.pdf", baro)


### Scatterplots
scat <- data.frame(x = rnorm(100), y = rexp(100))
ggplot(scat, aes(x,y)) + geom_point() + xlab("Variable 1") + ylab("Variable 2") -> scatter
ggsave("scatter_nocorr.pdf", scatter)
y <- x * runif(100, 1, 3)
scat <- data.frame(x = rnorm(100), y = y)
ggplot(scat, aes(x,y)) + geom_point() + xlab("Variable 1") + ylab("Variable 2") -> scatter2
ggsave("scatter_cor.pdf", scatter2)
