right <- c(rnorm(100, 5, 2), runif(25, 11, 30))
left <- c(rnorm(100, 5, 2), runif(25, -20, -1))
tails <- c(rnorm(100, 5, 2), runif(25, 11, 30), runif(25, -20, -1))


pdf("skew_qqnorm.pdf", width=7, height=4)
par(mfrow=c(2,3))

hist(right, breaks=20, xlab="", ylab="count", main = "right skew")
hist(left, breaks=20, xlab="", ylab="count", main = "left skew")
hist(tails, breaks=20,xlab="", ylab="count", main = "long tails")

qqnorm(right, pch=20)
qqline(right, col="red")

qqnorm(left, pch=20)
qqline(left, col="red")

qqnorm(tails, pch=20)
qqline(tails, col="red")

dev.off()