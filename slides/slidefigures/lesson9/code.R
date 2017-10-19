d1 <- tibble(a = rnorm(1e4, 1), b = rnorm(1e4, 3), c = rnorm(1e4, 3.75))
d <- tibble(li = c(2,11))


ggplot(d, aes(x = li)) + 
    stat_function(fun = dnorm, args=list("mean" = 5), color="red", size=1.5, alpha=0.8) + 
    stat_function(fun = dnorm, args=list("mean" = 7), color="blue", size=1.5, alpha=0.8) + 
    stat_function(fun = dnorm, args=list("mean" = 7.75), color="limegreen", size=1.5, alpha=0.8) + 
    geom_segment(x = 5, xend = 5, y = 0, yend = 0.4, color = "red", size=1.1, alpha=0.6) +    
    geom_segment(x = 7, xend = 7, y = 0, yend = 0.4, color = "blue", size=1.1, alpha=0.6) +  
    geom_segment(x = 7.75, xend = 7.75, y = 0, yend = 0.4, color = "limegreen", size=1.1, alpha=0.6) + 
    coord_cartesian(ylim=c(0.01, .42), expand=F) ->anova.dist 
save_plot("anova_within_between.pdf", anova.dist)