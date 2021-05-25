# SeniorProject - TOBB University of Economics and Technology
# İrem Sönmez

## TOBB UNIVERSITY OF ECONOMICS AND TECHNOLOGY FACULTY OF ENGINEERING DEPARTMENT OF BIOMEDICAL ENGINEERING
## BME 498 DESIGN PROJECT
 
## Classification of Attention Deficit Hyperactivity Disorder (ADHD) and Control Children with using EEG signals

#### ABSTRACT

Attention Deficit Hyperactivity Disorder (ADHD) is a neurodevelopmental disorder characterized by inattention, hyperactivity, forgetfulness, and uncontrolled reactions. This study proposes to experts a fast and highly successful algorithm for the diagnosis of ADHD disorder using EEG (Elektroensefalografi) signals obtained during the Attention task, reducing their dependence on subjective evaluations. Accordingly, EEG signals obtained from 60 ADHD and 60 control participants were analyzed using nonlinear features (approximate entropy, Petrosian, and Lyapunov exponent). After preprocessing the EEG signals, it was continued by extracting three features from nonlinear features, approximately entropy, Petrosian, and Lyapunov exponent. After this feature extraction, the classification process was performed using Artificial Neural Network (ANN), Support vector machine (SVM), and K-Nearest-Neighbor (KNN). As a result of the classification of our study, we achieved a success rate of 86.11%. To improve the sorting results, the signal obtained after the smoothing preprocessing step was compared with the signal without the smoothing preprocessing step. We improved the result by achieving 91.67% success with the data signal without the smoothing pre-processing stage. When we use nonlinear features and data related to frontal and prefrontal regions of the brain that are related to ADHD in order to obtain a faster decision support mechanism, the success rate we get is 91.67%. As a result of this study, using non-linear attributes, children with ADHD were identified and distinguished from healthy children. High success was achieved by using only 3 nonlinear features in this study. This study is more advantageous than other studies in the literature in terms of achieving higher success with less feature extraction.

#### Aim of The Study

The aim of this study is to propose a fast and highly successful decision support algorithm for the diagnosis and diagnosis of ADHD using EEG signals that will reduce their dependence on subjective tests.

#### Data Acquisition

Participants consisted of 60 children diagnosed with ADHD according to DSM-IV (American Psychiatric Association Diagnostic and Statistical Manual) criteria and 60 healthy children control group (9.85 ± 1.77 years). Locations according to the international 10-20 electrode system were determined by the imaginary lines created with 10-20% spacing at certain points in the skull bones. This system is an accepted layout plan due to its symmetrical and repeatability, and it can be arranged according to different electrode numbers. In this study, the signals were taken according to the 10-20 electrode system. EEG recording was used in 19 channels (Fz, Cz, Pz, C3, T3, C4, T4, Fp1, Fp2, F3, F4, F7, F8, P3, P4, T5, T6, O1, O2), shown in the Figure 2.1. Fp1, and Fp2 were added because frontal lobe is related with ADHD. Fp1, Fp2, F3 and F4 are the frontal lobes, shown in red in the Figure 2.1. In order to avoid any problems in the recording, the participants were asked not to move and the recordings were taken in a quiet room. The recording protocol was chosen according to the behavior of children with ADHD. For example, if the attention stimulus is a sound, then there is no difference between ADHD and healthy children, but if the attention stimulus is a picture, then children with ADHD have a big difference. Therefore, in this study, EEG recordings were taken by showing some pictures that might be attractive to children.

#### Data Analysis

##### Preprocessing

Firstly, EEG signals were recorded from 19 electrodes. EEG signals recorded for 90 seconds were used. The 90-second EEG signals were divided into 3 samples. Each sample consists of 30 seconds of recording. 128 Hz sampling frequency is used. The maximum and minimum points of the signal are deleted by using MATLAB®  rmoutliers command with the median. We split the one-and-a-half minute signal into thirty-second epochs in the form of floating windows. Thanks to this process, the signal is free from noise. Then, the signal is softened using the MATLAB® smoothdata command. The signal obtained from the smoothdata process and the non-smoothdata signal were compared. Pre-processing is completed.

