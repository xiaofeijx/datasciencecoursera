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
fit1<- lm(mpg~wt,data=mtcars)
summary(fit1)
fit2<- lm(mpg~wt-1,data=mtcars)
summary(fit2)

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

# quiz 3
data(mtcars)
str(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
fit <- lm(mpg~factor(cyl)+wt,data=mtcars)
fit2 <- lm(mpg~factor(cyl),data=mtcars)
summary(fit)
summary(fit2)

fit3 <- lm(mpg~factor(cyl)*wt,data=mtcars)
summary(fit3)

anova(fit,fit3)
newdata <- data.frame(wt=c(0,1),cyl= factor(c(4,4)))
fit <- lm(mpg~cyl+wt,data=mtcars)
fit5 <- lm(mpg ~ I(wt * 0.5) + cyl, data = mtcars)

predict(fit,newdata)
predict(fit5,newdata)

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
plot(x,y)
fit4 <- lm(y~x)
summary(fit4)
hatvalues(fit4)
dfbetas(fit4) 

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit5 <- lm(y~x)

dfbetas(fit5) 
#>>>>>>> f12f3692336de653fa1ba7bbf0a1e79e7ec098ca

#lecture
library(datasets)
?swiss
n <- 100
x2 <-1:n
x1 <- 0.01*x2 + runif(n,-0.1,0.1)
y=-x1+x2+rnorm(n,sd=0.01)
summary(lm(y~x1))$coef

summary(lm(y~x1+x2))$coef

library(datasets); data(swiss); require(stats); require(graphics)
pairs(swiss, panel = panel.smooth, main = "Swiss data", col = 3 + (swiss$Catholic > 50))

#R in action

data(women)
women
plot(women$height,women$weight)
fit <- lm(weight~height,data=women)
summary(fit)
abline(fit)

fit2 <- lm(weight~height+I(height^2),data=women)
summary(fit2)
library(car)
scatterplot(weight~height,data=women,
            spread=FALSE,pch=19)

# multiple linear regression
states <- as.data.frame(state.x77[,c("Murder", "Population", 
                                     "Illiteracy", "Income", "Frost")])
cor(states)
library(car)
scatterplotMatrix(states, spread=FALSE,  main="Scatterplot Matrix")
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
summary(fit)
confint(fit)

# effects plot
fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)
library(effects)
plot(effect("hp:wt", fit, xlevels=list(wt=c(2.2, 3.2, 4.2))), multiline=TRUE)

# simple regression diagnostics
fit <- lm(weight ~ height, data=women)
par(mfrow=c(2,2))
plot(fit)
newfit <- lm(weight ~ height + I(height^2), data=women)
par(opar)
par(mfrow=c(2,2))
plot(newfit)
par(opar)

# basic regression diagnostics for states data
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
par(mfrow=c(2,2))
plot(fit)
par(opar)


# Assessing normality
library(car)
par(mfrow=c(1,1))
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
qqPlot(fit, labels=FALSE, simulate=TRUE, main="Q-Q Plot")


# residplot function
residplot <- function(fit, nbreaks=10) {
  x <- rstudent(fit)
  h<-hist(x, breaks=nbreaks, freq=FALSE, 
          xlab="Studentized Residual", 
          main="Distribution of Errors") 
  xfit<-seq(min(x),max(x),length=40) 
  lines(xfit, dnorm(xfit),col="blue", lwd=2)
  lines(density(x)$x, density(x)$y, col="red", lwd=2, lty=2)
  legend("topright", legend = c( "Normal Curve", "Density Curve"), 
         lty=1:2, col=c("blue","red"), cex=.7)
}

residplot(fit)

#  Durbin Watson test for Autocorrelated Errors
durbinWatsonTest(fit)

# Component + Residual Plots
crPlots(fit)

# Assessing homoscedasticity
ncvTest(fit)
spreadLevelPlot(fit)

