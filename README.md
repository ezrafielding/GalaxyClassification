# The Classification of Optical Galaxy Morphology Using Unsupervised Learning Techniques
## Abstract
The advent of large scale, data intensive astronomical surveys has caused the viability of human-based galaxy morphology classification methods to come into question. Put simply, too much astronomical data is being produced for scientists to visually label. Attempts have been made to crowd-source this work by recruiting volunteers from the general public. However, even these efforts will soon fail to keep up with data produced by modern surveys. Unsupervised learning techniques are of interest as they do not require existing labels to classify data and could pave the way to unplanned discoveries. Therefore, this project aims to implement unsupervised learning algorithms to classify the Galaxy Zoo DECaLS dataset without human supervision. First, the Galaxy DECaLS classifier is re-implemented to provide a baseline comparison. The selection of a core network architecture for this classifier is also investigated. Finally, the unsupervised learning approach proposed in this paper is applied. A convolutional autoencoder is implemented as a feature extractor. The extracted features are then clustered via k-means clustering to provide classifications. The results are compared to the Galaxy DECaLS classifier baseline. It was found that the unsupervised approach proposed in this paper provides valuable insights and results that are useful to scientists.

## Supervised Learning
The code, notebooks and logs associated with the supervised learning section of this project can be found in the ```supervised_learning``` directory.

The Zoobot library can be found here: https://github.com/mwalmsley/zoobot

The alternate versions of Zoobot used for the architecture comparison can be found here: https://github.com/Virodroid/zoobotAlt

## Unsupervised Learning
The code, notebooks and logs associated with the unsupervised learning section of this project can be found in the ```unsupervised_learning``` directory.
The autoencoder Python files can be found there, along with the Jupyter Notebook used for k-means clustering.

## Data Prep
The ```data_prep``` directory contains the Notebooks required for creating a working dataset.
The Galaxy DECaLS files are required for this to work. They can be found on [Zenodo](https://zenodo.org/record/4573248)

## Logs and Jobs
The ```logs``` and ```jobs``` contain the log files from ilifu and Lengau and the job files for ilifu and Lengau, respectively.
