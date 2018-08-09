# Importing LAS file: 

LASfile <- system.file("extdata", "LASexample1.las", package="rLiDAR") 

# Reading LAS file 

LAS<-readLAS(LASfile,short=TRUE)

# Height subsetting the data 

xyz<-subset(LAS[,1:3],LAS[,3] >= 1.37)

# Getting lidar clusters 

set.seed(1) 
clLAS<-kmeans(xyz, 60)

# Set the points id 

id<-as.factor(clLAS$cluster)

# Set the xyid input 

xyid<-cbind(xyz[,1:2],id)

# Compute the lidar convex hull of the clusters 

chullTrees<-chullLiDAR2D(xyid)

# Plotting the lidar convex hull 

library(sp) 
plot(SpatialPoints(xyid[,1:2]),cex=0.5,col=xyid[,3], axes=T) 
plot(chullTrees$chullPolygon, add=TRUE, border="green")

# Get the ground-projected area of lidar convex hull 

chullList<-chullTrees$chullArea 
summary(chullList) # summary