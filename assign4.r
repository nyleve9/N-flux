#The following is a model of the nitrogen cycle. Given starting quantities of N in the ecosystem,
#this model determines how much N is eventually distributed to each storage pool after a chosen number of days.

#Initialize total N in the ecosystem 
#(distribute 80 kg/Ha N evenly into unavailable, available, plant, and herbivore N):

init.U <- 20
init.A <- 20
init.P <- 20
init.H <- 20

#Define number of days for which to run the cycle

days <- 1000    

#Initialize vectors for variables, storing initial N amount in first element of each vector:

U <- c(init.U,rep(NA,(days-1)))  #unavailable N
A <- c(init.A,rep(NA,(days-1)))  #available N  
P <- c(init.P,rep(NA,(days-1)))  #N in plants    
H <- c(init.H,rep(NA,(days-1)))  #N in herbivores

#Define parameters for N cycle:

u <- 0.002         #uptake of available N by plants
d <- 10/365        #deposit of available N from the atmosphere
e <- 0.05          #excretion of unavailable N by herbivores
s <- 1/90          #senescence of plants (to unavailable N)
b <- 1/30          #breakdown of unavailable N by microbes
c <- 0.0028        #consumption of plants by herbivores
f <- 0.3           #deposit of available N by fire (30% lost to atmosphere as unavailable N)

#Define threshold for fire
fire.thresh <- 20  #once plant N (i.e. biomass) increases to given threshold, enact burn

#Run the model:

for (t in 1:(days-1)) {                  #run cycle for specified # of days
    if ( P[t] > fire.thresh ) {          #create a switch for fire, so that when plants reach a certain biomass
        fire.switch <- 1                 #threshold, switch = "on" and plants will lose N by fire accordingly.
    } else { fire.switch <- 0 }          #Otherwise, switch = "off" and fire will have no effect in the model.
    U[t+1] <- U[t] + s*P[t] + e*H[t] - b*U[t]                                    #Unavailable N 
    A[t+1] <- A[t] + d + b*U[t] - u*A[t]*P[t]                                    #Available N
    P[t+1] <- P[t] + u*A[t]*P[t] - c*P[t]*H[t] - s*P[t] - P[t]*f*fire.switch     #Plant N
    H[t+1] <- H[t] + c*P[t]*H[t] - e*H[t]                                        #Herbivore N
}

#Plot the results:

#Plot all variables on the same plot

windows()
par(mfrow=c(1,1))
plot((1:days),U,col="black",lwd="2",xlab="Days",ylab="Nitrogen (kg/Ha)",type="l",yl=c(0,60),main="Distribution of N")
lines((1:days),A,lwd="2",col="blue")
lines((1:days),P,lwd="2",col="green")
lines((1:days),H,lwd="2",col="red")
legend("topright",cex=0.5,legend = c("Unavailable N","Available N","Plant N","Herbivore N"),text.col=c("black","blue","green","red"))

#Plot each variable on a separate plot

par(mfrow=c(2,2))
plot((1:days),U,col="black",xlab="Days",ylab="Nitrogen (kg/Ha)",type="l",lwd="2",ylim=c(0,90),main="Unavailable N")
plot((1:days),A,col="blue",xlab="Days",ylab="Nitrogen (kg/Ha)",type="l",lwd="2",ylim=c(0,90),main="Available N")
plot((1:days),P,col="green",xlab="Days",ylab="Nitrogen (kg/Ha)",type="l",lwd="2",ylim=c(0,90),main="Plant N")
plot((1:days),H,col="red",xlab="Days",ylab="Nitrogen (kg/Ha)",type="l",lwd="2",ylim=c(0,90),main="Herbivore N")


#Check that total N mass in closed system is the same at each time step:

#Create a vector to store the total N mass in the system at each cycle
leak <- rep(NA,(days))

#Store the total sum of N from the 4 variables
for ( t in (1:days) ) {
    leak[t] <- (U[t] + A[t] + P[t] + H[t])
}

#Check to see if total N is the same for all of the days.  The following numbers should be equal:
print("If the following numbers are not equal, then check for leaks!",quote="FALSE")
sum(leak)
(init.U + init.A + init.P + init.H) * days
