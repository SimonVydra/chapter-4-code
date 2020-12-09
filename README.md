## Topic modelling Twitter data: Code for review

This is a temporary repository for peer-review purposes. The code is still subject to review and its description is only sufficient to reproduce all analytically steps mentioned in the paper under review.

Each analytical step has its own code file - this is both to make the code more readable a searchable as well as it capturing the reality of the analytical process: Some analytical steps like data collection will generally take place on a dedicated server and happen separately from other analyticla steps. The codebooks follow this ordering:
1. Collection: Script that collects tweets from Twitter's streaming API
2. Pre-processing: Script that pre-processes the data by removing unwanted tweets
 - Removed users: A script that identifies users that are 'missing' from Twitter and summarizes the content from tehse users (assumption being that those users are bots, but that assumption does not hold for data at hand)
3. Processing: Lemmatization of tweets (and a stemmign alternative)
4. LDA&NMF Models: Training LDA & NMF models including visualisation
 - Coherence: Script that trains multiple LDA models, calculates their coherence metrics, and generates a plot (used to generate figure 3 in the paper)
5. STM: Script used to generate CTM and STM models
 - Export for STM script: A script used to save processed data (processing is doen in python) into feather, which can be easily read and utilized in R. This is what generates the dataframe file the STM script loads.
6. Corpus sub-sections: A script that generates the two corpus sub-sections described in the paper, trains an LDA mdoel based on them, and generates a list of most representative tweets. 
