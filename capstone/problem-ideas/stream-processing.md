Event stream processing completely overturn the order of the traditional analytics procedure. Generally, events occur and are stored somewhere. Then some analytics are performed on the stored data. Even stream processing is all about processing the events as they are generated.

Consider Apache Kafka: Built in LinkedIn by Jay Krepps, Jun Rao, and Neha Narkade

## Before Kafka

The large volume of data from the website had to be fitted into the lambda architecture for real-time processing. That required moving large amounts of data from source to a data warehouse where the data could be analyzed. But moving around large amounts of data for data-processing was rather difficult. 

While there were existing solutions for getting into offline batch systems, but those solutions used push system that could potentially overwhelm a consumer. And they were not designed for the real-time use cases.

Kafka solves the problem by making use of pub/sub strategy of message delivery and keeping logs for storing data.

 It allows for a faster reaction time and creates the opportunity for proactive measures to be taken before a situation is over.

Sub-Problems:
1. How to ensure the order of the messages?
2. How to address node failure when brokers are distributed?

> For example, Netflix started out writing its own ingestion framework that dumped data into Amazon S3 and used Hadoop to run batch analytics of video streams, UI activities, performance events, and diagnostic events to help drive feedback about user experience. As the demand for real-time (sub-minute) analytics grew, Netflix moved to using Kafka as its primary backbone for ingestion. [source](https://www.linkedin.com/pulse/kafkas-origin-story-linkedin-tanvir-ahmed/)

> Real-time systems such as the traditional messaging queues (think ActiveMQ, RabbitMQ, etc.) have great delivery guarantees and support things such as transactions, protocol mediation, and message consumption tracking, but they are overkill for the use case LinkedIn had in mind. Everyone (including LinkedIn) wants to build fancy machine-learning algorithms, but without the data, the algorithms are useless. Getting the data from source systems and reliably moving it around was very difficult, and existing batch-based solutions and enterprise messaging solutions did not solve the problem. [source](https://www.linkedin.com/pulse/kafkas-origin-story-linkedin-tanvir-ahmed/)

> Apache ActiveMQ is an open-source, multi-protocol, Java-based messaging server. It implements the JMS (Java Message Service) API and is able to support various messaging protocols, including AMQP, STOMP, and MQTT. It is commonly used for sending messages between applications/services. In this topic, we are going to learn about ActiveMQ vs Kafka. [source](https://www.educba.com/activemq-vs-kafka/)

> Additional functionalities such as message TTLs, non-persistent messaging, request-response messaging, correlation ID selectors, etc. are all perfectly valid messaging use cases where Kafka would not be a good fit.


Enables:
1. Continuous flow of data
2. Applications can focus on the data themselves rather than the trouble of sharing and transferring data
How to send messages to another system taking into consideration that there a lot of nodes fail.

Event stream processing processes events at the moment they occur, completely changing the order of the traditional analytics procedure. It allows for a faster reaction time and creates the opportunity for proactive measures to be taken before a situation is over.

Message queue 
1. Point to point queue
2. Enterprise service bus
3. Pub/sub approach

It seems like distributed message queues are necessary for microservices architecture. The ones with the most valuable features require lots and lots of configuration, but if you want a fully managed ones, then you will have to pay for the service. If there could be a free version that is fully managed, then that would be a fantastic thing.

Google's pubsub seems like an option for smaller-scale applications

### Sources
Jonathan Johnson, 2022, https://www.bmc.com/blogs/event-stream-processing/
Srishty Bhardwaj, 2022, https://hevodata.com/learn/pulsar-vs-kafka/
Olivia Iannone, 2021, https://towardsdatascience.com/re-evaluating-kafka-issues-and-alternatives-for-real-time-395573418f27