##### Feature Extraction

In this study, preprocessed signals were used to extract features. To stabilize the non-stationary signal, we divide the one and a half minute signal into thirty-second periods in the form of floating windows. We will use nonlinear features to characterize the chaotic pattern in EEG signals. 

 ###### Approximate Entropy
 Entropy is one of the methods used to measure Chaos. Used to determine the amount of discipline or randomness in a signal. In this study, the entropy of EEG signals was found by the Approximate method (ApEn). In this formula; m is sub-series length and r is tolerance. m and rf are positive real integers and represent data length and filtering level respectively. Parameter d is the distance between vectors xm (i) and xm (j). The approximate entropy formulation is as follows: N value is the number of samples considered. The data length of one of each sample is thirty seconds. N value equals thirty seconds.


###### Petrosian
Petrosian's fractal dimension creates a new time series by extracting successive instances of a time series. This method is faster and more sensitive to noise. In this method, samples of a time series are extracted consecutively, and after a new time series is generated, positive and negative samples are assigned 1 and -1, respectively. As a result, the number of sign changes in the time series generated equals the number of local extremes in the primary time series. In this formüla; n is the number of samples in dual time series and N∆ is the number of sign changes in dual time series.

###### Largest Lyapunov Exponent (LLE)
After these methods, we will be able to understand the chaotic behavior of this system thanks to the largest Lypunon base (LLE) [20]. If LLE is positive, it will mean that the system has chaotic behavior. A time series LLE is defined by the rate of extension of differences between consecutive samples. In this formula; dn is the distance between consecutive samples in the nth time and d0 is the sequential distance in the first time.


#### CLASSIFICATION
Classification is a type of supervised machine learning in which an algorithm learns to classify new observations from labeled data samples. The purpose of classification is to learn a functional model that allows an appropriate estimation of the class label for an unknown model. In this study, K-Nearest Neighbors (KNN), Support Vector Machine (SVM), and Artificial Neural Network (ANN) methods were used in the classification process.

##### K-Nearest Neighbors (KNN)
The first algorithm used in classification was K-Nearest Neighbors (KNN). The KNN algorithm is a classification algorithm that makes a class prediction based on the information in which class the closest neighbors of the matrix in which there are independent variables of the value to be predicted are more concentrated. It makes predictions on two basic values: distance and neighborhood number (K). Distance is the distance of the point to be estimated from other points. The Euclidean Distance was used for this. Neighborhood number tells you how many nearest neighbors to classify.                  

##### Support Vector Machine (SVM)
Support Vector Machine is one of the supervised learning methods often used in classification problems. Draws a line to separate points placed on a plane. This is aimed at keeping the line at the maximum distance for the points of both classes.
The given N vector {x_(1,) x_2, ..., x_n} has the m property {a_j1,a_j2,…,a_jm } with each vector x_j  and belongs to one of the C1 or C2 classes. In the property space, if it is possible to find a hyperplane that can be distinguished between samples from class C1 and samples from class C2, the data given is linearly separable. Due to the linearly separable data, there will be a so-called margin gap between the instances of the two given classes. It is an advantage that the margin between instances of the two classes is as wide as possible.

##### Artificial Neural Network (ANN)
Another method used in classification is Artificial Neural Network (ANN). Artificial neural networks are an information processing technology inspired by the skills of the human brain, such as learning and creating new information. It emerged as a result of mathematical modeling of learning by taking the human brain as an example. The learning process in artificial neural networks is carried out using examples. During the learning, input and output information is given and rules are made. Artificial neural networks are made up of neurons. The brain is a highly complex, nonlinear, and parallel computer system. Structural components known as neurons are capable of editing certain computations faster than the fastest digital computer in existence. An artificial nerve cell consists of five parts: inputs, weights, addition function, activation function, and outputs. Inputs are data coming to the neuron, multiplied by the weight of the connections they come from, and sent to the nucleus. The sum function calculates the cell's net input by adding up the inputs by multiplying them by the weights. The action function takes the weighted sum of all inputs in the previous layer, generates an output value, and passes it to the next layer. 
