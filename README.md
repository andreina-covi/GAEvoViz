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

The default script to run the visualization is:

```Smalltalk
GAEvoViz new
	populations: populations; 
	populationFileName: csvPopulationFilename;
	run.
```

 Optionally you can assign the metric and similarity file .csv, then you add any or both of the following lines before the call `run` on the script.
 
 ```Smalltalk
 metricFileName: csvMetricFilename;
 similarityFilename: csvSimilarityFilename;
 ```
 
 Furthermore, if the goal of the fitness value is the increasing, then you need to add the following instruction (before the call `run`).
 
 ```Smalltalk
 comparisonSelector: #<;
 ```
 
 By default the comparison selector is `>`, that means that individuals with higher fitness value will be highlighted.
 
 ## Demo
 
 
