## Not run: 
# Import the lidar-derived CHM file 
data(chm) # or set a CHM. e.g. chm<-raster("CHM_stand.asc")

# Set the loc parameter 
sCHM<-CHMsmoothing(chm, filter="mean", ws=5) # smoothing CHM 
loc<-FindTreesCHM(sCHM, fws=5, minht=8) # or import a tree list

# Set the maxcrown parameter 
maxcrown=10.0

# Set the exclusion parameter 
exclusion=0.3 # 30%

# Compute individual tree detection canopy area 
canopy<-ForestCAS(chm, loc, maxcrown, exclusion)

#===========================================================# 
# Retrieving the boundary for individual tree detection and canopy area calculation 
#==============================================================#
boundaryTrees<-canopy[[1]]
# Plotting the individual tree canopy boundary over the CHM
plot(chm, main="lidar-derived CHM")
plot(boundaryTrees, add=T, border="black", lwd=2,bg="transparent") # adding tree canopy boundary


#===========================================================# 
# Retrieving the list of individual trees detected for canopy area calculation 
#==============================================================# 
canopyList<-canopy[[2]] # list of ground-projected areas of individual tree canopies 
summary(canopyList) # summary

# Spatial location of the trees library(sp)
XY<-SpatialPoints(canopyList[,1:2]) # Spatial points
plot(XY, col="red", add=T, pch=16, cex=2) # adding tree location to the plot
## End(Not run)