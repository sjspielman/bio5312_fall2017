###################### normal vs t #####################
lims <- tibble(x = c(-4, 4))
ggplot(lims, aes(x=x)) + 
    stat_function(fun = dnorm, size=2.5) + 
    xlab("Z or t") + ylab("Probability density") + background_grid() -> normal

ggplot(lims, aes(x=x)) + 
    stat_function(fun = dnorm, size=2.5) + 
    xlab("Z or t") + ylab("Probability density") + background_grid()+
    stat_function(fun = dt, args=list(df = 2), color = "red", size=1.5, alpha=0.8) -> normalt1
    

ggplot(lims, aes(x=x)) + 
    stat_function(fun = dnorm, size=2.5) + 
    xlab("Z or t") + ylab("Probability density") + background_grid()+ 
    stat_function(fun = dt, args=list(df = 2), color = "red", size=1.5, alpha=0.8) + 
    stat_function(fun = dt, args=list(df = 5), color = "blue", size=1.5, alpha=0.8) -> normalt2    

ggplot(lims, aes(x=x)) + 
    stat_function(fun = dnorm, size=2.5) + 
    xlab("Z or t") + ylab("Probability density") + background_grid()+ 
    stat_function(fun = dt, args=list(df = 2), color = "red", size=1.5, alpha=0.8) + 
    stat_function(fun = dt, args=list(df = 15), color = "green", size=1.5, alpha=0.8) + 
    stat_function(fun = dt, args=list(df = 5), color = "blue", size=1.5, alpha=0.8) -> normalt3   


ggplot(lims, aes(x=x)) + 
    stat_function(fun = dnorm, size=2.5) + 
    xlab("Z or t") + ylab("Probability density") + background_grid()+ 
    stat_function(fun = dt, args=list(df = 2), color = "red", size=1.5, alpha=0.8) + 
    stat_function(fun = dt, args=list(df = 5), color = "blue", size=1.5, alpha=0.8) +
    stat_function(fun = dt, args=list(df = 15), color = "green", size=1.5, alpha=0.8) + 
    stat_function(fun = dt, args=list(df = 100), color = "magenta", size=1.5, alpha=0.8) -> normaltall 
    

save_plot("onlynormal.pdf", normal)
save_plot("normalt1.pdf", normalt1)
save_plot("normalt2.pdf", normalt2)
save_plot("normalt3.pdf", normalt3)
save_plot("normaltall.pdf", normaltall)



############### one sample example ##############
#x <- rnorm(15, 99.9, 1.01) 
#bad.disease.temp <- tibble(temp = x)
badhist <- ggplot(bad.disease.temp, aes(x=temp))+geom_histogram(fill="white", color="black") + xlab("Bad disease temperature for n=15")
save_plot("bodytemp_hist.pdf", badhist)

pdf("qqnorm_badDiseaseTemp.pdf", width=4, height=4)
qqnorm(bad.disease.temp$temp, pch=20)
qqline(bad.disease.temp$temp, lwd=2, col="red")
dev.off()

ggplot(lims, aes(x=x))+stat_function(fun = dt, args=list(14)) + geom_segment(x = 2.66, xend=2.66, y=0, yend=dt(2.66, 14)) -> dt14
save_plot("dt_df14.pdf", dt14)




