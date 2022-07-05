## Chapter 4: Topic modelling Twitter data

This is a repository containing the code used to gather data and generate topic models presented in Chapter 4 of my dissertation: Include reference to TU repository.

Each analytical step has its own code file - this is both to make the code more readable a searchable as well as it capturing the reality of the analytical process: Some analytical steps like data collection will generally take place on a dedicated server and happen separately from other analytical steps. The codebooks follow this ordering:
1. Collection: Script that collects tweets from Twitter's streaming API
2. Pre-processing: Script that pre-processes the data by removing unwanted tweets
 - Removed users: A script that identifies users that are 'missing' from Twitter and summarizes the content from tehse users (assumption being that those users are bots, but that assumption does not hold for data at hand)
3. Processing: Lemmatization of tweets (and a stemming alternative)
4. LDA&NMF Models: Training LDA & NMF models including visualisation
 - Coherence: Script that trains multiple LDA models, calculates their coherence metrics, and generates a plot (used to generate figure 3 in the paper)
5. STM: Script used to generate CTM and STM models
 - Export for STM script: A script used to save processed data (processing is doen in python) into feather, which can be easily read and utilized in R. This is what generates the dataframe file the STM script loads.
6. Corpus sub-sections: A script that generates the two corpus sub-sections described in the paper, trains an LDA model based on them, and generates a list of most representative tweets. 
