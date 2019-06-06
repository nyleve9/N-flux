# N-flux
QB4

Figure 1: Schematic representation of N fluxes and storage pools in a grassland system.




A mathematical model of N fluxes and storage pools:

Ut+1  =  Ut + sPt + eHt – bUt                                    
At+1  =  At + d + bUt – uPt                                    
Pt+1  =  Pt + uPt – cHt – sPt – fPt               
Ht+1  =  Ht + cHt – eHt                                        




Variables and parameters used in the model:

U
Unavailable N (kg N/Ha)

A
Available N (kg N/Ha)

P
Plant N (kg N/Ha)

H
Herbivore N (kg N/Ha)




d
atmospheric deposition of N            
10/365  
b
breakdown of organic matter
1/30  
u
uptake of N by plants
0.002*At   
c
consumption of plants
0.0028*Pt    
s
plant senescence
1/90  
e
excretion by herbivores
0.05  
f
loss of plant N by fire
0.3  



1.  Six assumptions you need to make for this model:
	a) There are no catastrophes.
	b) There are no new individuals entering into the system and no individuals leaving (and no death).  
	c) There is no variability in uptake of herbivores and plants; there is a simple linear response of herbivores to plant N and a similar simple linear response of plants to available N in the soil, and there is also only one type of herbivore (no difference between below-ground herbivory and above-ground herbivory) and one type of plant.  
	d) Parameters stay the same for each simulation; there is no evolution of plants, herbivores, or microbes that would cause change in N cycling over time.
	e) Transitions between variables only happen in one direction.
	f) Time happens on a relatively coarse, discrete scale (i.e. days), so processes that in reality are gradual and continuous (e.g. microbial breakdown) instead deposit N as a lump sum each day in this model.  
  
2.  How does N cycling compare with and without herbivores (in a closed system, without fires or atmospheric deposition)?

When the effects of fire and atmospheric deposition are removed from the model, the total N in the system remains constant at its initial amount of 80 kg/Ha.  Also, the system eventually reaches a steady state, where the amount of N in each pool becomes constant.  In the presence of herbivores, plants end up holding slightly less than 20 kg N/Ha.  In contrast, when herbivores are present in the system, plants end up reaching a steady state of approximately 55 kg N/Ha, which is the highest proportion of nitrogen out of all four pools.  With neither fires nor herbivores to maintain the N in the plants at a lower level, plants are the biggest storage pool of N.  

3.  What was the biological rationale for your particular implementation of fires?  

I chose to enact fire on the system by rendering it effective only when the nitrogen in plant biomass reached a certain threshold.  I imagined that the buildup of plant biomass would eventually be sufficient to trigger the spread of wildfire.
     How do fires affect N cycling with or without herbivores?
The following two plots show the distribution of N in the grassland system, without the presence of herbivores.  The plot on the left has fire happening relatively often, as the fire threshold was set at 10 kg N/Ha of plant biomass, while the plot on the right has a fire threshold of 30 kg/Ha.  Again, without herbivores, plants store the biggest pool of N.  When fires happen more often, the system has more available N than unavailable N.  When there is less fire, there is more unavailable N than available N.
 
In contrast, the following three plots show the distribution of N in the grassland system, but adding herbivores back into the system.  Fire thresholds in these plots are set at 10, 20, and 30 kg/Ha, respectively.  Again, when fire happens often, there is more available N than unavailable N in the system, and plants ultimately end up storing the largest pool of N in the system.  The herbivores, having not enough plant material to sustain their population, decline to "extinction".  When the fire threshold is set to 20 kg N/Ha plant biomass or greater, however, the plants are then maintained at an intermediate N level and the herbivores do not perish.  


4.  What is the effect of atmospheric deposition (in presence of fires and both with and without herbivores)?
The two plots below show that with both atmospheric deposition and fire, all variables except for plants end up reaching a constant state of steady increase in N.  Plants level off at a constant amount, with no increase.
 
In contrast, as shown in the two plots below, when herbivores are removed from the system, none of the variables reach a steady state; they continue to oscillate through time.  When fire happens often, there is more available N than unavailable N, while when the fire threshold is raised, there is more unavailable N than available N.  When herbivores are removed, plants hold the largest pool of N in the system.

