#S- susceptible, L-Latent, I-Infectious
S <- .1
Population<- 1
L <- .2

I <- .2
#population of treated in numbers 
Treatmentw <- 10
Treatmentm <- 5
TOTALT <-( Treatmentw + Treatmentm)
#recovery rates for both populations
Recoveryw <- .5
Recoverym <-.9
#recruitment rate
R <- .3
#Malnutrition rate
Mal<- .4 
Wellnourished <- 1-Mal
B <- 3
C <- 4
#Death rates
Diw <- .4
Dim <- .7
#M and W are death rates for malnourished and well nourished
M <- 40
W <- 10
IfromLM <- .3
IfromLW <- .6
# prop of  malnourished who are latent

Mlatent <- .2
V <- .7
#natural death rate
ND <- .3
#number of latent malnourished individuals 
LM <- ((Mal*Mlatent*Population))
LW <- L-LM
#Latent and  malnourished out of total population
#below number of infected malnourished are given
#Numbers of infected who are malnourished and not seen below
#Reproduction number is R R<1 means dese
Im <- 40
Iw <- (Im - (I*Population))

ddts <- R - (B*C*S*(I/Population)) - (ND*S)
ddtlw <- (B*C*S*(I/Population))- ((ND+Diw)* L) + (B*C*S*Treatmentw*(I/Population))

ddtlm <- (B*C*S*(I/Population))- ( (ND+Dim)* (L)) +(B*C*S*Treatmentm*(I/Population))
ddtim <- (IfromLM*L*Population)- ((ND+M)*I) - (Recoverym*I)
ddtiw <- (IfromLW*L)- (ND+W)*(I) - (Recoveryw*I)
ddtTm <- (Recoverym*I) - (B*C*Treatmentm*(I/Population)) - (ND*Treatmentm)
ddtTw <- (Recoveryw*I) - (B*C*Treatmentw*(I/Population)) - (ND*Treatmentw)
ddtl <- ddtlm + ddtlw

numberOfYears <- 10 
x <- c (1:10) 



plot  (x, (S + (ddts*x)))

plot  (x, (L + (ddtl*x)))

plot  (x, (LM + (ddtlm*x)))

plot  (x, (LW + (ddtlw*x)))

plot  (x, (Treatmentw + (ddtTw*x)))

plot  (x, (Treatmentm + (ddtTm*x)))

plot  (x, (Im+ (ddtim*x)))

plot  (x, (Iw + (ddtiw*x)))


