library(tidyverse)
stdnorm <- ggplot(aes(tibble(x=c(-4,4)) + stat_function(fun = dnorm)
)
stdnorm <- ggplot(tibble(x=c(-4,4), aes(x=x))) + stat_function(fun = dnorm)
stdnorm
ggplot(tibble(x=c(-4,4), aes(x=x))) + stat_function(fun = dnorm)
pr <- tibble(x=c(-4,4)))
pr <- tibble(x=c(-4,4))
pr
ggplot(pr, aes(x=x)) + stat_function(fun = dnorm)
ggplot(pr, aes(x=x)) + stat_function(fun = dnorm) + theme_bw()
library(cowplot)
ggplot(pr, aes(x=x)) + stat_function(fun = dnorm) + background_grid()
ggplot(pr, aes(x=x)) + stat_function(fun = dnorm) + background_grid(dnorm(0.47)
dnorm(0.47)
dnorm(0.47)
pnorm(0.47)
dnorm(0.6808)
dnorm(0.6808225)
qnorm(0.6808225)
pnorm(-1.32)
pnorm(0.47) - pnorm(-1.32)
mean(0.8, 4.4)
mean(c(0.8, 4.4)
)
4.4-0.8
4.6/4
0.8/1.1
(3-2.2)/1.1
pnorm(0.727)
pnorm(3, 2.6, sqrt(1.1)) 
pnorm(3, mean=2.6, sd=sqrt(1.1)) 
pnorm(3, mean=2.6, sd=1.1) 
sqrt(1.1)
pnorm(3, 2.6, 1.048809)
pnorm((3-2.2)/1.1))
(3-2.2)/sqrt(1.1)
(3-2.6)/sqrt(1.1)
pnorm(0.381)
pnorm(3, 2.6, sqrt(1.1)) 
(2.6-2.75)/sqrt(1.1)
(3.1-2.9)/sqrt(.87)
(2.74-2.6)/sqrt(1.1)
(2.75-2.6)/sqrt(1.1)
(2.95-2.6)/sqrt(1.1)
(3.1-2.9)/sqrt(.17)
dnorm(0.18)
qnorm(0.18)
qnorm(1-0.18)
pnorm(0.18)
qnorm(4)
qnorm(1)
qnorm(0)
1-pnorm(2)
1 - pnorm(2.14)
pnorm(-2.14)
qnorm(0.18)
qnorm(1 - 0.18)
pnorm(0.18)
pnorm(0.9)
qnorm(0.92)(
qnorm(0.92)
qnorm(0.92)
pnorm(2.2)
-1 * qnorm(0.08)
7.3**2
5.9**2
(150-175)/sqrt(53.3)
pnorm(-3.42)
pnorm(150, 175, sqrt(53.3))
pnorm(-3.424336)
pnorm(-3.424)
(170-162.5)/(sqrt(34.8))
1 - pnorm(1.2713)
1 - pnorm(170, 162.5, sqrt(34.8))
qnorm(0.11)
qnorm(0.22)
qnorm(0.22)*sqrt(34.8) + 162.5
qnorm(0.22, 162.5, sqrt(34.8))
qnorm(1-0.22, 162.5, sqrt(34.8))
.7721*sqrt(34.8)+162.5
.7722*sqrt(34.8)+162.5
pnorm(182, 175, sqrt(53.3)) – 0.5
pnorm(182, 175, sqrt(53.3))-0.5
pnorm(150, 175, sqrt(53.3)) – pnorm(140, 175, sqrt(53.3))   
pnorm(150, 175, sqrt(53.3)) - pnorm(140, 175, sqrt(53.3))   
pnorm(160, 175, sqrt(53.3)) - pnorm(150, 175, sqrt(53.3))   
0.3311738 + 0.01965059
1 - pnorm(180, 175, sqrt(53.3))
pnorm(170, 162.5, sqrt(34.8)) – pnorm(163, 162.5, sqrt(34.8))
pnorm(170, 162.5, sqrt(34.8))- pnorm(163, 162.5, sqrt(34.8))
0.246713*0.3644282
pnorm(155, 162.5, sqrt(34.8))
pnorm(155, 175, sqrt(53.3))
1-.502
0.0031*0.498 + .102*.502
.102*.508/.0527
0.0031*0.492 + .102*.502
.0031*.492 + .102*.508
.102*.508/.533
genes <- read.csv("genes.csv")
head(gene)
head(genes)
ggplot(genes, aes(x = nucleotides))  +geom_histogram(fill = "white", color="black")
ggplot(genes, aes(x = nucleotides))  +geom_histogram(fill = "white", color="black") ->allgenes
ggplot(subset(genes, 100), aes(x = nucleotides))  +geom_histogram(fill = "white", color="black") 
genes %>% sample_n(100)
genes %>% sample_n(100) %>% summarize(mean(nucleotides))
save_plot("genes_population.pdf", allgenes)
head(genes)
mean(genes$nucleotides)
sd(genes$nucleotides)
genes %>% sample_n(10)
genes %>% sample_n(100) %>% summarize(mean(nucleotides))
genes %>% map_dbl(0:100, sample_n(100))
map_dbl(0:100, sample_n(genes, 100))
sample_n(genes, 100)
full <- tibble(sample.mean=numeric()
)
for (i in 1:50){ 
genes %>% sample_n() %>% summarize(sample.mean = mean(nucleotides)) -> x
for (i in 1:50){ 
genes %>% sample_n() %>% summarize(sample.mean = mean(nucleotides)) -> x
full <-rbind(full,x)
}
full
for (i in 1:50){ 
genes %>% sample_n(100) %>% summarize(sample.mean = mean(nucleotides)) -> x
full <-rbind(full,x)
}
full
head(full)
ggplot(full, aes(x=sample.mean)) + geom_histogram(fill="white", color="black")
samp function(){ 
function samp(n){
samp function(n){
samp <- function(n){
full <- tibble(sample.mean=numeric()
for (i in 1:n){ 
samp <- function(n){
full <- tibble(sample.mean=numeric())
for (i in 1:n){ 
genes %>% sample_n(i) %>% summarize(sample.mean = mean(nucleotides)) -> x
full <- rbind(full, x)
}
full}
s20 <- samp(20)
s50 <- samp(50)
s100 <- samp(100)
s1000 <- samp(1000)
ggplot(s20, aes(x = sample.mean)) +geom_histogram(fill="white",color="black")
ggplot(s20, aes(x = sample.mean)) +geom_histogram(fill="white",color="black") + xlab("Sample means") + ggtitle("20 samples of N=50")
genes %>% sample_n(25) %>% 
   ggplot(aes(x = nucleotides)) + geom_historgram()
shit <- genes %>% sample_n(25) %>% 
   ggplot(aes(x = nucleotides)) + geom_histogram()
shit
shit <- genes %>% sample_n(25) %>% 
   ggplot(aes(x = nucleotides)) + geom_histogram(fill="white", color="black")
shit
shit + geom_vline(xintercept=2761.039
)
shit + geom_vline(xintercept=2761.039, color="red") + 
ggsave("tinysample.pdf
ggsave("tinysample.pdf", shit2)
shit <- genes %>% sample_n(25) %>% ggplot(aes(x=nucleotides)) + geom_vline(xintercept=2761.039, color="red") + geom_vline(xintercept=mean(.$nucleotides, color="blue"(
shit <- genes %>% sample_n(25) %>% ggplot(aes(x=nucleotides)) + geom_histogram(fill="white", color="black")+ geom_vline(xintercept=2761.039, color="red") + geom_vline(xintercept=mean(.$nucleotides, color="blue")
shit <- genes %>% sample_n(25) %>% ggplot(aes(x=nucleotides)) + geom_histogram(fill="white", color="black")+ geom_vline(xintercept=2761.039, color="red") + geom_vline(xintercept=mean(.$nucleotides), color="blue")
shit <- genes %>% sample_n(25)
mean(shit$nucleotides)
ggplot(shit, aes(x=nucleotides)) + geom_histogram(fill="white", color="black")+ geom_vline(xintercept=2761.039, color="red") + geom_vline(xintercept=mean(shit$nucleotides), color="blue")
ggplot(shit, aes(x=nucleotides)) + geom_histogram(fill="white", color="black")+ geom_vline(xintercept=2761.039, color="red", size=2) + geom_vline(xintercept=mean(shit$nucleotides), color="blue", size=2)
ggplot(shit, aes(x=nucleotides)) + geom_histogram(fill="white", color="black")+ geom_vline(xintercept=2761.039, color="red", size=2) + geom_vline(xintercept=mean(shit$nucleotides), color="blue", size=2)-> shitp
ggsave("shithist.pdf", shitp)
small.sample<- shit
mean(small.sample$nucleotides)
?geom_abline
> samp <- function(total, per){
full <- tibble(sample.mean=numeric())
 for (i in 1:total){ 
genes %>% sample_n(per) %>% summarize(sample.mean = mean(nucleotides)) -> x
full <- rbind(full, x)
}
s20 <- samp(20, 25)
s50 <- samp(50, 25)
s100 <- samp(100, 25)
s1000 <- samp(1000, 25)
samp <- function(total, per){
full <- tibble(sample.mean=numeric())
 for (i in 1:total){ 
genes %>% sample_n(per) %>% summarize(sample.mean = mean(nucleotides)) -> x
full <- rbind(full, x)
}
s20 <- samp(20, 25)
s50 <- samp(50, 25)
s100 <- samp(100, 25)
s1000 <- samp(1000, 25)
samp <- function(total, per){
full <- tibble(sample.mean=numeric())
 for (i in 1:total){ 
genes %>% sample_n(per) %>% summarize(sample.mean = mean(nucleotides)) -> x
full <- rbind(full, x)
}}
s20 <- samp(20, 25)
s50 <- samp(50, 25)
s100 <- samp(100, 25)
s1000 <- samp(1000, 25)
ehad(s20)
head(s20)
s20
s50
per=25
total=20
    full <- tibble(sample.mean=numeric())
    for (i in 1:total){ 
        genes %>% sample_n(per) %>% summarize(sample.mean = mean(nucleotides)) -> x
        full <- rbind(full, x)
    }
full
samp <- function(total, per){
    full <- tibble(sample.mean=numeric())
    for (i in 1:total){ 
        genes %>% sample_n(per) %>% summarize(sample.mean = mean(nucleotides)) -> x
        full <- rbind(full, x)
    }
    full
}
s20 <- samp(20, 25)
s50 <- samp(50, 25)
s100 <- samp(100, 25)
s1000 <- samp(1000, 25)
s20
head(s20)
ggplot(n20.means, aes(x = sample.mean)) + geom_histogram()
ggplot(s20, aes(x = sample.mean)) + geom_histogram()
ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> n5mea0
n20
mean(s20$sample.mean)
mean(s50$sample.mean)
mean(s100$sample.mean)
mean(s1000$sample.mean)
s20 <- samp(20, 25)
s50 <- samp(50, 25)
s100 <- samp(100, 25)
s1000 <- samp(1000, 25)
s10000 <- samp(10000, 25)
ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p1
ggsave("s20.pdf", p1)
ggplot(s50, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=..count../sum(..count..), color="blue") + geom_vline(xintercept= 2761.039, color="red")
ggplot(s50, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(aes(xintercept=..count../sum(..count..)), color="blue") + geom_vline(xintercept= 2761.039, color="red")
ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=2151.8, color="blue") + geom_vline(xintercept= 2761.039, color="red") -> n20
n20
ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=2151.8, color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5) -> n20
n20
ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=2151.8, color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5) -> n20
ggplot(s50, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s50$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red")-> n50
ggplot(s100, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s100$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n100
ggplot(s1000, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s1000$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n1000
ggplot(s10000, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s10000$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n10000
ggsave("n20.pdf", n20)
ggsave("n50.pdf", n50)
ggsave("n100.pdf", n100)
ggsave("n1000.pdf", n1000)
ggsave("n10000.pdf", n10000)
ggsave("n20.pdf", n20, width=3)
save_plot("n20.pdf", n20, base_width=3)
save_plot("n20.pdf", n20, width=3)
save_plot("n20.pdf", n20, base_width=3)
save_plot("n20.pdf", n20)
save_plot("n50.pdf", n50)
save_plot("n100.pdf", n100)
save_plot("n1000.pdf", n1000)
save_plot("n10000.pdf", n10000)
sd(s20)
s20
sd(s20$sample.mean)
416.4403 
416.4403 
416.4403 /20
416.4403 /sqrt(20
416.4403 /sqrt(20)
sd(s50$sample.mean)/sqrt(50)
sd(s100$sample.mean)/sqrt(100)
sd(s1000$sample.mean)/sqrt(1000)
sd(s10000$sample.mean)/sqrt(10000)
mean(s20$sample.mean
)
mean(genes$nucleotides)
mean(s50$sample.mean
mean(s50$sample.mean)
mean(s100$sample.mean)
mean(s1000$sample.mean)
mean(s10000$sample.mean)
s50 <- samp(50, 25)
mean(s50$sample.mean)
s100 <- samp(100, 25)
mean(s1000$sample.mean)
mean(s100$sample.mean)
ggplot(s50, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s50$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red")-> n50
ggplot(s100, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s100$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n100
save_plot("n100.pdf", n100)
x <- rbinom(1e4, 10, 0.43)
d <- tibble(x = rbinom(1e4, 10, 0.43))
co <- tibble(x = rgamma(1e4))
co <- tibble(x = rgamma(1e4, shape=0.5))
ggplot(co, aes(x=x))+stat_ecdf()
co <- tibble(x = rgamma(1e4, shape=4))
ggplot(co, aes(x=x))+stat_ecdf()
co <- tibble(x = rgamma(1e4, shape=10))
ggplot(co, aes(x=x))+stat_ecdf()
ggplot(co, aes(x=x))+stat_ecdf()-> ccdf
ggplot(d, aes(x=x))+stat_ecdf()->
ggplot(d, aes(x=x))+stat_ecdf()
ggplot(d, aes(x=x))+stat_ecdf()->dcdf
g <- plot_grid(dcdf, ccdf, nrow=1)
save_plot("dvsc_cdf.pdf", dccdf)
save_plot("dvsc_cdf.pdf", dcdf)
save_plot("dvsc_cdf.pdf", g)
save_plot("dvsc_cdf.pdf", g, base_width=6, base_height=3)
save_plot("dvsc_cdf.pdf", g, base_width=8, base_height=3)
