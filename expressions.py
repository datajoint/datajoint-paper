male_mice = Animal & dict(species='mouse', sex='male')   
rel = Recording & male_mice & (LFP & 'sampling_rate>10000')   
