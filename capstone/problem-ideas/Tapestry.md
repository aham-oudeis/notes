## Tapestry
Problem Domain: Data Pipeline

### Core Problem
How to share information between different apps?

Data goes in to various providers but does not come out. But companies are interested in: __combining data (aggregation)__ that are in various silos and __dispersing (syncing)__ relevant data to other third-party destinations. A critical subproblem for aggregation: data stored by various apps cannot be fetched with a simply query, but they must be retrived via unique REST APIs

A company using many different services would have the data stored in different tools: __salesforce__, __stripe__, __shopify__, __zoom__, etc. Different tools collect and store data in their own ways. That means, the data is distributed.

![[Pasted image 20220921160925.png]]

As a company, a holistic understanding of the data is necessary for analytics. That is, the company is interested in integrated data. 

Integrated data only facilitates analytics. Say, you've gained some insights based on the analytics. 

	Translating those insights into actions still faces various challenges

For instance, you may have found that certain customers base who complained about not having a feature are likely to subscribe to an upgraded plan where those features are available. How to promote the new plan to those specific customers?

### Solutions

1. Use prebuilt connectors: Zapier
- Connect the apps, either through third-party vendor or through the app itself
		- No fine grain control over which app can access which data

2. Use custom connectors
- You gain fine grained control over the data, but you would have to invest on engineers to do this laborious work for you.
- Not a bad idea if the apps that you are connecting are small in number

However, using custom connectors might end up in a web of connectors. Since each connection requires supervision, this kind of sprawling system is trouble waiting to happen.
![[Pasted image 20220921164648.png]]

3. Build a user data pipeline 

As we see consistently, if there is a web, put something in the middle:

[![[Pasted image 20220921165209.png]]

Even in the domain of pipeline, there are some tradeoffs to consider. Going with a fully managed produced like RudderStack implies not having control over the infrastructure. But creating your own implies spending a substantial amount of engineering time.