# Global test of linear model assumptions
library(gvlma)
gvmodel <- gvlma(fit) 
summary(gvmodel)

# Evaluating multi-collinearity
vif(fit) 
sqrt(vif(fit)) > 2 # problem?

# Assessing outliers
outlierTest(fit)

#  Index plot of hat values
p <- length(coefficients(fit))
n <- length(fitted(fit))
plot(hatvalues(fit), main="Index Plot of Hat Values")
abline(h=c(2,3)*p/n, col="red", lty=2)
identify(1:n, hatvalues(fit), row.names(states))

# Cook's D Plot
# identify D values > 4/(n-k-1) 
cutoff <- 4/(nrow(states)-length(fit$coefficients)-2)
plot(fit, which=4, cook.levels=cutoff)
abline(h=cutoff, lty=2, col="red")

# Added variable plots
# add id.method="identify" to interactively identify points
avPlots(fit, ask=FALSE, onepage=TRUE)

# Influence Plot
influencePlot(fit, id.method="identify", main="Influence Plot", 
              sub="Circle size is proportial to Cook's Distance" )

# Box-Cox Transformation to Normality
summary(powerTransform(states$Murder))

# Box-Tidwell Transformations to Linearity
boxTidwell(Murder~Population+Illiteracy,data=states)

# Comparing nested models using the anova function
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=states)
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
anova(fit2, fit1)

# Comparing models with the Akaike Information Criterion
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=states)
fit2 <- lm(Murder ~ Population + Illiteracy, data=states)
AIC(fit1,fit2)

# Backward stepwise selection
library(MASS)
fit1 <- lm(Murder ~ Population + Illiteracy + Income + Frost,
           data=states)
stepAIC(fit, direction="backward")

# All subsets regression
library(leaps)
leaps <-regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=states, nbest=4)
plot(leaps, scale="adjr2", 
     main="Best model subsets based on Adjusted R2")

library(car)
subsets(leaps, statistic="cp", legend=TRUE, # legend is placed interactively
        main="Cp Plot for All Subsets Regression") 
abline(1,1,lty=2,col="red")

# Function for k-fold cross-validated R-square
shrinkage <- function(fit,k=10){
  require(bootstrap)
  # define functions 
  theta.fit <- function(x,y){lsfit(x,y)}
  theta.predict <- function(fit,x){cbind(1,x)%*%fit$coef} 
  
  # matrix of predictors
  x <- fit$model[,2:ncol(fit$model)]
  # vector of predicted values
  y <- fit$model[,1]
  
  results <- crossval(x,y,theta.fit,theta.predict,ngroup=k)
  r2 <- cor(y, fit$fitted.values)**2 # raw R2 
  r2cv <- cor(y,results$cv.fit)**2 # cross-validated R2
  cat("Original R-square =", r2, "\n")
  cat(k, "Fold Cross-Validated R-square =", r2cv, "\n")
  cat("Change =", r2-r2cv, "\n")
}

# using it
fit <- lm(Murder ~ Population + Income + Illiteracy + Frost, data=states)
shrinkage(fit)
fit2 <- lm(Murder~Population+Illiteracy,data=states)
shrinkage(fit2)

#  Calculating standardized regression coefficients
zstates <- as.data.frame(scale(states))
zfit <- lm(Murder~Population + Income + Illiteracy + Frost, data=zstates)
coef(zfit)

