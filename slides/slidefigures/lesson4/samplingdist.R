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
s10000 <- samp(10000, 25)

ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") -> p1

ggplot(s20, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=2151.8, color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5) -> n20

ggplot(s50, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s50$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red")-> n50

ggplot(s100, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s100$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n100

ggplot(s1000, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s1000$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n1000
ggplot(s10000, aes(x = sample.mean)) + geom_histogram(fill="white", color="black") + geom_vline(xintercept=mean(s10000$sample.mean), color="blue", size=1.5) + geom_vline(xintercept= 2761.039, color="red", size=1.5)-> n10000

save_plot("n20.pdf", n20)
save_plot("n50.pdf", n50)
save_plot("n100.pdf", n100)
save_plot("n1000.pdf", n1000)
save_plot("n10000.pdf", n10000)