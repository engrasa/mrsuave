# Importing the lidar-derived CHM raster file 
data(chm) # or set a CHM. e.g. chm<-raster("CHM_stand.asc") 

# Smoothing CHM 

schm<-CHMsmoothing(chm, "mean", 5)

# Setting the fws:
fws<-5 # dimention 5x5

# Setting the specified height above ground for detectionbreak 
minht<-8.0 

# Getting the individual tree detection list 
treeList<-FindTreesCHM(schm, fws, minht) 
summary(treeList)

# Plotting the individual tree location on the CHM library(raster)
plot(chm, main="lidar-derived CHM")
library(sp)
XY<-SpatialPoints(treeList[,1:2]) # Spatial points
plot(XY, add=TRUE, col="black", pch=16,cex=2) # plotthing tree location