########################################################################
# The relweights function determines the relative importance of each   # 
# independent variable to the dependent variable in an OLS regression. # 
# The code is adapted from an SPSS program generously provided by      # 
# Dr. Johnson.                                                         #
#                                                                      #
# See Johnson (2000, Multivariate Behavioral Research, 35, 1-19) for   #
# an explanation of how the relative weights are derived.              #                                           
######################################################################## 
relweights <- function(fit,...){                              
  R <- cor(fit$model)      # correlation matrix with criterion in 1st column
  nvar <- ncol(R)          # number of variables
  rxx <- R[2:nvar, 2:nvar] # correlations among predictors
  rxy <- R[2:nvar, 1]      # correlations between predictors and criterion
  svd <- eigen(rxx)        # singular value decomposition
  evec <- svd$vectors      # eigenvectors                     
  ev <- svd$values         # eigenvalues
  delta <- diag(sqrt(ev))  # diag matrix with sqrts of eigenvalues
  
  # correlations between original predictors and new orthogonal variables
  lambda <- evec %*% delta %*% t(evec)        
  lambdasq <- lambda ^ 2   # square of the correlations
  
  # regression coefficients of Y on orthogonal variables
  beta <- solve(lambda) %*% rxy           
  rsquare <- colSums(beta ^ 2)       # calculate R-square            
  rawwgt <- lambdasq %*% beta ^ 2    # raw relative weights
  import <- (rawwgt / rsquare) * 100 # rescale to % of R-square
  lbls <- names(fit$model[2:nvar])   # predictor labels
  rownames(import) <- lbls
  colnames(import) <- "Weights"
  
  # plot results
  barplot(t(import),names.arg=lbls,
          ylab="% of R-Square",
          xlab="Predictor Variables",
          main="Relative Importance of Predictor Variables", 
          sub=paste("R-Square = ", round(rsquare, digits=3)),
          ...)  
  return(import)
}

# using it
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
relweights(fit, col="lightgrey")


#chapter 13

# R in Action (2nd ed): Chapter 13
# Generalized linear models
# requires packages AER, robust, gcc
# install.packages(c("AER", "robust", "gcc"))
#---------------------------------------------


## Logistic Regression

# get summary statistics
data(Affairs, package="AER")
summary(Affairs)
table(Affairs$affairs)

# create binary outcome variable
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair, 
                          levels=c(0,1),
                          labels=c("No","Yes"))
table(Affairs$ynaffair)

# fit full model
fit.full <- glm(ynaffair ~ gender + age + yearsmarried + children + 
                religiousness + education + occupation +rating,
                data=Affairs,family=binomial())
summary(fit.full)

# fit reduced model
fit.reduced <- glm(ynaffair ~ age + yearsmarried + religiousness + 
                   rating, data=Affairs, family=binomial())
summary(fit.reduced)

# compare models
anova(fit.reduced, fit.full, test="Chisq")

# interpret coefficients
coef(fit.reduced)
exp(coef(fit.reduced))

# calculate probability of extramariatal affair by marital ratings
testdata <- data.frame(rating = c(1, 2, 3, 4, 5),
                       age = mean(Affairs$age),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata=testdata, type="response")
testdata

# calculate probabilites of extramariatal affair by age
testdata <- data.frame(rating = mean(Affairs$rating),
                      age = seq(17, 57, 10), 
                      yearsmarried = mean(Affairs$yearsmarried),
                      religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata=testdata, type="response")
testdata

# evaluate overdispersion
fit <- glm(ynaffair ~ age + yearsmarried + religiousness +
           rating, family = binomial(), data = Affairs)
fit.od <- glm(ynaffair ~ age + yearsmarried + religiousness +
              rating, family = quasibinomial(), data = Affairs)
pchisq(summary(fit.od)$dispersion * fit$df.residual,  
               fit$df.residual, lower = F)


## Poisson Regression

# look at dataset
data(breslow.dat, package="robust")
names(breslow.dat)
summary(breslow.dat[c(6, 7, 8, 10)])

# plot distribution of post-treatment seizure counts
opar <- par(no.readonly=TRUE)
par(mfrow=c(1, 2))
attach(breslow.dat)
hist(sumY, breaks=20, xlab="Seizure Count", 
     main="Distribution of Seizures")
boxplot(sumY ~ Trt, xlab="Treatment", main="Group Comparisons")
par(opar)

# fit regression
fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, family=poisson())
summary(fit)

# interpret model parameters
coef(fit)
exp(coef(fit))

