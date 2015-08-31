# Share Graph Creator
## Features
 * Generate graphs from share price data using R.
 * Plots Closing Price and PE ratio data.
 * Generate either a graph per data file, or aggregate data and generate a single graph (useful for creating a graph for a basket of shares, e.g. for an ETF).
 * Supports data in Standard Bank Online Share Trading format.
 * Example graph: [Capitec](https://github.com/tfoxcroft/r-plot-share-data/blob/master/plots/StatisticsHistory-CAPITEC-2015-07-15.xls.svg)

## How to use Share Graph Creator
 * Install R
 * Install R Studio
 * Open either createGraphPerFile.R or createAggregateGraph.R in R Studio
 * Update the path (line 3) to point to the directory containing your Share Price data
 * Run the script (Code -> Run Region -> Run All)
