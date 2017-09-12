require(tidyverse)
require(cowplot)
theme_set(theme_classic())

n <- 1e6
dists <- tibble(x = rnorm(n, mean=2, sd=1), y = -1*rbeta(n, 14,1), z=rbeta(n, 14,1))

## symmetric
ggplot(dists, aes(x=x))+geom_density() + xlab("") + ylab("") -> sym
ggplot(dists, aes(x=x))+geom_density() + xlab("") + ylab("") + geom_vline(xintercept=mean(dists$x), color="red", size=4) + geom_vline(xintercept=median(dists$x), color="blue", size=2) -> sym_mm

##right
ggplot(dists, aes(x=y))+geom_density() + xlab("") + ylab("") -> right
ggplot(dists, aes(x=y))+geom_density() + xlab("") + ylab("") + geom_vline(xintercept=mean(dists$y), color="red", size=2) + geom_vline(xintercept=median(dists$y), color="blue", size=2) ->right_mm

##left
ggplot(dists, aes(x=z))+geom_density() + xlab("") + ylab("") -> left
ggplot(dists, aes(x=z))+geom_density() + xlab("") + ylab("") + geom_vline(xintercept=mean(dists$z), color="red", size=2) + geom_vline(xintercept=median(dists$z), color="blue", size=2) ->left_mm


all <- plot_grid(sym, left, right, sym_mm, left_mm, right_mm, nrow=2, ncol=3)
ggsave("meanmedianskew.pdf", all)