# evaluate overdispersion
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type="poisson")

# fit model with quasipoisson
fit.od <- glm(sumY ~ Base + Age + Trt, data=breslow.dat,
              family=quasipoisson())
summary(fit.od)



p <- 1
n <- 100; x2 <- runif(n); x1 <- p * runif(n) - (1 - p) * x2 
beta0 <- 0; beta1 <- 1; tau <- 4 ; sigma <- .01
y <- beta0 + x1 * beta1 + tau * x2 + rnorm(n, sd = sigma)
plot(x1, y, type = "n", frame = FALSE)
abline(lm(y ~ x1), lwd = 2)
co.pal <- heat.colors(n)
points(x1, y, pch = 21, col = "black", bg = co.pal[round((n - 1) * x2 + 1)], cex = 2)


library(rgl)
plot3d(x1, x2, y)

plot(resid(lm(x1 ~ x2)), resid(lm(y ~ x2)), frame = FALSE, col = "black", bg = "lightblue", pch = 21, cex = 2)
abline(lm(I(resid(lm(x1 ~ x2))) ~ I(resid(lm(y ~ x2)))), lwd = 2)


# simulate data
n <- 100; t <- rep(c(0, 1), c(n/2, n/2)); x <- c(runif(n/2), 1.5 + runif(n/2));
# define parameters/coefficients
beta0 <- 0; beta1 <- 2; beta2 <- 0; sigma <- .2
# generate outcome using linear model
y <- beta0 + x * beta1 + t * beta2 + rnorm(n, sd = sigma)
# set up axes
plot(x, y, type = "n", frame = FALSE)
# plot linear fit of y vs x
abline(lm(y ~ x), lwd = 2, col = "blue")
# plot means of the two groups (t = 0 vs t = 1)
abline(h = mean(y[1 : (n/2)]), lwd = 3, col = "red")
abline(h = mean(y[(n/2 + 1) : n]), lwd = 3, col = "red")
# plot linear fit of y vs x and t
fit <- lm(y ~ x + t)
# plot the two lines corresponding to (t = 0 vs t = 1)
abline(coef(fit)[1], coef(fit)[2], lwd = 3)
abline(coef(fit)[1] + coef(fit)[3], coef(fit)[2], lwd = 3)
# add in the actual data points
points(x[1 : (n/2)], y[1 : (n/2)], pch = 21, col = "black", bg = "lightblue", cex = 1)
points(x[(n/2 + 1) : n], y[(n/2 + 1) : n], pch = 21, col = "black", bg = "salmon", cex = 1)
summary(fit)
rbind("Treatment Effect" = lm(y~t+x)$coef[2], "Adjustment Effect" = lm(y~t)$coef[2])



# simulate data
p <- 1; n <- 100; x2 <- runif(n); x1 <- p * runif(n) - (1 - p) * x2

plot(x2,x1)
# define parameters/coefficients
beta0 <- 0; beta1 <- 1; beta2 <- 4 ; sigma <- .01
# generate outcome using linear model
y <- beta0 + x1 * beta1 + beta2 * x2 + rnorm(n, sd = sigma)

summary(lm(y~x1+x2))
# plot y vs x1 and x2
qplot(x1, y) + geom_point(aes(colour=x2)) + geom_smooth(method = lm)

plot(resid(lm(x1 ~ x2)), resid(lm(y ~ x2)), frame = FALSE,
col = "black", bg = "lightblue", pch = 21, cex = 1)
# add linear fit line
fit4 <- lm(I(resid(lm(y ~ x2))) ~ I(resid(lm(x1 ~ x2))))
summary(fit4)



#quiz 4
library(MASS)
data(shuttle)
str(shuttle)
head(shuttle)
shuttle$use
shuttle$wind <- factor(shuttle$wind,levels=c("tail","head"))
shuttle$use <- factor(shuttle$use,levels=c("noauto","auto"))
fit <- glm(use~wind,data=shuttle,family=binomial(link="logit"))
summary(fit)

