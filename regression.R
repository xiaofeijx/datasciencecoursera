#regression
#quiz one

x <- c(0.18, -1.54, 0.42, 0.95)

w <- c(2, 1, 3, 1)

c <- c(0.1471,0.0025,0.30,1.077)

sum(w*x)/sum(w)

#============
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y~x-1)

#===========
data(mtcars)
str(mtcars)
lm(mpg~wt,data=mtcars)

#=====
1.5/0.4
1.5*0.4

#======
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
scale(x,center=T,scale=T)

#======
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y~x)
#========
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)


#<<<<<<< HEAD
#============
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <-lm(y~x)
summary(fit)
summary(fit)$sigma^0.5
sd(summary(fit)$res)

#========
data(mtcars)
str(mtcars)
mtfit <- lm(mpg ~ I(wt+2),data=mtcars)
plot(mtcars$wt,mtcars$mpg)
abline(mtfit)

summary(mtfit)$r.sq

mean(mtcars$wt)

predict(mtfit,data.frame(wt=mean(mtcars$wt)),interval="confidence")
predict(mtfit,data.frame(wt=3),interval="prediction")
mtfit <- lm(mpg ~ I(wt/2),data=mtcars)
summary(mtfit)$coef

#=======
#===========

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y~x)
summary(fit)


data(mtcars)
str(mtcars)
fit <- lm(mpg~factor(cyl)+wt,data=mtcars)
fit2 <- lm(mpg~factor(cyl),data=mtcars)
summary(fit)
summary(fit2)
fit3 <- lm(mpg~factor(cyl)+wt+factor(cyl)*wt,data=mtcars)
summary(fit3)

anova(fit,fit3)

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit4 <- lm(y~x)
summary(fit4)
hatvalues(fit4)
dfbeta(fit4) 

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit5 <- lm(y~x)

dfbetas(fit5) 
#>>>>>>> f12f3692336de653fa1ba7bbf0a1e79e7ec098ca
