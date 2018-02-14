This is a repository of the major methods used in the paper Brookings et al. 2012:
```
Statistics of neuronal identification with open- and closed-loop measures of intrinsic excitability.
Brookings T, Grashow R, Marder E.
Front Neural Circuits. 2012 Apr 27;6:19. doi: 10.3389/fncir.2012.00019. eCollection 2012.
```

NOTES:
- This code is not maintained, and the raw data is not stored in this repository. The principal value is to provide ground truth for anyone seeking to understand, validate, or compare the algorithms used in the original paper.

All code is Copyright (c) 2012 Ted Brookings under the MIT license (see LICENSE.TXT). 

All routines should be reasonably well commented, and information on their use can be obtained via the matlab "help" command. Most of the routines are only for support of the main routines, which I describe here.
1. **Main routines**
     - **FindPropertyCorrleations.m** Find correlations between a matrix of properties xData (numPoints x numXProperties) and a matrix of properties yData (numPoints x numYProperties). Alternatively, if yData is empty, will search for correlations between different x-properties.
     - **KMedoids.m** Find clusters in data using k-medoids algorithm with a L-1 norm and kmeans++ style of initialization.
     - **ClusteringAccuracy.m** Evaluate the accuracy of a clustering by computing mutual information and the proportion of points assigned to the correct group. Also compute p-values testing the null hypothesis that the clustering is the same as random (or another clustering specified by its confusion matrix).
  
2. **Testing routines**
     - **TestCorrelations.m** Generate synthetic data to test (and demonstrate usage of) FindPropertyCorrelations.m
     - **TestKMedoids.m** Generate synthetic data to test KMedoids.m (is basically a shell that calls TestCluster.m)
