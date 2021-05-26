# GAEvoViz
Visualization of GA evolution

## Installation

```Smalltalk
Metacello new
 baseline:'GAEvoViz';
 repository: 'github://andreina-covi/GAEvoViz:main/src';
 load.
```

## Script

```Smalltalk
GAEvoViz new
	populations: populations; 
	populationFileName: csvPopulationFilename;
	run.
	```
 
 Optionally you can assign the metric and similarity file .csv.
 
 ```Smalltalk
 metricFileName: csvMetricFilename;
	similarityFilename: csvSimilarityFilename;
 ```