fit2 <- glm(use~wind+magn,data=shuttle,family=binomial(link="logit"))
summary(fit2)

shuttle$use <- factor(shuttle$use,levels=c("auto","noauto"))
fit3 <- glm(use~wind+magn,data=shuttle,family=binomial(link="logit"))
summary(fit3)


data(InsectSprays)
str(InsectSprays)
summary(InsectSprays)
fit4 <- glm(I(count+1)~spray,data=InsectSprays,family=poisson(link="logit"))
fit4 <- glm(count~spray-1,data=InsectSprays,family=poisson(link="log"))
summary(fit4)

with(InsectSprays,plot(spray,count))
exp(2.67415-2.73003)


data(breslow.dat,package="robust")
fit5 <- glm(sumY~Base+Age+Trt+offset(Base4),data=breslow.dat,family=poisson)
summary(fit5)
str(breslow.dat)
fit5 <- glm(sumY~Base+Age+Trt+offset(I(log(10)+Base4)),data=breslow.dat,family=poisson)
summary(fit5)


x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(x,y)
knots <- 0
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
xMat <- cbind(x, splineTerms)
fit <- lm(y~xMat) 
summary(fit)


# simulate data
n <- 500; x <- seq(0, 4 * pi, length = n); y <- sin(x) + rnorm(n, sd = .3)
# define 20 knot points
knots <- seq(0, 8 * pi, length = 20);
range(x)
# define the ()+ function to only take the values that are positive after the knot pt
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
# define the predictors as X and spline term
xMat <- cbind(x, splineTerms)
head(xMat)
# fit linear models for y vs predictors
yhat <- predict(lm(y ~ xMat))
# plot data points (x, y)
plot(x, y, frame = FALSE, pch = 21, bg = "lightblue")
# plot fitted values
lines(x, yhat, col = "red", lwd = 2)
=======

n <- 100; nosim <- 1000
# generate 3 random noise, unrelated variables
x1 <- rnorm(n); x2 <- rnorm(n); x3 <- rnorm(n);
# calculate beta1s of three different regression
betas <- sapply(1 : nosim, function(i){
  # generate outcome as only related to x1
  y <- x1 + rnorm(n, sd = .3)
  # store beta1 of linear regression on y vs x1
  c(coef(lm(y ~ x1))[2],
    # store beta1 of linear regression on y vs x1 and x2
    coef(lm(y ~ x1 + x2))[2],
    # store beta1 of linear regression on y vs x1 x2 and x3
    coef(lm(y ~ x1 + x2 + x3))[2])
})
dim(betas)
# calculate the standard error of the beta1s for the three regressions
beta1.se <- round(apply(betas, 1, sd), 5)
# print results
rbind("y ~ x1" = c("beta1SE" = beta1.se[1]),
      "y ~ x1 + x2" = beta1.se[2],
      "y ~ x1 + x2 + x3" = beta1.se[3])



#===logistic regrssion=====
library(foreign)
evans <- read.csv("evans.csv",header=TRUE)
str(evans)
nrow(evans)
fit <- glm(chd~cat+age+chl+ecg+smk+hpt,data=evans,family=binomial(link="logit"))
summary(fit)$deviance
names(summary(fit))
exp(cbind(coef(fit),confint(fit)))
reducedmodel <-glm(chd~age+chl+ecg+smk+hpt,data=evans,family=binomial(link="logit"))
anova(fit,reducedmodel)

fit2 <- glm(chd~age+cat*chl+ecg+smk+cat*hpt,data=evans,family=binomial(link="logit"))
summary(fit2)$deviance
summary(fit2)
anova(fit,fit2)


exp(coef(fit2)[3]+coef(fit2)[8]*rep(c(200,220,240),times=2)+coef(fit2)[9]*rep(c(0,1),each=3))

vcov(fit2)

