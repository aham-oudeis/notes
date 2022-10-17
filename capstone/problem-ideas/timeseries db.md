## Time series DB
###  Problem
1. How to store timestamps data that comes in high volume and with high velocity?

> Self-driving cars typically collect about [4,000 GB](https://www.information-age.com/tconnected-car-data-explosion-123473363) of data per day. 

2. How to efficiently extract insights from the massive amount of data?

Time series databases are meant to handle high volume of data that are append only. 

They are (allegedly) optimized for timestamp or time-series data. Generally, they are used for storing time-dependent data for observability purposes.
1. financial data
2. data in hospitals (electrocardiograms) 
3. data from sensors   
4. data from distributed nodes.  
 
 Companies: TimScaleDb, InfluxDB, Amazon TimeStream, CrateDB

### Tension between Insight and Cardinality
Basically, to have richer insights, you need to observe the system along multiple dimensions; but adding more dimensions to your metric only explodes the unique values generated, putting strain on storage and efficient computation.

__Dimensionality__ refers to the number of attributes associated with a particular datapoint.
__Cardinality__ refers to the number of possible unique values for a record. (permutations of all the possible unique values for each attribute)

For a data to be informative, the data has to be granular: we should be able to isolate the specific element that is responsible for generating that data.

It would be more informative to be able to find if there are correlation between problems. Which attributes are correlated with the problems? For example, is the node slow because of some endpoint (that has sluggish query) or because of the number of requests or some other cause?

For this we would want to gather data for a source across different dimensions (increasing dimensionality) and unique identifiers for the values (thus increasing cardinality). But his increases cardinality and high cardinality puts strain on storage and compute.

![[Pasted image 20220922213625.png]]

This is only based on one metric of status codes.

To allow for more storage, we would have to limit the number of unique identifiers for the specific data point. Or, if we want to have high cardinality (lots of unique identifiers), then we would have to compromise on how much data we store.

### Unique features of timestamps data (source Outlyer)
1.  most data is only queried in the last hour. That is, most of the data become stale after the first hour.
2.  data is immutable.
3.  some data loss here and there is ok
4.  most data don't change between readings: (facilitates compression)

### Core Solution
- time compression: Delta-delta encoding, Simple-8b, Run-length encoding, Dictionary compression, XOR-based compression
- time-series databases can be configured to give data elements a specific time to live. Others will use a round-robin algorithm to store a fixed set.

### Some questions to consider while using time series db
1. How to reduce cardinality of the dataset?
2. What metrics provide good enough insight while mitigating high cardinality?

### **Resources**
1. https://geekflare.com/time-series-database/
2. https://davidgildeh.com/2018/11/06/why-not-to-build-a-time-series-database/
3. https://chronosphere.io/learn/what-is-high-cardinality/
4. https://www.timescale.com/blog/what-is-high-cardinality-how-do-time-series-databases-influxdb-timescaledb-compare/
5. https://newrelic.com/blog/best-practices/why-observability-requires-high-cardinality-data
6. https://towardsdatascience.com/dealing-with-features-that-have-high-cardinality-1c9212d7ff1b